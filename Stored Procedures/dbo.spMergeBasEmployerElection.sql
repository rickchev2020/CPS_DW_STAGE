SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[spMergeBasEmployerElection] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'spMergeBasEmployerElection'
	declare @ExecutingUser varchar(100) = SUSER_NAME()
	
	merge into [CPS_DW].[dbo].[BasEmployerElection] as tgt -- target table
	using (
		select
			[ERNumber]
			,[EmployerFullName]
			,[PlanYear]
			,[FederalEIN]
			,[WorkZipCode]
			,[Exempt_NonExempt]
			,[QCCOIndicator]
			,[LimitedAdoptionIndicator]
			,[CDSPEligIndicator]
			,[SuppLifeEligIndicator]
			,[AccidentInsuranceEligIndicator]
			,[CriticalIllnessEligIndicator]
			,[ADDEligIndicator]
			,[CRPPlanTraditional]
			,[CRPPlanAccountOption]
			,[CRPWaitingPeriodFlag]
			,[CRPAcctOptionEligFactor]
			,[CRSPElig]
			,[CHPMEDHours]
			,[CHPDENHours]
			,[CHPVISHours]
			,[ICAccess]
			,[PayFrequency]
			,[CategoryofActualparticipation]
			,[AOLastEffectiveDate]
			,[AOOriginalEffectiveDate]
			,[ChangeDate]
			,[EffectiveDate]
			,[Med1]
			,[Med2]
			,[Med3]
			,[GEOBlue_Option1]
			,[GEOBlue_Option2]
			,[DentalUnbundled]
			,[DentalBundledNonHMO]
			,[DentalBundledHMO]
			,[GEOBlueDental]
			,[VisionUnbundled]
			,[VisionBundled]
			,[GEOBlueVision]
			,[PSA]
		from CPS_DW_STAGE.dbo.BasEmployerElection
	) as src
	on tgt.[ERNumber] = src.[ERNumber]

	-- Mark deleted rows as not current
	when not matched by source
	then delete

	-- Insert new rows
	when not matched 
	then insert (
		[ERNumber]
		,[EmployerFullName]
		,[PlanYear]
		,[FederalEIN]
		,[WorkZipCode]
		,[Exempt_NonExempt]
		,[QCCOIndicator]
		,[LimitedAdoptionIndicator]
		,[CDSPEligIndicator]
		,[SuppLifeEligIndicator]
		,[AccidentInsuranceEligIndicator]
		,[CriticalIllnessEligIndicator]
		,[ADDEligIndicator]
		,[CRPPlanTraditional]
		,[CRPPlanAccountOption]
		,[CRPWaitingPeriodFlag]
		,[CRPAcctOptionEligFactor]
		,[CRSPElig]
		,[CHPMEDHours]
		,[CHPDENHours]
		,[CHPVISHours]
		,[ICAccess]
		,[PayFrequency]
		,[CategoryofActualparticipation]
		,[AOLastEffectiveDate]
		,[AOOriginalEffectiveDate]
		,[ChangeDate]
		,[EffectiveDate]
		,[Med1]
		,[Med2]
		,[Med3]
		,[GEOBlue_Option1]
		,[GEOBlue_Option2]
		,[DentalUnbundled]
		,[DentalBundledNonHMO]
		,[DentalBundledHMO]
		,[GEOBlueDental]
		,[VisionUnbundled]
		,[VisionBundled]
		,[GEOBlueVision]
		,[PSA]
		,[DwInsertDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwUpdateDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
	) values(
		src.[ERNumber]
		,src.[EmployerFullName]
		,src.[PlanYear]
		,src.[FederalEIN]
		,src.[WorkZipCode]
		,src.[Exempt_NonExempt]
		,src.[QCCOIndicator]
		,src.[LimitedAdoptionIndicator]
		,src.[CDSPEligIndicator]
		,src.[SuppLifeEligIndicator]
		,src.[AccidentInsuranceEligIndicator]
		,src.[CriticalIllnessEligIndicator]
		,src.[ADDEligIndicator]
		,src.[CRPPlanTraditional]
		,src.[CRPPlanAccountOption]
		,src.[CRPWaitingPeriodFlag]
		,src.[CRPAcctOptionEligFactor]
		,src.[CRSPElig]
		,src.[CHPMEDHours]
		,src.[CHPDENHours]
		,src.[CHPVISHours]
		,src.[ICAccess]
		,src.[PayFrequency]
		,src.[CategoryofActualparticipation]
		,src.[AOLastEffectiveDate]
		,src.[AOOriginalEffectiveDate]
		,src.[ChangeDate]
		,src.[EffectiveDate]
		,src.[Med1]
		,src.[Med2]
		,src.[Med3]
		,src.[GEOBlue_Option1]
		,src.[GEOBlue_Option2]
		,src.[DentalUnbundled]
		,src.[DentalBundledNonHMO]
		,src.[DentalBundledHMO]
		,src.[GEOBlueDental]
		,src.[VisionUnbundled]
		,src.[VisionBundled]
		,src.[GEOBlueVision]
		,src.[PSA]
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
		isnull(src.[EmployerFullName], '') <> isnull(tgt.[EmployerFullName],'')
		or isnull(src.[PlanYear], '') <> isnull(tgt.[PlanYear],'')
		or isnull(src.[FederalEIN], '') <> isnull(tgt.[FederalEIN],'')
		or isnull(src.[WorkZipCode], '') <> isnull(tgt.[WorkZipCode],'')
		or isnull(src.[Exempt_NonExempt], '') <> isnull(tgt.[Exempt_NonExempt],'')
		or isnull(src.[QCCOIndicator], '') <> isnull(tgt.[QCCOIndicator],'')
		or isnull(src.[LimitedAdoptionIndicator], '') <> isnull(tgt.[LimitedAdoptionIndicator],'')
		or isnull(src.[CDSPEligIndicator], '') <> isnull(tgt.[CDSPEligIndicator],'')
		or isnull(src.[SuppLifeEligIndicator], '') <> isnull(tgt.[SuppLifeEligIndicator],'')
		or isnull(src.[AccidentInsuranceEligIndicator], '') <> isnull(tgt.[AccidentInsuranceEligIndicator],'')
		or isnull(src.[CriticalIllnessEligIndicator], '') <> isnull(tgt.[CriticalIllnessEligIndicator],'')
		or isnull(src.[ADDEligIndicator], '') <> isnull(tgt.[ADDEligIndicator],'')
		or isnull(src.[CRPPlanTraditional], '') <> isnull(tgt.[CRPPlanTraditional],'')
		or isnull(src.[CRPPlanAccountOption], '') <> isnull(tgt.[CRPPlanAccountOption],'')
		or isnull(src.[CRPWaitingPeriodFlag], '') <> isnull(tgt.[CRPWaitingPeriodFlag],'')
		or isnull(src.[CRPAcctOptionEligFactor], '') <> isnull(tgt.[CRPAcctOptionEligFactor],'')
		or isnull(src.[CRSPElig], '') <> isnull(tgt.[CRSPElig],'')
		or isnull(src.[CHPMEDHours], '') <> isnull(tgt.[CHPMEDHours],'')
		or isnull(src.[CHPDENHours], '') <> isnull(tgt.[CHPDENHours],'')
		or isnull(src.[CHPVISHours], '') <> isnull(tgt.[CHPVISHours],'')
		or isnull(src.[ICAccess], '') <> isnull(tgt.[ICAccess],'')
		or isnull(src.[PayFrequency], '') <> isnull(tgt.[PayFrequency],'')
		or isnull(src.[CategoryofActualparticipation], '') <> isnull(tgt.[CategoryofActualparticipation],'')
		or isnull(src.[AOLastEffectiveDate], '') <> isnull(tgt.[AOLastEffectiveDate],'')
		or isnull(src.[AOOriginalEffectiveDate], '') <> isnull(tgt.[AOOriginalEffectiveDate],'')
		or isnull(src.[ChangeDate], '') <> isnull(tgt.[ChangeDate],'')
		or isnull(src.[EffectiveDate], '') <> isnull(tgt.[EffectiveDate],'')
		or isnull(src.[Med1], '') <> isnull(tgt.[Med1],'')
		or isnull(src.[Med2], '') <> isnull(tgt.[Med2],'')
		or isnull(src.[Med3], '') <> isnull(tgt.[Med3],'')
		or isnull(src.[GEOBlue_Option1], '') <> isnull(tgt.[GEOBlue_Option1],'')
		or isnull(src.[GEOBlue_Option2], '') <> isnull(tgt.[GEOBlue_Option2],'')
		or isnull(src.[DentalUnbundled], '') <> isnull(tgt.[DentalUnbundled],'')
		or isnull(src.[DentalBundledNonHMO], '') <> isnull(tgt.[DentalBundledNonHMO],'')
		or isnull(src.[DentalBundledHMO], '') <> isnull(tgt.[DentalBundledHMO],'')
		or isnull(src.[GEOBlueDental], '') <> isnull(tgt.[GEOBlueDental],'')
		or isnull(src.[VisionUnbundled], '') <> isnull(tgt.[VisionUnbundled],'')
		or isnull(src.[VisionBundled], '') <> isnull(tgt.[VisionBundled],'')
		or isnull(src.[GEOBlueVision], '') <> isnull(tgt.[GEOBlueVision],'')
		or isnull(src.[PSA], '') <> isnull(tgt.[PSA],'')
	)
	then
	update -- Update records that have a new updated record
		set tgt.[EmployerFullName] = src.[EmployerFullName]
		, tgt.[PlanYear] = src.[PlanYear]
		, tgt.[FederalEIN] = src.[FederalEIN]
		, tgt.[WorkZipCode] = src.[WorkZipCode]
		, tgt.[Exempt_NonExempt] = src.[Exempt_NonExempt]
		, tgt.[QCCOIndicator] = src.[QCCOIndicator]
		, tgt.[LimitedAdoptionIndicator] = src.[LimitedAdoptionIndicator]
		, tgt.[CDSPEligIndicator] = src.[CDSPEligIndicator]
		, tgt.[SuppLifeEligIndicator] = src.[SuppLifeEligIndicator]
		, tgt.[AccidentInsuranceEligIndicator] = src.[AccidentInsuranceEligIndicator]
		, tgt.[CriticalIllnessEligIndicator] = src.[CriticalIllnessEligIndicator]
		, tgt.[ADDEligIndicator] = src.[ADDEligIndicator]
		, tgt.[CRPPlanTraditional] = src.[CRPPlanTraditional]
		, tgt.[CRPPlanAccountOption] = src.[CRPPlanAccountOption]
		, tgt.[CRPWaitingPeriodFlag] = src.[CRPWaitingPeriodFlag]
		, tgt.[CRPAcctOptionEligFactor] = src.[CRPAcctOptionEligFactor]
		, tgt.[CRSPElig] = src.[CRSPElig]
		, tgt.[CHPMEDHours] = src.[CHPMEDHours]
		, tgt.[CHPDENHours] = src.[CHPDENHours]
		, tgt.[CHPVISHours] = src.[CHPVISHours]
		, tgt.[ICAccess] = src.[ICAccess]
		, tgt.[PayFrequency] = src.[PayFrequency]
		, tgt.[CategoryofActualparticipation] = src.[CategoryofActualparticipation]
		, tgt.[AOLastEffectiveDate] = src.[AOLastEffectiveDate]
		, tgt.[AOOriginalEffectiveDate] = src.[AOOriginalEffectiveDate]
		, tgt.[ChangeDate] = src.[ChangeDate]
		, tgt.[EffectiveDate] = src.[EffectiveDate]
		, tgt.[Med1] = src.[Med1]
		, tgt.[Med2] = src.[Med2]
		, tgt.[Med3] = src.[Med3]
		, tgt.[GEOBlue_Option1] = src.[GEOBlue_Option1]
		, tgt.[GEOBlue_Option2] = src.[GEOBlue_Option2]
		, tgt.[DentalUnbundled] = src.[DentalUnbundled]
		, tgt.[DentalBundledNonHMO] = src.[DentalBundledNonHMO]
		, tgt.[DentalBundledHMO] = src.[DentalBundledHMO]
		, tgt.[GEOBlueDental] = src.[GEOBlueDental]
		, tgt.[VisionUnbundled] = src.[VisionUnbundled]
		, tgt.[VisionBundled] = src.[VisionBundled]
		, tgt.[GEOBlueVision] = src.[GEOBlueVision]
		, tgt.[PSA] = src.[PSA]
		, tgt.DwUpdateDate = @RunTime
		, tgt.DwUpdateUsername = @ExecutingUser
		, tgt.DwUpdateProcessName = @ProcessName
	;
end
GO
