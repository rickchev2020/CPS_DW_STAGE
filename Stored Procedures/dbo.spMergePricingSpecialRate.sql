SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



create procedure [dbo].[spMergePricingSpecialRate] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()));
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())));
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime);
	declare @RunTime datetime = GETDATE();
	declare @ProcessName varchar(100) = 'spMergePricingSpecialRate';
	declare @ExecutingUser varchar(100) = SUSER_NAME();
	
	with [RateData]
	as
	(
		SELECT 
			pcr.[Year] as [RateYear]
			,bp.BenefitPlanId
			,[EmployerNumber]
			,[Self] as [EEONLY]
			,[SelfSpouse] as [EESPOUSE]
			,[SelfChild] as [EECHILD]
			,[Family] as [EEFAMILY]
			,[Child] as [CHONLY]
			,[Spouse] as [SPONLY]
			,[SpouseChild] as [SPCHILD]
		FROM [CPS_DW_STAGE].[dbo].[PricingSpecialRates] pcr
		join [CPS_DW].[dbo].[BenefitPlan] bp
			on bp.BenefitPlanCode = pcr.PlanCode
				and ((bp.BenefitCode like 'MED%'
					and pcr.BenefitId like 'MED%')
					or (bp.BenefitCode like 'VIS%'
					and pcr.BenefitId like 'VIS%')
					or (bp.BenefitCode like 'DEN%'
					and pcr.BenefitId like 'DEN%'))
	), [RatePivot] as (
		select
			[RateYear]
			,[BenefitPlanId]
			,[EmployerNumber]
			,[CoverageOptionCode]
			,[RateAmt]
		from
		(
			select
				[RateYear]
				,[BenefitPlanId]
				,[EmployerNumber]
				,[EEONLY]
				,[EESPOUSE]
				,[EECHILD]
				,[EEFAMILY]
				,[CHONLY]
				,[SPONLY]
				,[SPCHILD]
			from [RateData] rp
		) as SourceTable
		unpivot
		(
			[RateAmt] for [CoverageOptionCode] in(
				[EEONLY]
				,[EESPOUSE]
				,[EECHILD]
				,[EEFAMILY]
				,[CHONLY]
				,[SPONLY]
				,[SPCHILD])
		) as UnpivotTable
		where [CoverageOptionCode] is not null
	)
	merge into [CPS_DW].[dbo].[PricingSpecialRate] as tgt -- target table
	using (
		select
			[RateYear]
			,[BenefitPlanId]
			,[EmployerNumber]
			,[CoverageOptionId]
			,[RateAmt]
		from [RatePivot] rp
		join [CPS_DW].[dbo].[CoverageOption] co
			on co.[CoverageOptionCode] = rp.[CoverageOptionCode]
	) as src
	on tgt.[RateYear] = src.[RateYear]
		and tgt.[BenefitPlanId] = src.[BenefitPlanId]
		and tgt.[EmployerNumber] = src.[EmployerNumber]
		and tgt.[CoverageOptionId] = src.[CoverageOptionId]
	-- Mark deleted rows as not current
	when not matched by source
	then delete

	-- Insert new rows
	when not matched 
	then insert (
		[RateYear]
		,[BenefitPlanId]
		,[EmployerNumber]
		,[CoverageOptionId]
		,[RateAmt]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwInsertDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
		,[DwUpdateDate]
	) values(
		src.[RateYear]
		,src.[BenefitPlanId]
		,src.[EmployerNumber]
		,src.[CoverageOptionId]
		,src.[RateAmt]
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
		isnull(src.[RateAmt], '') <> isnull(tgt.[RateAmt],'')
	)
	then
	update -- Update records that have a new updated record
		set tgt.[RateAmt] = src.[RateAmt]
		, tgt.DwUpdateUsername = @ExecutingUser
		, tgt.DwUpdateProcessName = @ProcessName
		, tgt.DwUpdateDate = @RunTime
	;
end
GO
