SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[spLoadRetirementPlanContributionPaycor] AS 

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'spLoadRetirementPlanContributionPaycor'
	declare @ExecutingUser varchar(100) = SUSER_NAME()

	INSERT INTO [CPS_DW].[dbo].[RetirementPlanContribution]
		([EmployerNumber]
		,[EmployerName]
		,[MemberSsn]
		,[MemberNumber]
		,[MemberFullName]
		,[ProcessedDate]
		,[PayrollDate]
		,[PreTaxContribution]
		,[EmployerContribution]
		,[LoanActivityAmount]
		,[RothContribution]
		,[EmployerVestedContribution]
		,[QualifiedNonElectiveEmployerContribution]
		,[OtherContribution]
		,[VendorFileSource]
		,[DwInsertDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwUpdateDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName])
	SELECT
		CASE
			WHEN ISNUMERIC(LTRIM(RTRIM([GrpNumber]))) = 0
				AND LTRIM(RTRIM([GrpNumber])) <> ''
			THEN '0' + SUBSTRING(LTRIM(RTRIM([GrpNumber])), 2, LEN(LTRIM(RTRIM([GrpNumber]))))
			ELSE LTRIM(RTRIM([GrpNumber]))
			END AS [GrpNumber]
		,[GrpName]
		,FORMAT(CAST(LTRIM(RTRIM([EnrID])) AS INTEGER), '000-00-0000') AS [MemberSsn]
		,COALESCE([EmployeeId], emp.employee) AS [EmployeeId]
		,[EnrName]
		,[ProcessedDate]
		,[PayRollDate]
		,[PreTax]
		,[ER]
		,[Loan]
		,[Roth]
		,[ER Vested]
		,[QNEC]
		,[Other]
		,CASE WHEN [Source] = '90DB' THEN '90 Degree Benefits' ELSE [Source] END AS [Source]
		,@RunTime AS [DwInsertDate]
		,@ExecutingUser AS [DwInsertUsername]
		,@ProcessName AS [DwInsertProcessName]
		,@RunTime AS [DwUpdateDate]
		,@ExecutingUser AS [DwUpdateUsername]
		,@ProcessName AS [DwUpdateProcessName]
	FROM [CPS_DW_STAGE].[dbo].[PaycorContributionDetailReport] ebso
	LEFT JOIN [CPS_DW].[dbo].[DIM_EMPLOYEE] emp
		ON emp.EtlRowIsCurrent = 1
			AND LTRIM(RTRIM(REPLACE(emp.FICA_NBR, '-', ''))) = ebso.[EnrID]
			AND emp.DECEASED <> 'Y'
			AND emp.EMP_STATUS <> 'VO'
			AND emp.EMP_STATUS NOT LIKE 'T%'
			AND emp.EMP_STATUS NOT LIKE 'S%'
			AND emp.FICA_NBR <> '999-99-9999'
	WHERE [PayrollDate] IS NOT NULL
;
GO
