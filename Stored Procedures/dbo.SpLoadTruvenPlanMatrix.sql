SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE procedure [dbo].[SpLoadTruvenPlanMatrix] as 
begin

	declare @RunTime datetime = GETDATE()

	delete from [CPS_DW].[dbo].[TruvenPlanMatrix];

	insert into [CPS_DW].[dbo].[TruvenPlanMatrix]
	(	[PlanCode]
		,[PlanLevel]
		,[Status]
		,[PlanDescription]
		,[PlanType]
		,[PlanStartDate]
		,[PlanStopDate]
		,[PlanInsuranceCarrier]
		,[CobraCoveredInd]
		,[RetCoveredInd]
		,[RatingMethod]
		,[DrugPlanCode]
		,[DrugPlanCarrier]
		,[VisionPlanCode]
		,[VisionPlanCarrier]
		,[DentalPlanCode]
		,[DentalPlanCarrier]
		,[MentalHealthCoverageInd]
		,[DentalCoverageInd]
		,[VisionCoverageInd]
		,[DisabilitySurvivorCoverageInd]
		,[MedicalCoverageInd]
		,[DrugCoverageInd]
		,[FullyInsuredMedical]
		,[DwInsertDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwUpdateDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
	)
	SELECT 
		[PlanCode]
		,[PlanLevel]
		,[Status]
		,[PlanDescription]
		,[PlanType]
		,[PlanStartDate]
		,[PlanStopDate]
		,[PlanInsuranceCarrier]
		,[CobraCoveredInd]
		,[RetCoveredInd]
		,[RatingMethod]
		,[DrugPlanCode]
		,[DrugPlanCarrier]
		,[VisionPlanCode]
		,[VisionPlanCarrier]
		,[DentalPlanCode]
		,[DentalPlanCarrier]
		,[MentalHealthCoverageInd]
		,[DentalCoverageInd]
		,[VisionCoverageInd]
		,[DisabilitySurvivorCoverageInd]
		,[MedicalCoverageInd]
		,[DrugCoverageInd]
		,[FullyInsuredMedical]
		,@RunTime as [DwInsertDate]
		,SYSTEM_USER as [DwInsertUsername]
		,'SpLoadTruvenPlanMatrix' as [DwInsertProcessName]
		,@RunTime as [DwUpdateDate]
		,SYSTEM_USER as [DwUpdateUsername]
		,'SpLoadTruvenPlanMatrix' as [DwUpdateProcessName]
	FROM [CPS_DW_STAGE].[dbo].[TruvenPlanMatrix]

	end;


GO
