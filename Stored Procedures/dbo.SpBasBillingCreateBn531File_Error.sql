SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE PROCEDURE [dbo].[SpBasBillingCreateBn531File_Error]

AS
BEGIN
	SET NOCOUNT ON;

	---------------------------------------------------------------------------------------------
	-- Calculate months of service (theoretically could be part of next plan code summary query)
	---------------------------------------------------------------------------------------------

	IF OBJECT_ID('#EmployeeService') IS NOT NULL DROP TABLE #EmployeeService

	SELECT DISTINCT
		billingFile.Ssn,
		DATEDIFF(MONTH, CONVERT(DATE, billingFile.CrpAdjServiceDate), CONVERT(DATE, billingFile.BillingStartDate)) AS [MonthsOfService]
	INTO #EmployeeService
	FROM [CPS_DW_STAGE].[dbo].[BasIncomingBillingFileGroup] billingFile


	---------------------------------------------------------------------------------------------
	-- Summarize Plan Codes
	---------------------------------------------------------------------------------------------
	IF OBJECT_ID('#BillingPlanCodeSummary') IS NOT NULL DROP TABLE #BillingPlanCodeSummary

	SELECT  
		billingfile.BasIncomingBillingFileGroupId,
		billingFile.Ssn,
		billingFile.PlanExchangeId,
		planCodes.LawsonPlanType,
		CASE planCodes.PlanExchangeId 
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
							WHEN (employeeService.MonthsOfService >= 13 and employeeService.MonthsOfService <= 60) THEN 'PAN' -- 13-60
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
	INTO #BillingPlanCodeSummary
	FROM [CPS_DW_STAGE].[dbo].[BasIncomingBillingFileGroup] billingFile
	JOIN [CPS_DW_STAGE].[dbo].[BasIncomingBillingPlanCodes] planCodes 
		ON planCodes.PlanExchangeId = billingFile.PlanExchangeID
		   and (billingFile.PlanExchangeID <> 'CRP-CRPT'
				or (billingFile.PlanExchangeID = 'CRP-CRPT'
					and plancodes.CrpFullRegularBasis = coalesce(billingfile.CrpFullRegularBasis, 'N')))
		   -- only apply CrpFullRegularBasis to CRP-CRPT
	JOIN #EmployeeService employeeService 
		ON employeeService.Ssn = billingFile.Ssn


	---------------------------------------------------------------------------------------------
	-- Create File Extract
	---------------------------------------------------------------------------------------------
	--any std or plan code with p - include pay rate, otherwise blank
	SELECT DISTINCT
		CASE billingFile.MemberAction
			WHEN '021' THEN 'A'
			ELSE 'C'
		END AS [Fc],
		'1000' AS [Company],
		'' AS [EnrollmentDate],
		employee.EMPLOYEE AS [Employee],
		billingFile.Ssn,
		billingFile.FirstName,
		billingFile.LastName,
		billingfile.PrimarySubscriberExchangeId as [PrimarySubscriberExchangeId],
		planCodeSummary.LawsonPlanType AS [PlanType],
		planCodeSummary.LawsonPlanCode AS [PlanCode],
		billingfile.PlanExchangeId as [PlanExchangeId],
		CASE billingFile.CoverageLevel
			WHEN 'EEONLY' THEN '1'
			WHEN 'EESPOUSE' THEN '2'
			WHEN 'EECHILD' THEN '3'
			WHEN 'EEFAMILY' THEN '4'
			WHEN 'CHONLY' THEN '5'
			WHEN 'SPONLY' THEN '6'
			WHEN 'SPCHILD' THEN '7'
			ELSE ''
		END AS [CoverOpt],
		'' AS [MultSalary],
		'' AS [CoverAmt],
		CASE 
			WHEN (billingFile.PlanExchangeId like 'STD%' 
					or billingFile.PlanExchangeId like 'CRP-%') THEN billingFile.TotalAcr
			ELSE ''
		END	AS [PayRate],
		'' AS [PctAmtFlag],
		CoverageStartDate AS [StartDate],
		'' AS [PreAftFlag],
		'' AS [SmokerFlag],
		'' AS [EmpPreCont],
		CASE LEFT(planCodeSummary.LawsonPlanCode,1)
			WHEN 'P' THEN ''
			ELSE billingFile.AnnualCost
		END AS [EmpAftCont],
		CASE billingfile.BillingEndDate
			WHEN '12/31/9999' THEN ''
			ELSE billingfile.BillingEndDate
		END AS [StopDate],
		'Did not find SSN match' as ErrorDescription
	FROM [CPS_DW_STAGE].[dbo].[BasIncomingBillingFileGroup] billingFile
	JOIN #BillingPlanCodeSummary planCodeSummary 
		ON planCodeSummary.BasIncomingBillingFileGroupId = billingFile.BasIncomingBillingFileGroupId
	left join [CPS_DW].dbo.DIM_EMPLOYEE employee -- Get member number with SSN
		on replace(employee.FICA_NBR, '-', '') = billingFile.Ssn
			and employee.ETLRowIsCurrent = 1
	WHERE 
		billingFile.CoverageLevel <> 'WAIVE'
		and billingFile.PlanExchangeID not like '%EXT' 
		and (
				(billingFile.SecurianDirectBill = 'N')
				or 
				(billingFile.SecurianDirectBill = 'Y' and 
					(billingfile.PlanExchangeId not like 'CHILDLIFE-%' 
					 and billingfile.PlanExchangeId not like 'SPOUSELIFE-%' 
					 and billingfile.PlanExchangeId not like 'SUPPLIFE-%')) 
 			)
		and employee.EMPLOYEE is null -- Did not find social match

	union

	SELECT distinct
		CASE billingFile.MemberAction
			WHEN '021' THEN 'A'
			ELSE 'C'
		END AS [Fc],
		'1000' AS [Company],
		'' AS [EnrollmentDate],
		employee.EMPLOYEE AS [Employee],
		billingFile.Ssn,
		billingFile.FirstName,
		billingFile.LastName,
		billingfile.PrimarySubscriberExchangeId as [PrimarySubscriberExchangeId],
		planCodeSummary.LawsonPlanType AS [PlanType],
		planCodeSummary.LawsonPlanCode AS [PlanCode],
		billingfile.PlanExchangeId as [PlanExchangeId],
		CASE billingFile.CoverageLevel
			WHEN 'EEONLY' THEN '1'
			WHEN 'EESPOUSE' THEN '2'
			WHEN 'EECHILD' THEN '3'
			WHEN 'EEFAMILY' THEN '4'
			WHEN 'CHONLY' THEN '5'
			WHEN 'SPONLY' THEN '6'
			WHEN 'SPCHILD' THEN '7'
			ELSE ''
		END AS [CoverOpt],
		'' AS [MultSalary],
		'' AS [CoverAmt],
		CASE 
			WHEN (billingFile.PlanExchangeId like 'STD%' 
					or billingFile.PlanExchangeId like 'CRP-%') THEN billingFile.TotalAcr
			ELSE ''
		END	AS [PayRate],
		'' AS [PctAmtFlag],
		CoverageStartDate AS [StartDate],
		--'20190101' AS [StartDate],
		'' AS [PreAftFlag],
		'' AS [SmokerFlag],
		'' AS [EmpPreCont],
		CASE LEFT(planCodeSummary.LawsonPlanCode,1)
			WHEN 'P' THEN ''
			ELSE billingFile.AnnualCost
		END AS [EmpAftCont],
		CASE billingfile.BillingEndDate
			WHEN '12/31/9999' THEN ''
			ELSE billingfile.BillingEndDate
		END AS [StopDate],
		'No plan match in crosswalk' as ErrorDescription
	FROM [CPS_DW_STAGE].[dbo].[BasIncomingBillingFileGroup] billingFile
	left JOIN #BillingPlanCodeSummary planCodeSummary 
		ON planCodeSummary.BasIncomingBillingFileGroupId = billingFile.BasIncomingBillingFileGroupId
	join [CPS_DW].dbo.DIM_EMPLOYEE employee -- Get member number with SSN
		on replace(employee.FICA_NBR, '-', '') = billingFile.Ssn
			and employee.ETLRowIsCurrent = 1
	WHERE 
		billingFile.CoverageLevel <> 'WAIVE'
		and billingFile.PlanExchangeID not like '%EXT' 
		and (
				(billingFile.SecurianDirectBill = 'N')
				or 
				(billingFile.SecurianDirectBill = 'Y' and 
					(billingfile.PlanExchangeId not like 'CHILDLIFE-%' 
					 and billingfile.PlanExchangeId not like 'SPOUSELIFE-%' 
					 and billingfile.PlanExchangeId not like 'SUPPLIFE-%')) 
 			)
		and planCodeSummary.LawsonPlanCode is null -- Did not find plan code match
	ORDER BY employee.EMPLOYEE

END



GO
