SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[SpLoadRetirementPlanContribution] as 

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
		case
			when isnumeric(ltrim(rtrim([GrpNumber]))) = 0
				and ltrim(rtrim([GrpNumber])) <> ''
			then '0' + substring(ltrim(rtrim([GrpNumber])), 2, len(ltrim(rtrim([GrpNumber]))))
			else ltrim(rtrim([GrpNumber]))
			end as [GrpNumber]
		,[GrpName]
		,format(cast(ltrim(rtrim([EnrID])) as integer), '000-00-0000') as [MemberSsn]
		,coalesce([EmployeeId], emp.employee) as [EmployeeId]
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
		,case when [Source] = '90DB' then '90 Degree Benefits' else [Source] end as [Source]
		,getdate() as [DwInsertDate]
		,SYSTEM_USER as [DwInsertUsername]
		,'SpLoadRetirementPlanContribution' as [DwInsertProcessName]
		,getdate() as [DwUpdateDate]
		,SYSTEM_USER as [DwUpdateUsername]
		,'SpLoadRetirementPlanContribution' as [DwUpdateProcessName]
	FROM [CPS_DW_STAGE].[dbo].[EbsoContributionDetailReport] ebso
	left join [CPS_DW].[dbo].[DIM_EMPLOYEE] emp
		on emp.EtlRowIsCurrent = 1
			and ltrim(rtrim(replace(emp.FICA_NBR, '-', ''))) = ebso.[EnrID]
			and emp.DECEASED <> 'Y'
			and emp.EMP_STATUS <> 'VO'
			and emp.EMP_STATUS not like 'T%'
			and emp.EMP_STATUS not like 'S%'
			and emp.FICA_NBR <> '999-99-9999'
	where [PayrollDate] is not null
;
GO
