SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[SpLoadBasDependentCoverage] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'SpLoadBasDependentCoverage'
	declare @SourceModifiedDate date 
	set @SourceModifiedDate = (select coalesce(max([SourceModifiedDate]),'1900-10-01') from cps_dw_stage.[dbo].[BasIncomingDependentCoverage])


INSERT INTO CPS_DW.[dbo].[BasDependentCoverage]
           ([EmployeeSsn]
           ,[DependentSsn]
           ,[BenefitId]
           ,[PlanId]
           ,[OptionId]
           ,[CoverageEffectiveDate]
           ,[CoverageTerminationDate]
           ,[EbsUniqueDependentId]
           ,[DependentSequenceNumberLawson]
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
      ,[DependentSsn]
      ,[BenefitId]
      ,[PlanId]
      ,[OptionId]
      ,[CoverageEffectiveDate]
      ,[CoverageTerminationDate]
      ,[EbsUniqueDependentId]
      ,[DependentSequenceNumberLawson]
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
	merge into CPS_DW.dbo.[BasDependentCoverage] as TGT
	using (

SELECT [BasIncomingDependentCoverageId]
      ,[EmployeeSsn] 
      ,[DependentSsn]
      ,[BenefitId]
      ,[PlanId]
      ,[OptionId]
      ,[CoverageEffectiveDate]
      ,[CoverageTerminationDate]
      ,[EbsUniqueDependentId]
      ,[DependentSequenceNumberLawson]
      ,[SourceModifiedDate]
      ,[DwSourceName]
      ,[DwInsertDate]
      ,[DwInsertUsername]
      ,[DwInsertProcessName]
      ,[DwUpdateDate]
      ,[DwUpdateUsername]
      ,[DwUpdateProcessName]
  FROM CPS_DW_STAGE.[dbo].[BasIncomingDependentCoverage]
  where SourceModifiedDate=@SourceModifiedDate
	  
	) as SRC
	ON (TGT.[EmployeeSsn] = SRC.[EmployeeSsn] AND SRC.[EbsUniqueDependentId] = TGT.[EbsUniqueDependentId] 
	     and TGT.[BenefitId] = SRC.[BenefitId]) and TGT.[PlanId] = SRC.[PlanId] and TGT.[OptionId] = SRC.[OptionId]
		 and TGT.[CoverageEffectiveDate] = SRC.[CoverageEffectiveDate] and '1' = TGT.[ETLRowIsCurrent] 

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
      ,SRC.[DependentSsn]
      ,SRC.[BenefitId]
      ,SRC.[PlanId]
      ,SRC.[OptionId]
      ,SRC.[CoverageEffectiveDate]
      ,SRC.[CoverageTerminationDate]
      ,SRC.[EbsUniqueDependentId]
      ,SRC.[DependentSequenceNumberLawson]
      --,SRC.[SourceModifiedDate]
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
	WHEN MATCHED and TGT.ETLRowIsCurrent = 1 
	AND (
 
	--NULLIF(SRC.[OptionId], TGT.[OptionId]) IS NOT NULL OR NULLIF(TGT.[OptionId], SRC.[OptionId]) IS NOT NULL OR 
	---NULLIF(SRC.[CoverageEffectiveDate], TGT.[CoverageEffectiveDate]) IS NOT NULL OR NULLIF(TGT.[CoverageEffectiveDate], SRC.[CoverageEffectiveDate]) IS NOT NULL OR 
	NULLIF(SRC.[DependentSsn], TGT.[DependentSsn]) IS NOT NULL OR NULLIF(TGT.[DependentSsn], SRC.[DependentSsn]) IS NOT NULL OR 
	NULLIF(SRC.[CoverageTerminationDate], TGT.[CoverageTerminationDate]) IS NOT NULL OR NULLIF(TGT.[CoverageTerminationDate], SRC.[CoverageTerminationDate]) IS NOT NULL OR 
	NULLIF(SRC.[DependentSequenceNumberLawson], TGT.[DependentSequenceNumberLawson]) IS NOT NULL OR NULLIF(TGT.[DependentSequenceNumberLawson], SRC.[DependentSequenceNumberLawson]) IS NOT NULL
	
	
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
      ,SRC.[DependentSsn]
      ,SRC.[BenefitId]
      ,SRC.[PlanId]
      ,SRC.[OptionId]
      ,SRC.[CoverageEffectiveDate]
      ,SRC.[CoverageTerminationDate]
      ,SRC.[EbsUniqueDependentId]
      ,SRC.[DependentSequenceNumberLawson]
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
