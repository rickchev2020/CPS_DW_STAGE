SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[SpBasBillingCreateZn722File]
	@FileType int
	--Types: 
	--		1 = Extensions
	--		2 = Supplemental Life
	--		3 = Extensions Errors
	--		4 = Supplemental Life Errors
	--		5 = Pension Deductions

AS
BEGIN
	SET NOCOUNT ON;

	--------------------------------------------------------------------------------------------------------------------------------
	---- PRIMARY BILLING FILE FILTERING AND LOGIC
	--------------------------------------------------------------------------------------------------------------------------------
	WITH EmployeeService AS (
			SELECT DISTINCT
				billingFile.Ssn,
				DATEDIFF(MONTH, CONVERT(DATE, billingFile.CrpAdjServiceDate), CONVERT(DATE, billingFile.BillingStartDate)) AS [MonthsOfService]
			FROM [CPS_DW_STAGE].[dbo].[BasIncomingBillingFileGroup] billingFile
	),
	BillingFileBase AS (
			SELECT  
				billingfile.BasIncomingBillingFileGroupId
				, billingFile.MemberAction
				, billingFile.Ssn
				, billingfile.FirstName
				, billingfile.LastName
				, billingFile.PlanExchangeId
				, billingFile.PrimarySubscriberExchangeId
				, billingFile.SecurianDirectBill
				, planCodes.LawsonPlanType
				, CASE planCodes.PlanExchangeId
					WHEN 'CRP-CRPT'      
					THEN
						CASE planCodes.CrpFullRegularBasis 
								WHEN 'Y' THEN 'PFS'
								WHEN 'N' THEN 'PRS'
						END
					WHEN 'CRP-CRPA'
					THEN 
						CASE billingFile.CrpWaitingPeriodFlag
								WHEN 'Y' THEN 
										CASE  -- Service in months
											WHEN (employeeService.MonthsOfService <= 12) THEN 'PAE' -- 0-12
											WHEN (employeeService.MonthsOfService >= 13 AND employeeService.MonthsOfService <= 60) THEN 'PAN' -- 13-60
											WHEN (employeeService.MonthsOfService >= 60) THEN 'PAV' -- 61+
										END           
								WHEN 'N'THEN 
										CASE -- Service in months
											WHEN (employeeService.MonthsOfService <= 60) THEN 'PAN' -- 0-60
											WHEN (employeeService.MonthsOfService >= 61) THEN 'PAV' -- 61+
										END
						END    
					ELSE planCodes.LawsonPlanCode
					END AS [LawsonPlanCode]
					, CASE billingfile.CoverageLevel
						WHEN 'EEONLY' THEN 1
						WHEN 'EESPOUSE' THEN 2
						WHEN 'EECHILD' THEN 3
						WHEN 'EEFAMILY' THEN 4
						WHEN 'CHONLY' THEN 5
						WHEN 'SPONLY' THEN 6
						WHEN 'SPCHILD' THEN 7
						ELSE 0
						END AS [CoverOpt]
					, CAST(COALESCE(NULLIF(TotalAcr, ''), '0.00') AS DECIMAL(13,4)) AS [PayRate]
					, CAST(COALESCE(NULLIF(AnnualCost, ''), '0.00') AS DECIMAL(13,4)) AS [EmpAftCont]
					, CAST(CoverageStartDate AS DATETIME) AS [StartDate]
					, CAST(CASE  
								WHEN LTRIM(RTRIM(BillingEndDate)) = '12/31/2999' THEN '12/31/9999'
								ELSE BillingEndDate
							END AS DATETIME) AS [StopDate]
					, employee.EMPLOYEE AS [LawsonEmployee]
					, CASE LEFT(planCodes.LawsonPlanCode, 1) 
							WHEN 'P' THEN 1
							ELSE 0
					  END AS [IsCrpBenefit]
					, CoverageLevel
			FROM [CPS_DW_STAGE].[dbo].[BasIncomingBillingFileGroup] billingFile
			LEFT JOIN [CPS_DW_STAGE].[dbo].[BasIncomingBillingPlanCodes] planCodes 
				ON	planCodes.PlanExchangeId = billingFile.PlanExchangeID 
					AND (billingFile.PlanExchangeID <> 'CRP-CRPT' 
					OR (billingFile.PlanExchangeID = 'CRP-CRPT' 
						AND plancodes.CrpFullRegularBasis = COALESCE(billingfile.CrpFullRegularBasis, 'N'))) -- only apply CrpFullRegularBasis to CRP-CRPT
			JOIN EmployeeService employeeService 
				ON	employeeService.Ssn = billingFile.Ssn
			LEFT JOIN [CPS_DW].dbo.DIM_EMPLOYEE employee 
				ON	REPLACE(employee.FICA_NBR, '-', '') = billingFile.Ssn 
					AND employee.ETLRowIsCurrent = 1  -- Get member number with SSN
			WHERE LawsonPlanCode <> 'TRAV' 
	)


	------------------------------------------------------------------------------------------------------------------------------
	-- LOAD BASE BILLING FILE INFO TO TEMP TABLE FOR PERFORMANCE 
	------------------------------------------------------------------------------------------------------------------------------
	
	SELECT
		1000 AS [COMPANY]
		, LawsonEmployee AS [EMPLOYEE]
		, CAST(LawsonPlanType AS varchar(100)) AS PLAN_TYPE
		, CAST(LawsonPlanCode AS varchar(100)) AS PLAN_CODE
		, CoverOpt AS COV_OPTION
		, PayRate AS PAY_RATE
		, CASE 
			WHEN StartDate < '1/1/2019' THEN '1/1/2019'
			ELSE StartDate
		  END AS START_DATE
		, EmpAftCont AS EMP_AFT_CONT
		, StopDate AS STOP_DATE
		, CoverageLevel
		, MemberAction
		, PlanExchangeId
		, Ssn
		, FirstName
		, LastName
		, SecurianDirectBill
		, PrimarySubscriberExchangeId
	INTO #BasBillingLawsonFormatted
	FROM BillingFileBase

	CREATE CLUSTERED INDEX IDX_C_BasBillingLawsonFormatted ON #BasBillingLawsonFormatted
		([COMPANY],[EMPLOYEE],PLAN_TYPE,PLAN_CODE,COV_OPTION,PAY_RATE,START_DATE,EMP_AFT_CONT,STOP_DATE)

	---------------------------------------------------------------------------------------------
	-- Create File Extract
	---------------------------------------------------------------------------------------------
	
	SELECT 
		AUDIT_ACTION_CODE AS [Fc_Audit]
		, CASE MemberAction
			WHEN '021' THEN 'A'
			ELSE 'C'
		  END AS [Fc]
		, COMPANY AS [Company]
		, EMPLOYEE AS [Employee]
		, PLAN_TYPE AS [PlanType]
		, PLAN_CODE AS [PlanCode]
		--, START_DATE AS [StartDate]
		, FORMAT(CAST(START_DATE AS DATE),'MM-dd-yyyy') as [StartDate]
		, CASE STOP_DATE
			WHEN '9999-12-31' THEN ISNULL(NULL,'') 
			ELSE FORMAT(CAST(STOP_DATE AS DATE),'yyyyMMdd') 
			END AS [StopDate]
		, COV_OPTION AS [CoverOpt]
		, CASE 
			WHEN PLAN_CODE LIKE 'P%' THEN ''
			ELSE LTRIM(RTRIM(EMP_AFT_CONT))
		  END AS [EmpAftCont]
		, '' AS [Spacer]
		, Ssn
		, FirstName
		, LastName
		, PrimarySubscriberExchangeId
		, PlanExchangeId
		
	FROM 
		(
			-- Extensions
			SELECT 'EXTENSION' AS AUDIT_ACTION_CODE, bas.*
			FROM #BasBillingLawsonFormatted bas
			LEFT JOIN BasIncomingBillingPensionDeductions pd on pd.SocialSecurityNumber = bas.Ssn
			WHERE 
				-- Base clause
				pd.SocialSecurityNumber IS NULL
				AND bas.Ssn IS NOT NULL
				-- Extension
				AND bas.PlanExchangeId like '%EXT'
				
			UNION 

			-- Extensions (No SSN match)
			SELECT 'EXTENSION ERROR - SSN MISMATCH' AS AUDIT_ACTION_CODE, bas.*
			FROM #BasBillingLawsonFormatted bas
			LEFT JOIN BasIncomingBillingPensionDeductions pd on pd.SocialSecurityNumber = bas.Ssn
			WHERE 
				-- Base clause
				pd.SocialSecurityNumber IS NULL
				-- Extension
				AND bas.PlanExchangeId like '%EXT'
				-- Errors
				AND bas.EMPLOYEE IS NULL -- Did not find social match
				
			UNION

			-- Extensions (Errors - No plan code match)
			SELECT 'EXTENSION ERROR - PLAN CODE' AS AUDIT_ACTION_CODE, bas.*
			FROM #BasBillingLawsonFormatted bas
			LEFT JOIN BasIncomingBillingPensionDeductions pd on pd.SocialSecurityNumber = bas.Ssn
			WHERE 
				-- Base clause
				pd.SocialSecurityNumber IS NULL
				AND bas.Ssn IS NOT NULL
				-- Extension
				AND bas.PlanExchangeId like '%EXT'
				-- Errors
				AND bas.PLAN_CODE IS NULL -- Did not find plan code match

			UNION 

			-- Supplemental Life
			SELECT 'SUPP LIFE' AS AUDIT_ACTION_CODE, bas.*
			FROM #BasBillingLawsonFormatted bas
			LEFT JOIN BasIncomingBillingPensionDeductions pd on pd.SocialSecurityNumber = bas.Ssn
			WHERE 
				-- Base clause
				pd.SocialSecurityNumber IS NULL
				AND bas.Ssn IS NOT NULL
				-- Supplemental Life
				AND (
					bas.SecurianDirectBill = 'Y' and 
						(
							bas.PlanExchangeId like 'CHILDLIFE-%' 
							or bas.PlanExchangeId like 'SPOUSELIFE-%' 
							or bas.PlanExchangeId like 'SUPPLIFE-%'
						)
					) 
			
			UNION 

			-- Supplemental Life (Errors - No SSN match)
			SELECT 'SUPP LIFE ERROR - SSN MISMATCH' AS AUDIT_ACTION_CODE, bas.*
			FROM #BasBillingLawsonFormatted bas
			LEFT JOIN BasIncomingBillingPensionDeductions pd on pd.SocialSecurityNumber = bas.Ssn
			WHERE 
				-- Base clause
				pd.SocialSecurityNumber IS NULL
				AND bas.Ssn IS NOT NULL
				-- Supplemental Life
				AND (
					bas.SecurianDirectBill = 'Y' and 
						(
							bas.PlanExchangeId like 'CHILDLIFE-%' 
							or bas.PlanExchangeId like 'SPOUSELIFE-%' 
							or bas.PlanExchangeId like 'SUPPLIFE-%'
						)
					)
				-- Errors
				AND bas.EMPLOYEE IS NULL -- Did not find social match

			UNION

			-- Supplemental Life (Errors - No plan code match)
			SELECT 'SUPP LIFE ERROR - PLAN CODE' AS AUDIT_ACTION_CODE, bas.*
			FROM #BasBillingLawsonFormatted bas
			LEFT JOIN BasIncomingBillingPensionDeductions pd on pd.SocialSecurityNumber = bas.Ssn
			WHERE 
				-- Base clause
				pd.SocialSecurityNumber IS NULL
				-- Supplemental Life
				AND bas.Ssn IS NOT NULL
				AND (
					bas.SecurianDirectBill = 'Y' and 
						(
							bas.PlanExchangeId like 'CHILDLIFE-%' 
							or bas.PlanExchangeId like 'SPOUSELIFE-%' 
							or bas.PlanExchangeId like 'SUPPLIFE-%'
						)
					)
				-- Errors
				AND bas.PLAN_CODE IS NULL -- Did not find plan code match
			
			UNION 

			-- Pension Deductions
			SELECT 'PENSION DEDUCTIONS' AS AUDIT_ACTION_CODE, bas.*
			FROM #BasBillingLawsonFormatted bas
			-- Pension Deduction join
			JOIN BasIncomingBillingPensionDeductions pd
				ON pd.SocialSecurityNumber = bas.Ssn
					AND pd.SocialSecurityNumber IS NOT NULL	
			WHERE
				-- Base clause
				bas.Ssn IS NOT NULL

		) Zn722Data
	WHERE 
		(@FileType = 1 AND (AUDIT_ACTION_CODE = 'EXTENSION'))
		OR (@FileType = 2 AND (AUDIT_ACTION_CODE = 'SUPP LIFE'))
		OR (@FileType = 3 AND (AUDIT_ACTION_CODE LIKE 'EXTENSION ERROR%'))
		OR (@FileType = 4 AND (AUDIT_ACTION_CODE LIKE 'SUPP LIFE ERROR%'))
		OR (@FileType = 5 AND (AUDIT_ACTION_CODE = 'PENSION DEDUCTIONS'))
	ORDER BY AUDIT_ACTION_CODE, EMPLOYEE 

END



GO
