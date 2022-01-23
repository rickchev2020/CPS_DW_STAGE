SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[SpLoadRetirementPlanBalance] as 
begin
	delete from [CPS_DW].[dbo].[RetirementPlanBalance];

	insert into [CPS_DW].[dbo].[RetirementPlanBalance]
	(	[MemberSsn]
		,[BalanceAmount]
		,[MemberNumber]
		,[StatusCode]
		,[EmployerNumber]
		,[ProManageIndicator]
		,[AdminFeeCode]
		,[BalanceDate]
		,[DwSourceName]
		,[DwInsertDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwUpdateDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName])
	SELECT 
		[SSN]
		,[BALANCE]
		,ee.EMPLOYEE as [MemberNumber]
		,[STATUS]
		,[DVSN-NAME]
--		,[MISC-CODE]
		,LTRIM(RTRIM([MISC-CODE])) as [MISC-CODE]
		,[FEE-CODE]
		,[SourceModifiedDate]
		,'[CPS_DW_STAGE].[dbo].[FidelityCrspDailyAccountBalanceReport]' as [DwSourceName]
		,getdate() as [DwInsertDate]
		,SYSTEM_USER as [DwInsertUsername]
		,'SpLoadRetirementPlanBalance' as [DwInsertProcessName]
		,getdate() as [DwUpdateDate]
		,SYSTEM_USER as [DwUpdateUsername]
		,'SpLoadRetirementPlanBalance' as [DwUpdateProcessName]
	FROM [CPS_DW_STAGE].[dbo].[FidelityCrspDailyAccountBalanceReport] stg
	inner join [CPS_DW].dbo.[DIM_EMPLOYEE] ee
		on ee.FICA_NBR = stg.SSN
			and ee.ETLRowIsCurrent = 1
	where [SourceModifiedDate] = (select max([SourceModifiedDate]) from [CPS_DW_STAGE].[dbo].[FidelityCrspDailyAccountBalanceReport])

	end;

GO
