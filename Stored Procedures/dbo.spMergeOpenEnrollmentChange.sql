SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE procedure [dbo].[spMergeOpenEnrollmentChange] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'spMergeOpenEnrollmentChange'
	declare @ExecutingUser varchar(100) = SUSER_NAME()
	
	merge into [CPS_DW].[dbo].[OpenEnrollmentChange] as tgt -- target table
	using (
		SELECT
			left([Employer ID], 5) as [EmployerNumber]
			,[CPS Member ID] as [MemberNumber]
			,[Current Coverage Effective Date] as [CurrentCoverageEffectiveDate]
			,[Current benefit Name] as [CurrentBenefitName]
			,[Current Plan Name] as [CurrentPlanName]
			,[Current Tier Option name] as [CurrentTierOptionName]
			,[Current Elected Amount] as [CurrentElectedAmount]
			,[current pended Amount] as [CurrentPendedAmount]
			,[inforce Benefit Amount] as [InforceBenefitAmount]
			,[Election Cost per Month] as [ElectionCostPerMonth]
			,[Employer Cost per month] as [EmployerCostPerMonth]
			,[OE Benefit Name] as [ElectedBenefitName]
			,[OE Plan Name] as [ElectedPlanName]
			,[OE Tier Option name] as [ElectedTierOptionName]
			,[OE Coverage Effective Date] as [ElectedCoverageEffectiveDate]
			,[OE Elected Amount] as [ElectedElectedAmount]
			,[OE Amount Pended] as [ElectedAmountPended]
			,[OE Inforce Initial Benefit Amount] as [ElectedInforceInitialBenefitAmount]
			,[OE Election Cost per Month] as [ElectedElectionCostPerMonth]
			,[OE Employer Cost per Month] as [ElectedEmployerCostPerMonth]
			,[Change Type] as [ChangeType]
		FROM [CPS_DW_STAGE].[dbo].[OpenEnrollmentChange]
		where [Employer ID] is not null
			and [CPS Member ID] is not null
	) as src
	on tgt.[EmployerNumber] = src.[EmployerNumber]
		and tgt.[MemberNumber] = src.[MemberNumber]
		and tgt.[CurrentBenefitName] = src.[CurrentBenefitName]
		and tgt.[CurrentPlanName] = src.[CurrentPlanName]
		and tgt.[ElectedBenefitName] = src.[ElectedBenefitName]
		and tgt.[ElectedPlanName] = src.[ElectedPlanName]

	-- Mark deleted rows as not current
	when not matched by source
	then delete

	-- Insert new rows
	when not matched 
	then insert (
		[EmployerNumber]
		,[MemberNumber]
		,[CurrentCoverageEffectiveDate]
		,[CurrentBenefitName]
		,[CurrentPlanName]
		,[CurrentTierOptionName]
		,[CurrentElectedAmount]
		,[CurrentPendedAmount]
		,[InforceBenefitAmount]
		,[ElectionCostPerMonth]
		,[EmployerCostPerMonth]
		,[ElectedBenefitName]
		,[ElectedPlanName]
		,[ElectedTierOptionName]
		,[ElectedCoverageEffectiveDate]
		,[ElectedElectedAmount]
		,[ElectedAmountPended]
		,[ElectedInforceInitialBenefitAmount]
		,[ElectedElectionCostPerMonth]
		,[ElectedEmployerCostPerMonth]
		,[ChangeType]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwInsertDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
		,[DwUpdateDate]
	) values(
		src.[EmployerNumber]
		,src.[MemberNumber]
		,src.[CurrentCoverageEffectiveDate]
		,src.[CurrentBenefitName]
		,src.[CurrentPlanName]
		,src.[CurrentTierOptionName]
		,src.[CurrentElectedAmount]
		,src.[CurrentPendedAmount]
		,src.[InforceBenefitAmount]
		,src.[ElectionCostPerMonth]
		,src.[EmployerCostPerMonth]
		,src.[ElectedBenefitName]
		,src.[ElectedPlanName]
		,src.[ElectedTierOptionName]
		,src.[ElectedCoverageEffectiveDate]
		,src.[ElectedElectedAmount]
		,src.[ElectedAmountPended]
		,src.[ElectedInforceInitialBenefitAmount]
		,src.[ElectedElectionCostPerMonth]
		,src.[ElectedEmployerCostPerMonth]
		,src.[ChangeType]
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
		isnull(src.[CurrentCoverageEffectiveDate], '') <> isnull(tgt.[CurrentCoverageEffectiveDate],'')
		or isnull(src.[CurrentTierOptionName], '') <> isnull(tgt.[CurrentTierOptionName],'')
		or isnull(src.[CurrentElectedAmount], 0) <> isnull(tgt.[CurrentElectedAmount],0)
		or isnull(src.[CurrentPendedAmount], 0) <> isnull(tgt.[CurrentPendedAmount],0)
		or isnull(src.[InforceBenefitAmount], 0) <> isnull(tgt.[InforceBenefitAmount],0)
		or isnull(src.[ElectionCostPerMonth], 0) <> isnull(tgt.[ElectionCostPerMonth],0)
		or isnull(src.[EmployerCostPerMonth], 0) <> isnull(tgt.[EmployerCostPerMonth],0)
		or isnull(src.[ElectedTierOptionName], '') <> isnull(tgt.[ElectedTierOptionName],'')
		or isnull(src.[ElectedCoverageEffectiveDate], '') <> isnull(tgt.[ElectedCoverageEffectiveDate],'')
		or isnull(src.[ElectedElectedAmount], 0) <> isnull(tgt.[ElectedElectedAmount],0)
		or isnull(src.[ElectedAmountPended], '') <> isnull(tgt.[ElectedAmountPended],'')
		or isnull(src.[ElectedInforceInitialBenefitAmount], 0) <> isnull(tgt.[ElectedInforceInitialBenefitAmount],0)
		or isnull(src.[ElectedElectionCostPerMonth], 0) <> isnull(tgt.[ElectedElectionCostPerMonth],0)
		or isnull(src.[ElectedEmployerCostperMonth], 0) <> isnull(tgt.[ElectedEmployerCostperMonth],0)
		or isnull(src.[ChangeType], '') <> isnull(tgt.[ChangeType],'')
	)
	then
	update -- Update records that have a new updated record
		set tgt.[CurrentCoverageEffectiveDate] = src.[CurrentCoverageEffectiveDate]
		, tgt.[CurrentTierOptionName] = src.[CurrentTierOptionName]
		, tgt.[CurrentElectedAmount] = src.[CurrentElectedAmount]
		, tgt.[CurrentPendedAmount] = src.[CurrentPendedAmount]
		, tgt.[InforceBenefitAmount] = src.[InforceBenefitAmount]
		, tgt.[ElectionCostPerMonth] = src.[ElectionCostPerMonth]
		, tgt.[EmployerCostPerMonth] = src.[EmployerCostPerMonth]
		, tgt.[ElectedTierOptionName] = src.[ElectedTierOptionName]
		, tgt.[ElectedCoverageEffectiveDate] = src.[ElectedCoverageEffectiveDate]
		, tgt.[ElectedElectedAmount] = src.[ElectedElectedAmount]
		, tgt.[ElectedAmountPended] = src.[ElectedAmountPended]
		, tgt.[ElectedInforceInitialBenefitAmount] = src.[ElectedInforceInitialBenefitAmount]
		, tgt.[ElectedElectionCostPerMonth] = src.[ElectedElectionCostPerMonth]
		, tgt.[ElectedEmployerCostPerMonth] = src.[ElectedEmployerCostPerMonth]
		, tgt.[ChangeType] = src.[ChangeType]
		, tgt.DwUpdateUsername = @ExecutingUser
		, tgt.DwUpdateProcessName = @ProcessName
		, tgt.DwUpdateDate = @RunTime
	;
end
GO
