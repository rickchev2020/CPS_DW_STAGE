SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[spMergeRetirementPlanDeferral] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'spMergeRetirementPlanDeferral'
	declare @ExecutingUser varchar(100) = SUSER_NAME()
	
	merge into [CPS_DW].[dbo].[RetirementPlanDeferral] as tgt -- target table
	using (
		SELECT
			right('00000' + pro.[grpNumber_unique], 5) as EmployerNumber
			,dem.LawsonEmployeeId as MemberNumber
			,pro.[pret_deferral] as PreTaxDeferral
			,pro.[roth_deferral] as RothDeferral
			,pro.[total_deferral] as TotalDeferral
			,EOMONTH(cast(pro.[ebso_date] as date)) as EffectiveDate
		FROM [CPS_DW_STAGE].[dbo].[ProManageVisionDeferral] pro
		join [CPS_DW].[dbo].[BasMemberDemographic] dem
			on dem.ETLRowIsCurrent = 1
				and dem.[EmployeeSsn] = pro.[ssns_unique]
		where dem.LawsonEmployeeId is not null
	) as src
	on tgt.[MemberNumber] = src.MemberNumber
		and tgt.[EmployerNumber] = src.EmployerNumber
		and tgt.[EffectiveDate] = src.EffectiveDate

	-- Mark deleted rows as not current
	--when not matched by source
	--then delete

	-- Insert new rows
	when not matched 
	then insert (
		[MemberNumber]
		,[EmployerNumber]
		,[PreTaxDeferral]
		,[RothDeferral]
		,[TotalDeferral]
		,[EffectiveDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwInsertDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
		,[DwUpdateDate]
	) values(
		src.[MemberNumber]
		,src.[EmployerNumber]
		,src.[PreTaxDeferral]
		,src.[RothDeferral]
		,src.[TotalDeferral]
		,src.[EffectiveDate]
		,@ExecutingUser -- DwInsertUsername
		,@ProcessName -- DwInsertProcessName
		,@RunTime -- DwInsertDate
		,@ExecutingUser -- DwUpdateUsername
		,@ProcessName -- DwUpdateProcessName
		,@RunTime -- DwUpdateDate
	)

	when matched
	AND ( 
		-- Find matched records to update
		-- Dont include the keys or the created date
		isnull(src.[PreTaxDeferral], '') <> isnull(tgt.[PreTaxDeferral],'')
		or isnull(src.[RothDeferral], '') <> isnull(tgt.[RothDeferral],'')
		or isnull(src.[TotalDeferral], '') <> isnull(tgt.[TotalDeferral],'')
	)
	then
	update -- Update records that have a new updated record
		set tgt.[PreTaxDeferral] = src.[PreTaxDeferral]
		, tgt.[RothDeferral] = src.[RothDeferral]
		, tgt.[TotalDeferral] = src.[TotalDeferral]
		, tgt.DwUpdateUsername = @ExecutingUser
		, tgt.DwUpdateProcessName = @ProcessName
		, tgt.DwUpdateDate = @RunTime
	;
end
GO
