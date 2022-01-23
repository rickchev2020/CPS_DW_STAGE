SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[spMergeEmployerVitality] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'spMergeEmployerVitality'
	declare @ExecutingUser varchar(100) = SUSER_NAME()
	
	merge into [CPS_DW].[dbo].[EmployerVitality] as tgt -- target table
	using (
		SELECT
		[EmployerNumber]
		,[LegacyVitalityCode]
		,[EmployerDistrict]
		,[BranchCode]
		,[StrategyCode]
		,[EligibleWorkerCode]
		,cast([NonChpStartDate] as date) as [NonChpStartDate] -- YYYYMMDD
		,cast([NonChpEndDate] as date) as [NonChpEndDate] -- YYYYMMDD
		,[DwInsertDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwUpdateDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
		FROM [CPS_DW_STAGE].[dbo].[EmployerVitality]
	) as src
	on tgt.[EmployerNumber] = src.[EmployerNumber]

	-- Mark deleted rows as not current
	--when not matched by source
	--then delete

	-- Insert new rows
	when not matched 
	then insert (
		[EmployerNumber]
		,[LegacyVitalityCode]
		,[EmployerDistrict]
		,[BranchCode]
		,[StrategyCode]
		,[EligibleWorkerCode]
		,[NonChpStartDate]
		,[NonChpEndDate]
		,[DwInsertDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwUpdateDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
	) values(
		src.[EmployerNumber]
		,src.[LegacyVitalityCode]
		,src.[EmployerDistrict]
		,src.[BranchCode]
		,src.[StrategyCode]
		,src.[EligibleWorkerCode]
		,src.[NonChpStartDate]
		,src.[NonChpEndDate]
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
		isnull(src.[LegacyVitalityCode], '') <> isnull(tgt.[LegacyVitalityCode],'')
		or isnull(src.[EmployerDistrict], '') <> isnull(tgt.[EmployerDistrict],'')
		or isnull(src.[BranchCode], '') <> isnull(tgt.[BranchCode],'')
		or isnull(src.[StrategyCode], '') <> isnull(tgt.[StrategyCode],'')
		or isnull(src.[EligibleWorkerCode], '') <> isnull(tgt.[EligibleWorkerCode],'')
		or isnull(src.[NonChpStartDate], '') <> isnull(tgt.[NonChpStartDate],'')
		or isnull(src.[NonChpEndDate], '') <> isnull(tgt.[NonChpEndDate],'')
	)
	then
	update -- Update records that have a new updated record
		set tgt.[LegacyVitalityCode] = src.[LegacyVitalityCode]
		, tgt.[EmployerDistrict] = src.[EmployerDistrict]
		, tgt.[BranchCode] = src.[BranchCode]
		, tgt.[StrategyCode] = src.[StrategyCode]
		, tgt.[EligibleWorkerCode] = src.[EligibleWorkerCode]
		, tgt.[NonChpStartDate] = src.[NonChpStartDate]
		, tgt.[NonChpEndDate] = src.[NonChpEndDate]
		, tgt.DwUpdateDate = @RunTime
		, tgt.DwUpdateUsername = @ExecutingUser
		, tgt.DwUpdateProcessName = @ProcessName
	;
end
GO
