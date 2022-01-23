SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[SpBasBillingCreateBn531File]
	@FileType int
	--Types: 
	--		1 = Normal
	--		2 = Audits
	--		3 = Reverse Adds

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
				, billingFile.PlanExchangeId
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
			JOIN  [CPS_DW_STAGE].[dbo].[BasIncomingBillingPlanCodes] planCodes 
				ON	planCodes.PlanExchangeId = billingFile.PlanExchangeID 
					AND (billingFile.PlanExchangeID <> 'CRP-CRPT' 
					OR (billingFile.PlanExchangeID = 'CRP-CRPT' 
						AND plancodes.CrpFullRegularBasis = COALESCE(billingfile.CrpFullRegularBasis, 'N'))) -- only apply CrpFullRegularBasis to CRP-CRPT
			JOIN  EmployeeService employeeService 
				ON	employeeService.Ssn = billingFile.Ssn
			JOIN  [CPS_DW].dbo.DIM_EMPLOYEE employee 
				ON	REPLACE(employee.FICA_NBR, '-', '') = billingFile.Ssn 
					AND employee.ETLRowIsCurrent = 1  -- Get member number with SSN
			WHERE 
				billingFile.PlanExchangeID NOT LIKE '%EXT' 
				AND (
						(billingFile.SecurianDirectBill = 'N')
						OR 
						(billingFile.SecurianDirectBill = 'Y' AND 
							(billingfile.PlanExchangeId not LIKE 'CHILDLIFE-%' 
								AND billingfile.PlanExchangeId not LIKE 'SPOUSELIFE-%' 
								AND billingfile.PlanExchangeId not LIKE 'SUPPLIFE-%')) 
					)

	)


	------------------------------------------------------------------------------------------------------------------------------
	-- LOAD BASE BILLING FILE INFO TO TEMP TABLE FOR PERFORMANCE AND FOR EASE OF COMPARISON TO LAWSON
	------------------------------------------------------------------------------------------------------------------------------

	SELECT
		1000 AS [COMPANY]
		, [LawsonEmployee] AS [EMPLOYEE]
		, CAST([LawsonPlanType] AS varchar(100)) AS PLAN_TYPE
		, CAST([LawsonPlanCode] AS varchar(100)) AS PLAN_CODE
		, CoverOpt AS COV_OPTION
		, PayRate AS PAY_RATE
		, CASE 
			WHEN StartDate < '1/1/2019' THEN '1/1/2019'
			ELSE StartDate
		  END AS START_DATE
		, EmpAftCont AS EMP_AFT_CONT
		, StopDate AS STOP_DATE
		, CoverageLevel
	INTO #BasBillingLawsonFormatted
	FROM BillingFileBase
	WHERE StopDate BETWEEN '20190101' AND '99991231'

	CREATE CLUSTERED INDEX IDX_C_BasBillingLawsonFormatted ON #BasBillingLawsonFormatted
		([COMPANY],[EMPLOYEE],PLAN_TYPE,PLAN_CODE,COV_OPTION,PAY_RATE,START_DATE,EMP_AFT_CONT,STOP_DATE)


	------------------------------------------------------------------------------------------------------------------------------
	-- LOAD BASE LAWSON BENEFIT INFO TO TEMP TABLE FOR PERFORMANCE AND FOR EASE OF COMPARISON TO BILLING FILE
	------------------------------------------------------------------------------------------------------------------------------
	SELECT 
		ben.COMPANY
		, ben.EMPLOYEE
		, LTRIM(RTRIM(ben.PLAN_TYPE)) COLLATE Latin1_General_CI_AS AS PLAN_TYPE 
		, LTRIM(RTRIM(ben.PLAN_CODE)) COLLATE Latin1_General_CI_AS AS PLAN_CODE 
		, ben.COV_OPTION
		, ben.PAY_RATE
		, ben.START_DATE
		, ben.EMP_AFT_CONT
		, ben.STOP_DATE
	INTO #LawsonBn531Formatted
	FROM CPS_DW.dbo.DIM_BENEFIT ben 
	WHERE 
		ben.ETLRowIsCurrent = 1
		and ben.STOP_DATE = '12/31/9999' or (ben.STOP_DATE <> '12/31/9999' and ben.STOP_DATE >= '1/1/2019')
			

	CREATE CLUSTERED INDEX IDX_C_LawsonBn531Formatted ON #LawsonBn531Formatted
		([COMPANY],[EMPLOYEE],PLAN_TYPE,PLAN_CODE,COV_OPTION,PAY_RATE,START_DATE,EMP_AFT_CONT,STOP_DATE)


	------------------------------------------------------------------------------------------------------------------------------
	-- COLLECT ACTIONS BASED ON BUSINESS LOGIC AND FORMAT
	------------------------------------------------------------------------------------------------------------------------------


	SELECT DISTINCT 
		AUDIT_ACTION_CODE AS [Fc_Audit]
		, ACTION_CODE AS [Fc]
		, COMPANY AS [Company]
		, '' AS [EnrollmentDate]
		, EMPLOYEE AS [Employee]
		, PLAN_TYPE AS [PlanType]
		, PLAN_CODE AS [PlanCode]
		, CASE 
			WHEN PLAN_TYPE IN ('HL','DN') THEN COV_OPTION
			ELSE ''
			END AS [CoverOpt]
		, '' AS [MultSalary]
		, '' AS [CoverAmt]
		, CASE 
			WHEN PLAN_CODE LIKE 'P%' THEN LTRIM(RTRIM(PAY_RATE)) 
			ELSE ''
		  END [PayRate]
		, '' AS [PctAmtFlag]
		, FORMAT(CAST(START_DATE AS DATE),'yyyyMMdd') AS [StartDate]
		, '' AS [PreAftFlag]
		, '' AS [SmokerFlag]
		, '' AS [EmpPreCont]
		, CASE 
			WHEN PLAN_CODE LIKE 'P%' THEN ''
			ELSE LTRIM(RTRIM(EMP_AFT_CONT))
			END AS [EmpAftCont]
		, CASE STOP_DATE
			WHEN '9999-12-31' THEN ISNULL(NULL,'') 
			WHEN '1753-01-01' THEN ISNULL(NULL,'') 
			ELSE FORMAT(CAST(STOP_DATE AS DATE),'yyyyMMdd') 
			END AS [StopDate]
	  	  
	FROM (
		
		-- Adds
		SELECT 'ADD' AS AUDIT_ACTION_CODE, 'A' as ACTION_CODE, bas.*
		FROM #BasBillingLawsonFormatted bas
		LEFT JOIN  #LawsonBn531Formatted law
			ON law.COMPANY = bas.COMPANY
				AND law.EMPLOYEE = bas.EMPLOYEE
				AND law.PLAN_CODE COLLATE Latin1_General_CI_AS = bas.PLAN_CODE
				AND law.PLAN_TYPE COLLATE Latin1_General_CI_AS = bas.PLAN_TYPE
				AND law.START_DATE = bas.START_DATE
			WHERE law.EMPLOYEE IS NULL 
				AND bas.CoverageLevel <> 'WAIVE'
				AND (law.PLAN_CODE NOT LIKE 'P%'
				OR bas.PLAN_CODE NOT LIKE 'P%')

		UNION

		-- Changes
		SELECT 'CHANGE' AS AUDIT_ACTION_CODE, 'C' as ACTION_CODE, bas.*
		FROM #BasBillingLawsonFormatted bas
		JOIN  #LawsonBn531Formatted law
			ON law.COMPANY = bas.COMPANY
				AND law.EMPLOYEE = bas.EMPLOYEE
				AND law.PLAN_CODE COLLATE Latin1_General_CI_AS = bas.PLAN_CODE
				AND law.PLAN_TYPE COLLATE Latin1_General_CI_AS = bas.PLAN_TYPE
				AND law.START_DATE = bas.START_DATE
				AND (						
					((bas.PLAN_CODE NOT LIKE 'P%') AND (law.STOP_DATE <> bas.STOP_DATE) AND (law.STOP_DATE <> '1/1/1753' OR bas.STOP_DATE <> '12/31/9999'))
					OR (bas.PLAN_TYPE IN ('HL','DN') AND law.COV_OPTION <> bas.COV_OPTION)
					OR (law.EMP_AFT_CONT <> bas.EMP_AFT_CONT AND bas.PLAN_CODE not LIKE 'P%')
				)
				AND bas.CoverageLevel <> 'WAIVE'
							

		UNION

		-- CRP Adds (for changes)
		SELECT 'CRP ADD (CHANGE)' AS AUDIT_ACTION_CODE, 'A' as ACTION_CODE, bas.*
		FROM #BasBillingLawsonFormatted bas
		JOIN  #LawsonBn531Formatted law
			ON law.COMPANY = bas.COMPANY
				AND law.EMPLOYEE = bas.EMPLOYEE
				AND law.PLAN_CODE LIKE 'P%'
				AND bas.PLAN_CODE LIKE 'P%'
				AND law.PLAN_CODE COLLATE Latin1_General_CI_AS = bas.PLAN_CODE
				AND law.PLAN_TYPE COLLATE Latin1_General_CI_AS = bas.PLAN_TYPE
				AND law.START_DATE <= bas.START_DATE
				AND law.PAY_RATE <> bas.PAY_RATE
				AND bas.CoverageLevel <> 'WAIVE'
				
		
		UNION

		
		-- True CRP adds
		SELECT DISTINCT 'CRP ADD (NO SPAN IN LAWSON)' AS AUDIT_ACTION_CODE, 'A' as ACTION_CODE, bas.*
		FROM #BasBillingLawsonFormatted bas
		LEFT JOIN  #LawsonBn531Formatted law
			ON law.COMPANY = bas.COMPANY
				AND law.EMPLOYEE = bas.EMPLOYEE
				AND law.PLAN_CODE COLLATE Latin1_General_CI_AS = bas.PLAN_CODE
				AND law.PLAN_TYPE COLLATE Latin1_General_CI_AS = bas.PLAN_TYPE
				AND law.START_DATE = bas.START_DATE
			WHERE law.EMPLOYEE IS NULL 
				AND bas.CoverageLevel <> 'WAIVE'
				AND (law.PLAN_CODE  LIKE 'P%'
				OR bas.PLAN_CODE  LIKE 'P%')


		UNION


		-- CRP Deletes
		SELECT 'CRP DELETE' AS AUDIT_ACTION_CODE, 'D' as ACTION_CODE, law.COMPANY, law.EMPLOYEE, law.PLAN_TYPE COLLATE Latin1_General_CI_AS AS PLAN_TYPE, law.PLAN_CODE COLLATE Latin1_General_CI_AS AS PLAN_CODE, law.COV_OPTION, law.PAY_RATE, law.START_DATE, law.EMP_AFT_CONT, law.STOP_DATE, bas.CoverageLevel
		FROM #BasBillingLawsonFormatted bas
		JOIN  #LawsonBn531Formatted law
			ON law.COMPANY = bas.COMPANY
				AND law.EMPLOYEE = bas.EMPLOYEE
				AND law.PLAN_CODE LIKE 'P%'
				AND bas.PLAN_CODE LIKE 'P%'
				AND law.PLAN_CODE COLLATE Latin1_General_CI_AS = bas.PLAN_CODE
				AND law.PLAN_TYPE COLLATE Latin1_General_CI_AS = bas.PLAN_TYPE
				AND law.START_DATE = bas.START_DATE
				AND law.PAY_RATE <> bas.PAY_RATE
				AND bas.CoverageLevel <> 'WAIVE'

		UNION

		-- CRP Stop Date Change
		SELECT DISTINCT 'CRP STOP DATE CHANGE' AS AUDIT_ACTION_CODE, '' as ACTION_CODE, bas.*
		FROM #BasBillingLawsonFormatted bas
		JOIN  #LawsonBn531Formatted law
			ON law.COMPANY = bas.COMPANY
				AND law.EMPLOYEE = bas.EMPLOYEE
				AND law.PLAN_CODE COLLATE Latin1_General_CI_AS = bas.PLAN_CODE
				AND law.PLAN_TYPE COLLATE Latin1_General_CI_AS = bas.PLAN_TYPE
				AND law.PLAN_CODE LIKE 'P%'
				AND bas.PLAN_CODE LIKE 'P%'
				AND law.START_DATE = bas.START_DATE
				AND ((law.STOP_DATE <> bas.STOP_DATE) AND (law.STOP_DATE <> '1/1/1753' OR bas.STOP_DATE <> '12/31/9999'))
				AND bas.CoverageLevel <> 'WAIVE'

		UNION

		-- Waives Open - Delete
		SELECT 'WAIVES OPEN DELETE' AS AUDIT_ACTION_CODE, 'D' as ACTION_CODE, law.*, bas.CoverageLevel
		FROM #BasBillingLawsonFormatted bas
		JOIN  #LawsonBn531Formatted law
			ON law.COMPANY = bas.COMPANY
				AND law.EMPLOYEE = bas.EMPLOYEE
				AND law.PLAN_CODE COLLATE Latin1_General_CI_AS = bas.PLAN_CODE
				AND law.PLAN_TYPE COLLATE Latin1_General_CI_AS = bas.PLAN_TYPE
				AND law.START_DATE = bas.START_DATE
				AND bas.CoverageLevel = 'WAIVE'

		UNION

		-- Waives Open - Change
		SELECT 'WAIVES OPEN CHANGE' AS AUDIT_ACTION_CODE, 'C' as ACTION_CODE, law.COMPANY, law.EMPLOYEE, law.PLAN_TYPE, law.PLAN_CODE, law.COV_OPTION, law.PAY_RATE, law.START_DATE, law.EMP_AFT_CONT, DATEADD(DAY, -1, bas.START_DATE) as STOP_DATE, bas.CoverageLevel as CoverageLevel
		FROM #BasBillingLawsonFormatted bas
		JOIN  #LawsonBn531Formatted law
			ON law.COMPANY = bas.COMPANY
				AND law.EMPLOYEE = bas.EMPLOYEE
				AND law.PLAN_CODE COLLATE Latin1_General_CI_AS = bas.PLAN_CODE
				AND law.PLAN_TYPE COLLATE Latin1_General_CI_AS = bas.PLAN_TYPE
				AND law.START_DATE < bas.START_DATE
				AND bas.CoverageLevel = 'WAIVE'
	
		UNION

		-- Reverse Adds (in lawson but not bas)
		SELECT 'REVERSE ADD' AS AUDIT_ACTION_CODE, '' as ACTION_CODE, law.*, bas.CoverageLevel
		FROM #LawsonBn531Formatted law
		LEFT JOIN #BasBillingLawsonFormatted bas
			ON law.COMPANY = bas.COMPANY
				AND law.EMPLOYEE = bas.EMPLOYEE
				AND law.PLAN_CODE COLLATE Latin1_General_CI_AS = bas.PLAN_CODE
				AND law.PLAN_TYPE COLLATE Latin1_General_CI_AS = bas.PLAN_TYPE
				AND law.START_DATE = bas.START_DATE
		WHERE bas.EMPLOYEE IS NULL 

		UNION

		-- Audits
		SELECT 'AUDIT' AS AUDIT_ACTION_CODE, '' as ACTION_CODE, bas.*
		FROM #BasBillingLawsonFormatted bas
		JOIN  #LawsonBn531Formatted law
			ON law.COMPANY = bas.COMPANY
				AND law.EMPLOYEE = bas.EMPLOYEE
				AND law.PLAN_CODE COLLATE Latin1_General_CI_AS = bas.PLAN_CODE
				AND law.PLAN_TYPE COLLATE Latin1_General_CI_AS = bas.PLAN_TYPE
				AND law.COV_OPTION = bas.COV_OPTION
				AND law.EMP_AFT_CONT = bas.EMP_AFT_CONT
				AND law.PLAN_CODE not LIKE 'P%'
				AND bas.PLAN_CODE not LIKE 'P%'
				AND law.START_DATE = bas.START_DATE
				AND ((law.STOP_DATE = bas.STOP_DATE) OR (law.STOP_DATE = '1/1/1753' AND bas.STOP_DATE = '12/31/9999'))
				AND bas.CoverageLevel <> 'WAIVE'

		UNION

		-- CRP Audits
		SELECT 'CRP AUDIT' AS AUDIT_ACTION_CODE, '' as ACTION_CODE, bas.*
		FROM #BasBillingLawsonFormatted bas
		JOIN  #LawsonBn531Formatted law
			ON law.COMPANY = bas.COMPANY
				AND law.EMPLOYEE = bas.EMPLOYEE
				AND law.PLAN_CODE COLLATE Latin1_General_CI_AS = bas.PLAN_CODE
				AND law.PLAN_TYPE COLLATE Latin1_General_CI_AS = bas.PLAN_TYPE
				AND law.COV_OPTION = bas.COV_OPTION
				AND law.PAY_RATE = bas.PAY_RATE
				AND law.PLAN_CODE LIKE 'P%'
				AND bas.PLAN_CODE LIKE 'P%'
				AND law.START_DATE = bas.START_DATE
				AND (law.STOP_DATE = bas.STOP_DATE OR (law.STOP_DATE = '1/1/1753' AND bas.STOP_DATE = '12/31/9999'))
				AND bas.CoverageLevel <> 'WAIVE'
		
		) Bn531Data
	WHERE 
		(@FileType = 1 AND (AUDIT_ACTION_CODE NOT LIKE '%AUDIT%' AND AUDIT_ACTION_CODE <> 'REVERSE ADD'))
		OR (@FileType = 2 AND (AUDIT_ACTION_CODE LIKE '%AUDIT%'))
		OR (@FileType = 3 AND (AUDIT_ACTION_CODE = 'REVERSE ADD'))
	ORDER BY EMPLOYEE, PLAN_CODE, Fc_Audit
		
END




GO
