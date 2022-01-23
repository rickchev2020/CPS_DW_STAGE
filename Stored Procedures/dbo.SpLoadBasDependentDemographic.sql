SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[SpLoadBasDependentDemographic] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'SpLoadBasDependentDemographic'
	declare @SourceModifiedDate date 
	set @SourceModifiedDate = (select coalesce(max([SourceModifiedDate]),'1900-01-01') from cps_dw_stage.[dbo].[BasIncomingDependentdemographic])

INSERT INTO CPS_DW.[dbo].[BasDependentDemographic]
           ([EmployeeSsn]
           ,[ExternalMemberId]
           ,[DependentSsn]
           ,[DependentLastName]
           ,[DependentFirstName]
           ,[DependentMiddleNameOrInitial]
           ,[DependentBirthdate]
           ,[DependentGender]
           ,[Relationship]
           ,[EbsUniqueDependentId]
           ,[DependentSequenceNumberLawson]
           ,[DependentSuffix]
           ,[MarriageDate]
           ,[Disabled]
           ,[DisabledEffectiveDate]
           ,[QualifiedMedicalChildSupportOrder]
           ,[QualifiedMedicalChildSupportOrderEffectiveDate]
           ,[DisabledMedicareEligibility]
           ,[DisabledMedicareEligibilityEffectiveDate]
           ,[DependentMedicareEligible]
           ,[IsStudent]
           ,[MedicarePrimaryIndicator]
           ,[DependentAddress1]
           ,[DependentAddress2]
           ,[DependentAddress3]
           ,[DependentCity]
           ,[DependentState]
           ,[DependentPostal]
           ,[DeletedDependentFlag]
           ,[IsVerifiedDependent]
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
           ,[ExternalMemberId]
           ,[DependentSsn]
           ,[DependentLastName]
           ,[DependentFirstName]
           ,[DependentMiddleNameOrInitial]
           ,[DependentBirthdate]
           ,[DependentGender]
           ,[Relationship]
           ,[EbsUniqueDependentId]
           ,[DependentSequenceNumberLawson]
           ,[DependentSuffix]
           ,[MarriageDate]
           ,[Disabled]
           ,[DisabledEffectiveDate]
           ,[QualifiedMedicalChildSupportOrder]
           ,[QualifiedMedicalChildSupportOrderEffectiveDate]
           ,[DisabledMedicareEligibility]
           ,[DisabledMedicareEligibilityEffectiveDate]
           ,[DependentMedicareEligible]
           ,[IsStudent]
           ,[MedicarePrimaryIndicator]
           ,[DependentAddress1]
           ,[DependentAddress2]
           ,[DependentAddress3]
           ,[DependentCity]
           ,[DependentState]
           ,[DependentPostal]
           ,[DeletedDependentFlag]
           ,[IsVerifiedDependent]
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
	merge into CPS_DW.dbo.[BasDependentDemographic] as TGT
	using (
SELECT [BasIncomingDependentDemographicId]
      ,[EmployeeSsn]
      ,[EmployeeId] as [ExternalMemberId]
      ,[DependentSsn]
      ,[DependentLastName]
      ,[DependentFirstName]
      ,[DependentMiddleNameOrInitial]
      ,try_parse(concat(substring([DependentBirthdate],5,4),'/',substring([DependentBirthdate],1,2),'/',substring([DependentBirthdate],3,2)) as date) as [DependentBirthdate]
      ,[DependentGender]
      ,[Relationship]
      ,[EbsUniqueDependentId]
      ,[DependentSequenceNumberLawson]
      ,[DependentSuffix]
      ,case when [MarriageDate] = '01011900' then NULL
			else try_parse(concat(substring([MarriageDate],5,4),'/',substring([MarriageDate],1,2),'/',substring([MarriageDate],3,2)) as date)
			end as [MarriageDate]
      ,[Disabled]
      ,try_parse(concat(substring([DisabledEffectiveDate],5,4),'/',substring([DisabledEffectiveDate],1,2),'/',substring([DisabledEffectiveDate],3,2)) as date) as [DisabledEffectiveDate]
      ,[QualifiedMedicalChildSupportOrder]
      ,try_parse(concat(substring([QualifiedMedicalChildSupportOrderEffectiveDate],5,4),'/',substring([QualifiedMedicalChildSupportOrderEffectiveDate],1,2),'/',substring([QualifiedMedicalChildSupportOrderEffectiveDate],3,2)) as date) as [QualifiedMedicalChildSupportOrderEffectiveDate]
      ,[DisabledMedicareEligibility]
      ,try_parse(concat(substring([DisabledMedicareEligibilityEffectiveDate],5,4),'/',substring([DisabledMedicareEligibilityEffectiveDate],1,2),'/',substring([DisabledMedicareEligibilityEffectiveDate],3,2)) as date) as [DisabledMedicareEligibilityEffectiveDate]
      ,[DependentMedicareEligible]
      ,[IsStudent]
      ,[MedicarePrimaryIndicator]
      ,[DependentAddress1]
      ,[DependentAddress2]
      ,[DependentAddress3]
      ,[DependentCity]
      ,[DependentState]
      ,[DependentPostal]
      ,[DeletedDependentFlag]
      ,[IsVerifiedDependent]
      ,[SourceModifiedDate]
      ,[DwSourceName]
      ,[DwInsertDate]
      ,[DwInsertUsername]
      ,[DwInsertProcessName]
      ,[DwUpdateDate]
      ,[DwUpdateUsername]
      ,[DwUpdateProcessName]
  FROM CPS_DW_STAGE.[dbo].[BasIncomingDependentDemographic]
  where SourceModifiedDate = @SourceModifiedDate
	) as SRC

	ON (TGT.[EmployeeSsn] = SRC.[EmployeeSsn] AND SRC.[EbsUniqueDependentId] = TGT.[EbsUniqueDependentId]) and '1' = TGT.[ETLRowIsCurrent] 

	---- Mark deleted rows as not current
	when not matched by source and TGT.[ETLRowIsCurrent] = 1 
	then update
		set TGT.[ETLRowIsCurrent] = 0
		,TGT.[ETLRowEndDate] = @YesterdayDate
		,TGT.[DwUpdateDate] = @RunTime
		,TGT.[DwUpdateUsername] = suser_name()
		,TGT.[DwUpdateProcessName] = @ProcessName

	-- Insert new rows
	when not matched 
	then insert values(SRC.[EmployeeSsn]
      ,SRC.[ExternalMemberId]
      ,SRC.[DependentSsn]
      ,SRC.[DependentLastName]
      ,SRC.[DependentFirstName]
      ,SRC.[DependentMiddleNameOrInitial]
      ,SRC.[DependentBirthdate]
      ,SRC.[DependentGender]
      ,SRC.[Relationship]
      ,SRC.[EbsUniqueDependentId]
      ,SRC.[DependentSequenceNumberLawson]
      ,SRC.[DependentSuffix]
      ,SRC.[MarriageDate]
      ,SRC.[Disabled]
      ,SRC.[DisabledEffectiveDate]
      ,SRC.[QualifiedMedicalChildSupportOrder]
      ,SRC.[QualifiedMedicalChildSupportOrderEffectiveDate]
      ,SRC.[DisabledMedicareEligibility]
      ,SRC.[DisabledMedicareEligibilityEffectiveDate]
      ,SRC.[DependentMedicareEligible]
      ,SRC.[IsStudent]
      ,SRC.[MedicarePrimaryIndicator]
      ,SRC.[DependentAddress1]
      ,SRC.[DependentAddress2]
      ,SRC.[DependentAddress3]
      ,SRC.[DependentCity]
      ,SRC.[DependentState]
      ,SRC.[DependentPostal]
      ,SRC.[DeletedDependentFlag]
      ,SRC.[IsVerifiedDependent]
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
   
	NULLIF(SRC.[ExternalMemberId], TGT.[ExternalMemberId]) IS NOT NULL OR NULLIF(TGT.[ExternalMemberId], SRC.[ExternalMemberId]) IS NOT NULL OR 
	NULLIF(SRC.[DependentSsn], TGT.[DependentSsn]) IS NOT NULL OR NULLIF(TGT.[DependentSsn], SRC.[DependentSsn]) IS NOT NULL OR 
	NULLIF(SRC.[DependentLastName], TGT.[DependentLastName]) IS NOT NULL OR NULLIF(TGT.[DependentLastName], SRC.[DependentLastName]) IS NOT NULL OR 
	NULLIF(SRC.[DependentFirstName], TGT.[DependentFirstName]) IS NOT NULL OR NULLIF(TGT.[DependentFirstName], SRC.[DependentFirstName]) IS NOT NULL OR 
	NULLIF(SRC.[DependentMiddleNameOrInitial], TGT.[DependentMiddleNameOrInitial]) IS NOT NULL OR NULLIF(TGT.[DependentMiddleNameOrInitial], SRC.[DependentMiddleNameOrInitial]) IS NOT NULL OR 
	NULLIF(SRC.[DependentBirthdate], TGT.[DependentBirthdate]) IS NOT NULL OR NULLIF(TGT.[DependentBirthdate], SRC.[DependentBirthdate]) IS NOT NULL OR 
	NULLIF(SRC.[DependentGender], TGT.[DependentGender]) IS NOT NULL OR NULLIF(TGT.[DependentGender], SRC.[DependentGender]) IS NOT NULL OR 
	NULLIF(SRC.[Relationship], TGT.[Relationship]) IS NOT NULL OR NULLIF(TGT.[Relationship], SRC.[Relationship]) IS NOT NULL OR 
	NULLIF(SRC.[DependentSequenceNumberLawson], TGT.[DependentSequenceNumberLawson]) IS NOT NULL OR NULLIF(TGT.[DependentSequenceNumberLawson], SRC.[DependentSequenceNumberLawson]) IS NOT NULL OR
	NULLIF(SRC.[DependentSuffix], TGT.[DependentSuffix]) IS NOT NULL OR NULLIF(TGT.[DependentSuffix], SRC.[DependentSuffix]) IS NOT NULL OR
	NULLIF(SRC.[MarriageDate], TGT.[MarriageDate]) IS NOT NULL OR NULLIF(TGT.[MarriageDate], SRC.[MarriageDate]) IS NOT NULL OR
	NULLIF(SRC.[Disabled], TGT.[Disabled]) IS NOT NULL OR NULLIF(TGT.[Disabled], SRC.[Disabled]) IS NOT NULL OR
	NULLIF(SRC.[DisabledEffectiveDate], TGT.[DisabledEffectiveDate]) IS NOT NULL OR NULLIF(TGT.[DisabledEffectiveDate], SRC.[DisabledEffectiveDate]) IS NOT NULL OR
	NULLIF(SRC.[QualifiedMedicalChildSupportOrder], TGT.[QualifiedMedicalChildSupportOrder]) IS NOT NULL OR NULLIF(TGT.[QualifiedMedicalChildSupportOrder], SRC.[QualifiedMedicalChildSupportOrder]) IS NOT NULL OR
	NULLIF(SRC.[QualifiedMedicalChildSupportOrderEffectiveDate], TGT.[QualifiedMedicalChildSupportOrderEffectiveDate]) IS NOT NULL OR NULLIF(TGT.[QualifiedMedicalChildSupportOrderEffectiveDate], SRC.[QualifiedMedicalChildSupportOrderEffectiveDate]) IS NOT NULL OR
	NULLIF(SRC.[DisabledMedicareEligibility], TGT.[DisabledMedicareEligibility]) IS NOT NULL OR NULLIF(TGT.[DisabledMedicareEligibility], SRC.[DisabledMedicareEligibility]) IS NOT NULL OR
	NULLIF(SRC.[DisabledMedicareEligibilityEffectiveDate], TGT.[DisabledMedicareEligibilityEffectiveDate]) IS NOT NULL OR NULLIF(TGT.[DisabledMedicareEligibilityEffectiveDate], SRC.[DisabledMedicareEligibilityEffectiveDate]) IS NOT NULL OR
	NULLIF(SRC.[DependentMedicareEligible], TGT.[DependentMedicareEligible]) IS NOT NULL OR NULLIF(TGT.[DependentMedicareEligible], SRC.[DependentMedicareEligible]) IS NOT NULL OR
	NULLIF(SRC.[IsStudent], TGT.[IsStudent]) IS NOT NULL OR NULLIF(TGT.[IsStudent], SRC.[IsStudent]) IS NOT NULL OR
	NULLIF(SRC.[MedicarePrimaryIndicator], TGT.[MedicarePrimaryIndicator]) IS NOT NULL OR NULLIF(TGT.[MedicarePrimaryIndicator], SRC.[MedicarePrimaryIndicator]) IS NOT NULL OR
	NULLIF(SRC.[DependentAddress1], TGT.[DependentAddress1]) IS NOT NULL OR NULLIF(TGT.[DependentAddress1], SRC.[DependentAddress1]) IS NOT NULL OR
	NULLIF(SRC.[DependentAddress2], TGT.[DependentAddress2]) IS NOT NULL OR NULLIF(TGT.[DependentAddress2], SRC.[DependentAddress2]) IS NOT NULL OR
	NULLIF(SRC.[DependentAddress3], TGT.[DependentAddress3]) IS NOT NULL OR NULLIF(TGT.[DependentAddress3], SRC.[DependentAddress3]) IS NOT NULL OR
	NULLIF(SRC.[DependentCity], TGT.[DependentCity]) IS NOT NULL OR NULLIF(TGT.[DependentCity], SRC.[DependentCity]) IS NOT NULL OR
	NULLIF(SRC.[DependentState], TGT.[DependentState]) IS NOT NULL OR NULLIF(TGT.[DependentState], SRC.[DependentState]) IS NOT NULL OR
	NULLIF(SRC.[DependentPostal], TGT.[DependentPostal]) IS NOT NULL OR NULLIF(TGT.[DependentPostal], SRC.[DependentPostal]) IS NOT NULL OR
	NULLIF(SRC.[DeletedDependentFlag], TGT.[DeletedDependentFlag]) IS NOT NULL OR NULLIF(TGT.[DeletedDependentFlag], SRC.[DeletedDependentFlag]) IS NOT NULL OR
	NULLIF(SRC.[IsVerifiedDependent], TGT.[IsVerifiedDependent]) IS NOT NULL OR NULLIF(TGT.[IsVerifiedDependent], SRC.[IsVerifiedDependent]) IS NOT NULL

	) THEN 
	UPDATE -- Expire records that have a new updated record
		SET TGT.[ETLRowIsCurrent] = '0'
		,TGT.[ETLRowEndDate] = @YesterdayDate
		,TGT.[DwUpdateDate] = @RunTime
		,TGT.[DwUpdateUsername] = SUSER_NAME()
		,TGT.[DwUpdateProcessName] = @ProcessName
	 OUTPUT -- Prepare insert of the new updated records
		$Action Action_out 
	  ,SRC.[EmployeeSsn]
      ,SRC.[ExternalMemberId]
      ,SRC.[DependentSsn]
      ,SRC.[DependentLastName]
      ,SRC.[DependentFirstName]
      ,SRC.[DependentMiddleNameOrInitial]
      ,SRC.[DependentBirthdate]
      ,SRC.[DependentGender]
      ,SRC.[Relationship]
      ,SRC.[EbsUniqueDependentId]
      ,SRC.[DependentSequenceNumberLawson]
      ,SRC.[DependentSuffix]
      ,SRC.[MarriageDate]
      ,SRC.[Disabled]
      ,SRC.[DisabledEffectiveDate]
      ,SRC.[QualifiedMedicalChildSupportOrder]
      ,SRC.[QualifiedMedicalChildSupportOrderEffectiveDate]
      ,SRC.[DisabledMedicareEligibility]
      ,SRC.[DisabledMedicareEligibilityEffectiveDate]
      ,SRC.[DependentMedicareEligible]
      ,SRC.[IsStudent]
      ,SRC.[MedicarePrimaryIndicator]
      ,SRC.[DependentAddress1]
      ,SRC.[DependentAddress2]
      ,SRC.[DependentAddress3]
      ,SRC.[DependentCity]
      ,SRC.[DependentState]
      ,SRC.[DependentPostal]
      ,SRC.[DeletedDependentFlag]
      ,SRC.[IsVerifiedDependent]
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
