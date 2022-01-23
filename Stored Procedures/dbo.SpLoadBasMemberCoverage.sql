SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE procedure [dbo].[SpLoadBasMemberCoverage] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'SpLoadBasMemberCoverage'
	declare @SourceModifiedDate date 
	set @SourceModifiedDate = (select coalesce(max([SourceModifiedDate]),'1900-10-01') from cps_dw_stage.[dbo].[BasIncomingEmployeeCoverage])

insert into CPS_DW.dbo.[BasMemberCoverage]
	 ([EmployeeSsn]
      ,ExternalMemberId
      ,[BenefitId]
      ,[PlanId]
      ,[OptionId]
      ,[CoverageEffectiveDate]
      ,[ApprovedOrInforceAmount]
      ,[AnnualEeCost]
      ,[AnnualErCost]
      ,[TotalAnnualCost]
      ,[BenefitEndDate]
      ,[OptOutReason]
      ,[ETLRowStartDate]
      ,[ETLRowEndDate]
      ,[ETLRowIsCurrent]
      ,[DwInsertDate]
      ,[DwInsertUsername]
      ,[DwInsertProcessName]
      ,[DwUpdateDate]
      ,[DwUpdateUsername]
      ,[DwUpdateProcessName])
SELECT [EmployeeSsn]
      ,ExternalMemberId
      ,[BenefitId]
      ,[PlanId]
      ,[OptionId]
      ,[CoverageEffectiveDate]
      ,[ApprovedOrInforceAmount]
      ,[AnnualEeCost]
      ,[AnnualErCost]
      ,[TotalAnnualCost]
      ,[BenefitEndDate]
      ,[OptOutReason]
	  ,[ETLRowStartDate]
      ,[ETLRowEndDate]
      ,[ETLRowIsCurrent]
      ,[DwInsertDate]
      ,[DwInsertUsername]
      ,[DwInsertProcessName]
      ,[DwUpdateDate]
      ,[DwUpdateUsername]
      ,[DwUpdateProcessName]
