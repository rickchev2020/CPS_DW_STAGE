SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[SpLoadRetirementPensionEstimate] AS 
BEGIN

	WITH PensionEstimate AS (
		SELECT 
			CASE
				WHEN [EffectiveDate] NOT LIKE '%[^0-9/]%'
				THEN CAST([EffectiveDate] AS DATE) 
				ELSE NULL
				END AS [EffectiveDate]
			,[FirstName]
			,[MiddleName]
			,[LastName]
			,CASE
				WHEN [EmployeeID] NOT LIKE '%[^0-9]%'
				THEN CAST([EmployeeID] AS INTEGER) 
				ELSE NULL
				END AS [MemberNumber]
			,CASE
				WHEN [SystemID] NOT LIKE '%[^0-9.]%'
				THEN CAST([SystemID] AS DECIMAL(6,0)) 
				ELSE NULL
				END AS [ExternalRecordId]
			,CASE
				WHEN [BirthDate] NOT LIKE '%[^0-9/]%'
				THEN CAST([BirthDate] AS DATE) 
				ELSE NULL
				END AS [Birthdate]
			,[ManualCalcFlag]
			,[ErrorStatus]
			,[PlanName]
			,[SubplanName] AS [SubPlanName]
			,[PlanStatus]
			,[PlanSubstatus]
			,CASE
				WHEN [OrigHireDate] NOT LIKE '%[^0-9/]%'
				THEN CAST([OrigHireDate] AS DATE) 
				ELSE NULL
				END AS [OriginalHireDate]
			,[EmploymentStatus] AS [ExternalEmploymentStatus]
			,[EmployementSubstatus] AS [MemberStatus]
			,[CalcSubPlan] AS [SubPlan]
			,CASE
				WHEN [Calc4BenefitService] NOT LIKE '%[^0-9.]%'
					AND [Calc4BenefitService] LIKE '%.%'
				THEN CAST([Calc4BenefitService] AS DECIMAL(6,4)) 
				WHEN [Calc4BenefitService] NOT LIKE '%[^0-9.]%'
				THEN CAST([Calc4BenefitService] + '.0' AS DECIMAL(6,4)) 
				ELSE 0.0
				END AS [BenefitServiceYears]
			,CASE
				WHEN [Calc4VestingService] NOT LIKE '%[^0-9.]%'
					AND [Calc4VestingService] LIKE '%.%'
				THEN CAST([Calc4VestingService] AS DECIMAL(6,4)) 
				WHEN [Calc4VestingService] NOT LIKE '%[^0-9.]%'
				THEN CAST([Calc4VestingService] + '.0' AS DECIMAL(6,4)) 
				ELSE 0.0
				END AS [VestingServiceYears]
			,CASE
				WHEN [Calc5BenefitService] NOT LIKE '%[^0-9.]%'
					AND [Calc5BenefitService] LIKE '%.%'
				THEN CAST([Calc5BenefitService] AS DECIMAL(6,4)) 
				WHEN [Calc5BenefitService] NOT LIKE '%[^0-9.]%'
				THEN CAST([Calc5BenefitService] + '.0' AS DECIMAL(6,4)) 
				ELSE 0.0
				END AS [BenefitServiceYearsAt67]
			,CASE
				WHEN [Calc5VestingService] NOT LIKE '%[^0-9.]%'
					AND [Calc5VestingService] LIKE '%.%'
				THEN CAST([Calc5VestingService] AS DECIMAL(6,4)) 
				WHEN [Calc5VestingService] NOT LIKE '%[^0-9.]%'
				THEN CAST([Calc5VestingService] + '.0' AS DECIMAL(6,4)) 
				ELSE 0.0
				END AS [VestingServiceYearsAt67]
			,CASE
				WHEN [Calc5NRCD] NOT LIKE '%[^0-9/]%'
					AND ([Calc5NRCD] LIKE '_/_/____' 
						OR [Calc5NRCD] LIKE '__/__/____'
						OR [Calc5NRCD] LIKE '_/__/____'
						OR [Calc5NRCD] LIKE '__/_/____'
						)
				THEN CAST([Calc5NRCD] AS DATE) 
				ELSE NULL
				END AS [NormalRetirementCommencementDate]
			,CASE
				WHEN [Calc5BCD] NOT LIKE '%[^0-9/]%'
					AND ([Calc5BCD] LIKE '_/_/____' 
						OR [Calc5BCD] LIKE '__/__/____'
						OR [Calc5BCD] LIKE '_/__/____'
						OR [Calc5BCD] LIKE '__/_/____'
						)
				THEN CAST([Calc5BCD] AS DATE) 
				ELSE NULL
				END AS [BenefitCommencementDate]
			,CASE
				WHEN [Calc5RCALSatBCD] NOT LIKE '%[^0-9.]%'
					AND [Calc5RCALSatBCD] LIKE '%.%'
				THEN CAST([Calc5RCALSatBCD] AS DECIMAL(9,2)) 
				WHEN [Calc5RCALSatBCD] NOT LIKE '%[^0-9.]%'
				THEN CAST([Calc5RCALSatBCD] + '.0' AS DECIMAL(9,2)) 
				ELSE 0.0
				END AS [RcaLumpSumAtBcd]
			,CASE
				WHEN [Calc5VESTDATE] NOT LIKE '%[^0-9/]%'
					AND ([Calc5VESTDATE] LIKE '_/_/____' 
						OR [Calc5VESTDATE] LIKE '__/__/____'
						OR [Calc5VESTDATE] LIKE '_/__/____'
						OR [Calc5VESTDATE] LIKE '__/_/____'
						)
				THEN CAST([Calc5VESTDATE] AS DATE) 
				ELSE NULL
				END AS [MemberVestingDate]
			,CASE
				WHEN [Calc5QualifiedAggregatePRBBenBenefit] NOT LIKE '%[^0-9.]%'
					AND [Calc5QualifiedAggregatePRBBenBenefit] LIKE '%.%'
				THEN CAST([Calc5QualifiedAggregatePRBBenBenefit] AS DECIMAL(9,2)) 
				WHEN [Calc5QualifiedAggregatePRBBenBenefit] NOT LIKE '%[^0-9.]%'
				THEN CAST([Calc5QualifiedAggregatePRBBenBenefit] + '.0' AS DECIMAL(9,2)) 
				ELSE 0.0
				END AS [QualifiedAggregatePrbBenefit]
			,CASE
				WHEN REPLACE([Calc5J70], ',', '') NOT LIKE '%[^0-9.]%'
					AND [Calc5J70] LIKE '%.%'
				THEN CAST(REPLACE([Calc5J70], ',', '') AS DECIMAL(9,2)) 
				WHEN REPLACE([Calc5J70], ',', '') NOT LIKE '%[^0-9.]%'
				THEN CAST(REPLACE([Calc5J70], ',', '') + '.0' AS DECIMAL(9,2)) 
				ELSE 0.0
				END AS [Joint70PercentSurvivorAmt]
			,'[CPS_DW_STAGE].[dbo].[WtwPensionEstimateFile]' AS [DwSourceName]
			,GETDATE() AS [DwInsertDate]
			,SYSTEM_USER AS [DwInsertUsername]
			,'SpLoadRetirementPensionEstimate' AS [DwInsertProcessName]
			,GETDATE() AS [DwUpdateDate]
			,SYSTEM_USER AS [DwUpdateUsername]
			,'SpLoadRetirementPensionEstimate' AS [DwUpdateProcessName]
		FROM [CPS_DW_STAGE].[dbo].[WtwPensionEstimateFile]
		WHERE [EffectiveDate] NOT LIKE '%[^0-9/]%'
	)
	INSERT INTO [CPS_DW].[dbo].[RetirementPensionEstimate]
		([EffectiveDate]
		,[FirstName]
		,[MiddleName]
		,[LastName]
		,[MemberNumber]
		,[ExternalRecordId]
		,[Birthdate]
		,[ManualCalcFlag]
		,[ErrorStatus]
		,[PlanName]
		,[SubPlanName]
		,[PlanStatus]
		,[PlanSubstatus]
		,[OriginalHireDate]
		,[ExternalEmploymentStatus]
		,[MemberStatus]
		,[SubPlan]
		,[BenefitServiceYears]
		,[VestingServiceYears]
		,[BenefitServiceYearsAt67]
		,[VestingServiceYearsAt67]
		,[NormalRetirementCommencementDate]
		,[BenefitCommencementDate]
		,[RcaLumpSumAtBcd]
		,[MemberVestingDate]
		,[QualifiedAggregatePrbBenefit]
		,[Joint70PercentSurvivorAmt]
		,[DwSourceName]
		,[DwInsertDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwUpdateDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName])
	SELECT 
		[EffectiveDate]
		,[FirstName]
		,[MiddleName]
		,[LastName]
		,[MemberNumber]
		,[ExternalRecordId]
		,[Birthdate]
		,[ManualCalcFlag]
		,[ErrorStatus]
		,[PlanName]
		,[SubPlanName]
		,[PlanStatus]
		,[PlanSubstatus]
		,[OriginalHireDate]
		,[ExternalEmploymentStatus]
		,[MemberStatus]
		,[SubPlan]
		,[BenefitServiceYears]
		,[VestingServiceYears]
		,[BenefitServiceYearsAt67]
		,[VestingServiceYearsAt67]
		,[NormalRetirementCommencementDate]
		,[BenefitCommencementDate]
		,[RcaLumpSumAtBcd]
		,[MemberVestingDate]
		,[QualifiedAggregatePrbBenefit]
		,[Joint70PercentSurvivorAmt]
		,[DwSourceName]
		,[DwInsertDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwUpdateDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
	FROM PensionEstimate
		WHERE DwInsertDate = (SELECT COALESCE(MAX(DwInsertDate), '01/01/1900') FROM PensionEstimate)
			AND CAST([EffectiveDate] AS DATE) = (SELECT COALESCE(MAX([EffectiveDate]), CAST('01/01/1900' AS DATE)) FROM PensionEstimate)
			AND CAST([EffectiveDate] AS DATE) > (SELECT COALESCE(MAX([EffectiveDate]), CAST('01/01/1900' AS DATE)) FROM [CPS_DW].[dbo].[RetirementPensionEstimate])

	END;
GO
