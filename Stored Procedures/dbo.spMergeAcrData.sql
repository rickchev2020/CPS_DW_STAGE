SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[spMergeAcrData] as BEGIN

	declare @RunTime datetime = GETDATE();
	declare @ProcessName varchar(100) = 'spMergeAcrData';
	declare @ExecutingUser varchar(100) = SUSER_NAME();
	declare @SourceName varchar(100) = '[CPS_DW_STAGE].[dbo].[AcrWorkerSalary]';

MERGE [CPS_DW].[dbo].[AcrWorkerSalary] tgt USING
      [CPS_DW_STAGE].[dbo].[AcrWorkerSalary] src
ON tgt.[AcrWorkerSalaryId] = src.[AcrWorkerSalaryId]
WHEN MATCHED
AND  (
             (tgt.[AcrEmployerTransactionId] <> src.[AcrEmployerTransactionId])
           OR  (tgt.[MemberNumber] <> src.[MemberNumber])
           OR  (tgt.[Hours] <> src.[Hours])
           OR  (tgt.[BaseSalary] <> src.[BaseSalary])
           OR  (tgt.[HousingAllowance] <> src.[HousingAllowance])
           OR  (tgt.[HousingProvided] <> src.[HousingProvided])
           OR  (tgt.[UtilityAllowance] <> src.[UtilityAllowance])
           OR  (tgt.[TerminationDate] <> src.[TerminationDate])
           OR  (tgt.[TerminationReason] <> src.[TerminationReason])
           OR  (tgt.[AuditUpdateProcessName] <> src.[AuditUpdateProcessName])
           OR  (tgt.[AuditUpdateUser] <> src.[AuditUpdateUser])
           OR  (tgt.[AuditUpdateDate] <> src.[AuditUpdateDate])
      )
THEN UPDATE 
         SET tgt.[AcrEmployerTransactionId] = src.[AcrEmployerTransactionId],
             tgt.[MemberNumber] = src.[MemberNumber],
             tgt.[Hours] = src.[Hours],
             tgt.[BaseSalary] = src.[BaseSalary],
             tgt.[HousingAllowance] = src.[HousingAllowance],
             tgt.[HousingProvided] = src.[HousingProvided],
             tgt.[UtilityAllowance] = src.[UtilityAllowance],
             tgt.[TerminationDate] = src.[TerminationDate],
             tgt.[TerminationReason] = src.[TerminationReason],
             tgt.[AuditUpdateProcessName] = src.[AuditUpdateProcessName],
             tgt.[AuditUpdateUser] = src.[AuditUpdateUser],
             tgt.[AuditUpdateDate] = src.[AuditUpdateDate]

WHEN NOT MATCHED
THEN INSERT (
             [AcrWorkerSalaryId]
             ,[AcrEmployerTransactionId]
             ,[MemberNumber]
             ,[Hours]
             ,[BaseSalary]
             ,[HousingAllowance]
             ,[HousingProvided]
             ,[UtilityAllowance]
             ,[TerminationDate]
             ,[TerminationReason]
             ,[AuditInsertProcessName]
             ,[AuditInsertUser]
             ,[AuditInsertDate] 
             ,[AuditUpdateProcessName]
             ,[AuditUpdateUser]
             ,[AuditUpdateDate] 
             ,[AuditExportProcessName]
             ,[AuditExportUser]
             ,[AuditExportDate] 
             ,[DwInsertDate]
             ,[DwInsertUsername]
             ,[DwInsertProcessName]
             ,[DwUpdateDate]
             ,[DwUpdateUsername]
             ,[DwUpdateProcessName]
             )
      VALUES (
             src.[AcrWorkerSalaryId]
             ,src.[AcrEmployerTransactionId]
             ,src.[MemberNumber]
             ,src.[Hours]
             ,src.[BaseSalary]
             ,src.[HousingAllowance]
             ,src.[HousingProvided]
             ,src.[UtilityAllowance]
             ,src.[TerminationDate]
             ,src.[TerminationReason]
             ,src.[AuditInsertProcessName]
             ,src.[AuditInsertUser]
             ,src.[AuditInsertDate] 
             ,src.[AuditUpdateProcessName]
             ,src.[AuditUpdateUser]
             ,src.[AuditUpdateDate] 
             ,src.[AuditExportProcessName]
             ,src.[AuditExportUser]
             ,src.[AuditExportDate] 
             ,@RunTime -- DwInsertDate
             ,@ExecutingUser -- DwInsertUsername
             ,@ProcessName -- DwInsertProcessName
             ,@RunTime -- DwUpdateDate
             ,@ExecutingUser -- DwUpdateUsername
             ,@ProcessName -- DwUpdateProcessName
              )
WHEN NOT MATCHED BY SOURCE
THEN DELETE;

set @SourceName = '[CPS_DW_STAGE].[dbo].[AcrEmployerTransaction]';


