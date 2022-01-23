SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[spMergeOpenEnrollmentElection] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'spMergeOpenEnrollmentElection'
	declare @ExecutingUser varchar(100) = SUSER_NAME()
	
	merge into [CPS_DW].[dbo].[OpenEnrollmentElection] as tgt -- target table
	using (
		SELECT distinct
			left([Employer ID], 5) as [EmployerNumber]
			,[CPS Member ID] as [MemberNumber]
			,[Benefit Name] as [BenefitName]
			,[Plan Name] as [PlanName]
			,[Tier Option Name] as [TierOptionName]
			,[Elected Amount] as [ElectedAmount]
			,[EE Inforce Cost Per Month] as [MemberInforceCostPerMonth]
			,[ER Inforce Cost Per Month] as [EmployerInforceCostPerMonth]
			,[Change Reason] as [ChangeReason]
		FROM [CPS_DW_STAGE].[dbo].[OpenEnrollmentElection]
		where [Employer ID] is not null
			and [CPS Member ID] is not null
	) as src
	on tgt.[EmployerNumber] = src.[EmployerNumber]
		and tgt.[MemberNumber] = src.[MemberNumber]
		and tgt.[BenefitName] = src.[BenefitName]
		and tgt.[PlanName] = src.[PlanName]

	-- Mark deleted rows as not current
	when not matched by source
	then delete

	-- Insert new rows
	when not matched 
	then insert (
		[EmployerNumber]
		,[MemberNumber]
		,[BenefitName]
		,[PlanName]
		,[TierOptionName]
		,[ElectedAmount]
		,[MemberInforceCostPerMonth]
		,[EmployerInforceCostPerMonth]
		,[ChangeReason]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwInsertDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
		,[DwUpdateDate]
	) values(
		src.[EmployerNumber]
		,src.[MemberNumber]
		,src.[BenefitName]
		,src.[PlanName]
		,src.[TierOptionName]
		,src.[ElectedAmount]
		,src.[MemberInforceCostPerMonth]
		,src.[EmployerInforceCostPerMonth]
		,src.[ChangeReason]
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
		isnull(src.[TierOptionName], '') <> isnull(tgt.[TierOptionName], '')
		or isnull(src.[ElectedAmount], 0) <> isnull(tgt.[ElectedAmount], 0)
		or isnull(src.[MemberInforceCostPerMonth], 0) <> isnull(tgt.[MemberInforceCostPerMonth], 0)
		or isnull(src.[EmployerInforceCostPerMonth], 0) <> isnull(tgt.[EmployerInforceCostPerMonth], 0)
		or isnull(src.[ChangeReason], '') <> isnull(tgt.[ChangeReason], '')
	)
	then
	update -- Update records that have a new updated record
		set tgt.[TierOptionName] = src.[TierOptionName]
		, tgt.[ElectedAmount] = src.[ElectedAmount]
		, tgt.[MemberInforceCostPerMonth] = src.[MemberInforceCostPerMonth]
		, tgt.[EmployerInforceCostPerMonth] = src.[EmployerInforceCostPerMonth]
		, tgt.[ChangeReason] = src.[ChangeReason]
		, tgt.DwUpdateUsername = @ExecutingUser
		, tgt.DwUpdateProcessName = @ProcessName
		, tgt.DwUpdateDate = @RunTime
	;
end
GO
