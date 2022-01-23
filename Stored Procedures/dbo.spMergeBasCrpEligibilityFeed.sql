SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[spMergeBasCrpEligibilityFeed] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'spMergeBasCrpEligibilityFeed'
	declare @ExecutingUser varchar(100) = SUSER_NAME()
	
	merge into [CPS_DW_STAGE].[dbo].[BasCrpEligibilityFile] as tgt -- target table
	using (
		select * 
		from (
			select distinct
				'02' as [LINE ID]
				, ltrim(rtrim(replace(ee.FICA_NBR, '-', ''))) as [EMPLOYEE SSN]
				, case -- CRP Option Crosswalk for CRP override
					when hr.A_VALUE = 'ADJUNCT' 
						and (ben.PLAN_CODE = 'PNP' or ben.PLAN_CODE is null)
					then 'NOCRPCDSP'
					when hr.A_VALUE like 'AO PA%'
						and ben.PLAN_CODE like 'PA%'
					then 'CRPA'
					when hr.A_VALUE = 'EXCEPT PFS'
						and ben.PLAN_CODE = 'PFS'
					then 'CRPT'
					when hr.A_VALUE = 'EXCEPT PRS'
						and ben.PLAN_CODE = 'PRS'
					then 'CRPT'
					when hr.A_VALUE = 'NO CRP'
						and (ben.PLAN_CODE = 'PNP' or ben.PLAN_CODE is null)
					then 'NOCRP'
					when hr.A_VALUE = 'NO CRPCDSP'
						and (ben.PLAN_CODE = 'PNP' or ben.PLAN_CODE is null)
					then 'NOCRPCDSP'
					when hr.A_VALUE = 'TO PFS'
						and ben.PLAN_CODE = 'PFS'
					then 'CRPT'
					when hr.A_VALUE = 'TO PRS'
						and ben.PLAN_CODE = 'PRS'
					then 'CRPT'
					end as [CRP Plan Override]
				, cast(coalesce(rate.EMP_RATE / 100, 0) as decimal(4,3)) as [CRP Percentage Rate]
				, case
					when DATEFROMPARTS(year(hr.BEG_DATE), month(hr.BEG_DATE), 1) > DATEFROMPARTS(year(pae.SENIOR_DATE), month(pae.SENIOR_DATE), 1)
					then format(cast(DATEFROMPARTS(year(hr.BEG_DATE), month(hr.BEG_DATE), 1) as date), 'MM/dd/yyyy')
					else format(cast(DATEFROMPARTS(year(pae.SENIOR_DATE), month(pae.SENIOR_DATE), 1) as date), 'MM/dd/yyyy')
					end as [CRP Effective Date]
				, case
					when case
						when DATEFROMPARTS(year(hr.BEG_DATE), month(hr.BEG_DATE), 1) > DATEFROMPARTS(year(pae.SENIOR_DATE), month(pae.SENIOR_DATE), 1)
						then DATEFROMPARTS(year(hr.BEG_DATE), month(hr.BEG_DATE), 1)
						else DATEFROMPARTS(year(pae.SENIOR_DATE), month(pae.SENIOR_DATE), 1)
						end < DATEADD(month, DATEDIFF(month, 0, DATEADD(day, -90, getdate())), 0)
					then 'Y'
					else 'N'
					end as SendToManualProcessing
				--, cast(DATEADD(month, DATEDIFF(month, 0, DATEADD(day, -90, getdate())), 0) as date) as FirstOfMonthRetro90
				--, hr.A_VALUE
				--, ben.PLAN_CODE
				--, ee.EMP_STATUS
			from CPS_DW.dbo.DIM_EMPLOYEE ee
			join CPS_DW.dbo.DIM_PAEMPLOYEE pae
				on pae.ETLRowIsCurrent = 1
					and pae.EMPLOYEE = ee.EMPLOYEE
			left join CPS_DW.dbo.DIM_HRHISTORY hr
				on hr.ETLRowIsCurrent = 1
					and hr.EMPLOYEE = ee.EMPLOYEE
					and hr.FLD_NBR = 2042
			join CPS_DW.dbo.DIM_BENEFIT ben
				on ben.ETLRowIsCurrent = 1
					and ben.EMPLOYEE = ee.EMPLOYEE
					and ben.PLAN_OPTION in(61, 98)
					and (ben.PLAN_CODE like 'PA%' 
						or ben.PLAN_CODE like 'PR%'
						or ben.PLAN_CODE like 'PF%'
						or ben.PLAN_CODE = 'PNP')
					and case
						when DATEFROMPARTS(year(hr.BEG_DATE), month(hr.BEG_DATE), 1) > DATEFROMPARTS(year(pae.SENIOR_DATE), month(pae.SENIOR_DATE), 1)
						then format(cast(DATEFROMPARTS(year(hr.BEG_DATE), month(hr.BEG_DATE), 1) as date), 'MM/dd/yyyy')
						else format(cast(DATEFROMPARTS(year(pae.SENIOR_DATE), month(pae.SENIOR_DATE), 1) as date), 'MM/dd/yyyy')
						end between ben.[START_DATE] and coalesce(nullif(ben.STOP_DATE, '1753-01-01 00:00:00.000'), '12/31/9999')
			left join CPS_DW.dbo.DIM_PREMIUM pre
				on pre.ETLRowIsCurrent = 1
					and pre.PLAN_CODE = ben.PLAN_CODE
					and pre.[START_DATE] = ben.PREM_UPD_DT
					and pre.GROUP_NAME = ben.PREM_GROUP
			left join CPS_DW.dbo.DIM_RATETBLDTL rate
				on rate.ETLRowIsCurrent = 1
					and rate.[START_DATE] = pre.[START_DATE]
					and rate.TABLE_CODE = pre.RATE_TABLE
			where ee.EtlRowIsCurrent = 1
		) detail
		where [CRP Plan Override] is not null
	) as src
	on tgt.[EMPLOYEE SSN] = src.[EMPLOYEE SSN]
		and tgt.[CRP Plan Override] = src.[CRP Plan Override]
		and tgt.[CRP Effective Date] = src.[CRP Effective Date]
	-- Mark deleted rows as not current
	when not matched by source
	then delete

	-- Insert new rows
	when not matched 
	then insert (
		[LINE ID]
		,[EMPLOYEE SSN]
		,[CRP Plan Override]
		,[CRP Percentage Rate]
		,[CRP Effective Date]
		,[SendToManualProcessing]
		,[SourceModifiedDate]
		,[DwSourceName]
		,[DwInsertDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwUpdateDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
	) values(
		src.[LINE ID]
		,src.[EMPLOYEE SSN]
		,src.[CRP Plan Override]
		,src.[CRP Percentage Rate]
		,src.[CRP Effective Date]
		,src.[SendToManualProcessing]
		,@RunTime -- [SourceModifiedDate]
		,@ProcessName -- [DwSourceName]
		,@RunTime -- DwInsertDate
		,@ExecutingUser -- DwInsertUsername
		,@ProcessName -- DwInsertProcessName
		,@RunTime -- DwUpdateDate
		,@ExecutingUser -- DwUpdateUsername
		,@ProcessName -- DwUpdateProcessName
	)

	when matched
	AND ( 
		-- Find matched records to update
		-- Dont include the keys or the created date
		isnull(src.[LINE ID], '') <> isnull(tgt.[LINE ID],'')
		or isnull(src.[CRP Percentage Rate], '') <> isnull(tgt.[CRP Percentage Rate],'')
		or isnull(src.[SendToManualProcessing], '') <> isnull(tgt.[SendToManualProcessing],'')
	)
	then
	update -- Update records that have a new updated record
		set tgt.[LINE ID] = src.[LINE ID]
		, tgt.[CRP Percentage Rate] = src.[CRP Percentage Rate]
		, tgt.[SendToManualProcessing] = src.[SendToManualProcessing]
		, tgt.DwUpdateDate = @RunTime
		, tgt.DwUpdateUsername = @ExecutingUser
		, tgt.DwUpdateProcessName = @ProcessName
	;
end
GO