MERGE [CPS_DW].[dbo].[AcrEmployerTransaction] tgt USING
      [CPS_DW_STAGE].[dbo].[AcrEmployerTransaction] src
ON tgt.[AcrEmployerTransactionId] = src.[AcrEmployerTransactionId]
WHEN MATCHED
AND  (
             (tgt.[AcrYear] <> src.[AcrYear])
           OR  (tgt.[EmployerNumber] <> src.[EmployerNumber])
           OR  (tgt.[ConfirmationNumber] <> src.[ConfirmationNumber])
           OR  (tgt.[AuthorizedName] <> src.[AuthorizedName])
           OR  (tgt.[AuthorizedEmail] <> src.[AuthorizedEmail])
           OR  (tgt.[AuthorizedEmailConsent] <> src.[AuthorizedEmailConsent])
           OR  (tgt.[CompletedUser] <> src.[CompletedUser])
           OR  (tgt.[CompletedOrganization] <> src.[CompletedOrganization])
           OR  (tgt.[CompletedDate] <> src.[CompletedDate])
           OR  (tgt.[AuditUpdateProcessName] <> src.[AuditUpdateProcessName])
           OR  (tgt.[AuditUpdateUser] <> src.[AuditUpdateUser])
           OR  (tgt.[AuditUpdateDate] <> src.[AuditUpdateDate])
		   OR  (tgt.[HeadcountResponse] <> src.[HeadcountResponse])
		   OR  (tgt.[HeadcountResponseOptedOut] <> src.[HeadcountResponseOptedOut])
      )
THEN UPDATE 
         SET tgt.[AcrYear] = src.[AcrYear],
             tgt.[EmployerNumber] = src.[EmployerNumber],
             tgt.[ConfirmationNumber] = src.[ConfirmationNumber],
             tgt.[AuthorizedName] = src.[AuthorizedName],
             tgt.[AuthorizedEmail] = src.[AuthorizedEmail],
             tgt.[AuthorizedEmailConsent] = src.[AuthorizedEmailConsent],
             tgt.[CompletedUser] = src.[CompletedUser],
             tgt.[CompletedOrganization] = src.[CompletedOrganization],
             tgt.[CompletedDate] = src.[CompletedDate],
             tgt.[AuditUpdateProcessName] = src.[AuditUpdateProcessName],
             tgt.[AuditUpdateUser] = src.[AuditUpdateUser],
             tgt.[AuditUpdateDate] = src.[AuditUpdateDate],
			 tgt.[HeadcountResponse] = src.[HeadcountResponse],
		     tgt.[HeadcountResponseOptedOut] = src.[HeadcountResponseOptedOut]
WHEN NOT MATCHED
THEN INSERT (
             [AcrEmployerTransactionId]
             ,[AcrYear]
             ,[EmployerNumber]
             ,[ConfirmationNumber]
             ,[AuthorizedName]
             ,[AuthorizedEmail]
             ,[AuthorizedEmailConsent]
             ,[CompletedUser]
             ,[CompletedOrganization]
             ,[CompletedDate]
			 ,[HeadcountResponse]
			 ,[HeadcountResponseOptedOut]
             ,[AuditInsertProcessName]
             ,[AuditInsertUser]
             ,[AuditInsertDate] 
             ,[AuditUpdateProcessName]
             ,[AuditUpdateUser]
             ,[AuditUpdateDate] 
             ,[AuditExportProcessName]
             ,[AuditExportUser]
             ,[AuditExportDate] 
             ,[DwInsertDate]
             ,[DwInsertUsername]
             ,[DwInsertProcessName]
             ,[DwUpdateDate]
             ,[DwUpdateUsername]
             ,[DwUpdateProcessName]
             )
      VALUES (
             src.[AcrEmployerTransactionId]
             ,src.[AcrYear]
             ,src.[EmployerNumber]
             ,src.[ConfirmationNumber]
             ,src.[AuthorizedName]
             ,src.[AuthorizedEmail]
             ,src.[AuthorizedEmailConsent]
             ,src.[CompletedUser]
             ,src.[CompletedOrganization]
             ,src.[CompletedDate]
			 ,src.[HeadcountResponse]
			 ,src.[HeadcountResponseOptedOut]
             ,src.[AuditInsertProcessName]
             ,src.[AuditInsertUser]
             ,src.[AuditInsertDate] 
             ,src.[AuditUpdateProcessName]
             ,src.[AuditUpdateUser]
             ,src.[AuditUpdateDate] 
             ,src.[AuditExportProcessName]
             ,src.[AuditExportUser]
             ,src.[AuditExportDate] 
             ,@RunTime -- DwInsertDate
             ,@ExecutingUser -- DwInsertUsername
             ,@ProcessName -- DwInsertProcessName
             ,@RunTime -- DwUpdateDate
             ,@ExecutingUser -- DwUpdateUsername
             ,@ProcessName -- DwUpdateProcessName
              )
WHEN NOT MATCHED BY SOURCE
THEN DELETE;

END
GO