from (
	merge into CPS_DW.dbo.[BasMemberCoverage] as TGT
	using (
		
SELECT [EmployeeSsn]
      ,Filler2 as ExternalMemberId
      ,[BenefitId]
      ,[PlanId]
      ,[OptionId]
      ,[CoverageEffectiveDate]
      ,[ApprovedOrInforceAmount]
      ,[AnnualEeCost]
      ,[AnnualErCost]
      ,[TotalAnnualCost]
      ,[BenefitEndDate]
      ,[OptOutReason]
      ,[DwInsertDate]
      ,[DwInsertUsername]
      ,[DwInsertProcessName]
      ,[DwUpdateDate]
      ,[DwUpdateUsername]
      ,[DwUpdateProcessName]
  FROM cps_dw_stage.[dbo].[BasIncomingEmployeeCoverage]
  where SourceModifiedDate = @SourceModifiedDate
	  
	) as SRC
	ON (TGT.[EmployeeSsn] = SRC.[EmployeeSsn] AND TGT.[BenefitId] = SRC.[BenefitId]) and TGT.[PlanId] = SRC.[PlanId] 
	     and TGT.[OptionId] = SRC.[OptionId] and TGT.[CoverageEffectiveDate] = SRC.[CoverageEffectiveDate] and '1' = TGT.[ETLRowIsCurrent] 

	---- Mark deleted rows as not current
	when not matched by source and TGT.[ETLRowIsCurrent] = 1
	then update
		set TGT.[ETLRowIsCurrent] = 0
		, TGT.[ETLRowEndDate] = @YesterdayDate
		, TGT.[DwUpdateDate] = @RunTime
		, TGT.[DwUpdateUsername] = suser_name()
		, TGT.[DwUpdateProcessName] = @ProcessName

	-- Insert new rows
	when not matched 
	then insert values(SRC.[EmployeeSsn]
      ,SRC.ExternalMemberId
      ,SRC.[BenefitId]
      ,SRC.[PlanId]
      ,SRC.[OptionId]
      ,SRC.[CoverageEffectiveDate]
      ,SRC.[ApprovedOrInforceAmount]
      ,SRC.[AnnualEeCost]
      ,SRC.[AnnualErCost]
      ,SRC.[TotalAnnualCost]
      ,SRC.[BenefitEndDate]
      ,SRC.[OptOutReason]
		,@TodayDate -- ETLRowStartDate
		,@MaxEndDate -- ETLRowEndDate
		,'1' -- ETLRowIsCurrent
		,@RunTime -- DwInsertDate
		,SUSER_NAME() -- DwInsertUsername
		,@ProcessName -- DwInsertProcessName
		,@RunTime -- DwUpdateDate
		,SUSER_NAME() -- DwUpdateUsername
		,@ProcessName -- DwUpdateProcessName
	)
	WHEN MATCHED and TGT.[ETLRowIsCurrent] = 1
	and (
	--NULLIF(SRC.[EmployeeSsn], TGT.[EmployeeSsn]) IS NOT NULL OR NULLIF(TGT.[EmployeeSsn], SRC.[EmployeeSsn]) IS NOT NULL OR 
	NULLIF(SRC.ExternalMemberId, TGT.ExternalMemberId) IS NOT NULL OR NULLIF(TGT.ExternalMemberId, SRC.ExternalMemberId) IS NOT NULL OR 
	--NULLIF(SRC.[BenefitId], TGT.[BenefitId]) IS NOT NULL OR NULLIF(TGT.[BenefitId], SRC.[BenefitId]) IS NOT NULL OR 
	--NULLIF(SRC.[PlanId], TGT.[PlanId]) IS NOT NULL OR NULLIF(TGT.[PlanId], SRC.[PlanId]) IS NOT NULL OR 
	--NULLIF(SRC.[OptionId], TGT.[OptionId]) IS NOT NULL OR NULLIF(TGT.[OptionId], SRC.[OptionId]) IS NOT NULL OR 
	--NULLIF(SRC.[CoverageEffectiveDate], TGT.[CoverageEffectiveDate]) IS NOT NULL OR NULLIF(TGT.[CoverageEffectiveDate], SRC.[CoverageEffectiveDate]) IS NOT NULL OR 
	NULLIF(SRC.[ApprovedOrInforceAmount], TGT.[ApprovedOrInforceAmount]) IS NOT NULL OR NULLIF(TGT.[ApprovedOrInforceAmount], SRC.[ApprovedOrInforceAmount]) IS NOT NULL OR 
	NULLIF(SRC.[AnnualEeCost], TGT.[AnnualEeCost]) IS NOT NULL OR NULLIF(TGT.[AnnualEeCost], SRC.[AnnualEeCost]) IS NOT NULL OR 
	NULLIF(SRC.[AnnualErCost], TGT.[AnnualErCost]) IS NOT NULL OR NULLIF(TGT.[AnnualErCost], SRC.[AnnualErCost]) IS NOT NULL OR 
	NULLIF(SRC.[TotalAnnualCost], TGT.[TotalAnnualCost]) IS NOT NULL OR NULLIF(TGT.[TotalAnnualCost], SRC.[TotalAnnualCost]) IS NOT NULL OR 
	NULLIF(SRC.[BenefitEndDate], TGT.[BenefitEndDate]) IS NOT NULL OR NULLIF(TGT.[BenefitEndDate], SRC.[BenefitEndDate]) IS NOT NULL OR 
	NULLIF(SRC.[OptOutReason], TGT.[OptOutReason]) IS NOT NULL OR NULLIF(TGT.[OptOutReason], SRC.[OptOutReason]) IS NOT NULL  
	
	) THEN 
	UPDATE -- Expire records that have a new updated record
		SET TGT.[ETLRowIsCurrent] = '0'
		, TGT.[ETLRowEndDate] = @YesterdayDate
		, TGT.[DwUpdateDate] = @RunTime
		, TGT.[DwUpdateUsername] = SUSER_NAME()
		, TGT.[DwUpdateProcessName] = @ProcessName
	 OUTPUT -- Prepare insert of the new updated records
		$Action Action_out 
	  ,SRC.[EmployeeSsn]
      ,SRC.ExternalMemberId
      ,SRC.[BenefitId]
      ,SRC.[PlanId]
      ,SRC.[OptionId]
      ,SRC.[CoverageEffectiveDate]
      ,SRC.[ApprovedOrInforceAmount]
      ,SRC.[AnnualEeCost]
      ,SRC.[AnnualErCost]
      ,SRC.[TotalAnnualCost]
      ,SRC.[BenefitEndDate]
      ,SRC.[OptOutReason]
		,@TodayDate as [ETLRowStartDate]
		,@MaxEndDate as ETLRowEndDate
		,'1' as [ETLRowIsCurrent]
		,@RunTime as [DwInsertDate]
		,SUSER_NAME() as [DwInsertUsername]
		,@ProcessName as [DwInsertProcessName]
		,@RunTime as [DwUpdateDate]
		,SUSER_NAME() as [DwUpdateUsername]
		,@ProcessName as [DwUpdateProcessName]
	) as MERGE_OUT
	where MERGE_OUT.Action_Out = 'UPDATE' 
		and MERGE_OUT.[EmployeeSsn] is not null
	; 

end

GO
