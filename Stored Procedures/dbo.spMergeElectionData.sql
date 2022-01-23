SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE procedure [dbo].[spMergeElectionData] as BEGIN

	declare @RunTime datetime = GETDATE();
	declare @ProcessName varchar(100) = 'spMergeElectionData';
	declare @ExecutingUser varchar(100) = SUSER_NAME();
	declare @SourceName varchar(100) = '[CPS_DW_STAGE].[dbo].[EmployerElection]';

MERGE [CPS_DW].[dbo].[EmployerElection] tgt USING
      [CPS_DW_STAGE].[dbo].[EmployerElection] src
ON tgt.[EmployerElectionId] = src.[EmployerElectionId]
WHEN MATCHED
AND  (
             (tgt.[EmployerNumber] <> src.[EmployerNumber])
             OR (tgt.[CurrentStep] <> src.[CurrentStep])
             OR (tgt.[CompletedUser] <> src.[CompletedUser])
             OR (tgt.[CompletedOrganization] <> src.[CompletedOrganization])
             OR (tgt.[CompletedDate] <> src.[CompletedDate])
             OR (tgt.[AuditUpdateProcessName] <> src.[AuditUpdateProcessName])
             OR (tgt.[AuditUpdateUser] <> src.[AuditUpdateUser])
             OR (tgt.[AuditUpdateDate] <> src.[AuditUpdateDate])
             OR (tgt.[ConfirmationNumber] <> src.[ConfirmationNumber])
             OR (tgt.[StepsComplete] <> src.[StepsComplete])
             OR (tgt.[Year] <> src.[Year])
             OR (tgt.[AuthorizedName] <> src.[AuthorizedName])
             OR (tgt.[AuthorizedEmail] <> src.[AuthorizedEmail])
             OR (tgt.[AuthorizedEmailConsent] <> src.[AuthorizedEmailConsent])
      )
THEN UPDATE 
         SET tgt.[EmployerNumber] = src.[EmployerNumber],
             tgt.[CurrentStep] = src.[CurrentStep],
             tgt.[CompletedUser] = src.[CompletedUser],
             tgt.[CompletedOrganization] = src.[CompletedOrganization],
             tgt.[CompletedDate] = src.[CompletedDate],
             tgt.[AuditUpdateProcessName] = src.[AuditUpdateProcessName],
             tgt.[AuditUpdateUser] = src.[AuditUpdateUser],
             tgt.[AuditUpdateDate] = src.[AuditUpdateDate],
             tgt.[ConfirmationNumber] = src.[ConfirmationNumber],
             tgt.[StepsComplete] = src.[StepsComplete],
             tgt.[Year] = src.[Year],
             tgt.[AuthorizedName] = src.[AuthorizedName],
             tgt.[AuthorizedEmail] = src.[AuthorizedEmail],
             tgt.[AuthorizedEmailConsent] = src.[AuthorizedEmailConsent]
WHEN NOT MATCHED
THEN INSERT (
             [EmployerElectionID]
             ,[EmployerNumber]
             ,[CurrentStep]
             ,[CompletedUser]
             ,[CompletedOrganization]
             ,[CompletedDate]
             ,[AuditInsertProcessName]
             ,[AuditInsertUser]
             ,[AuditInsertDate] 
             ,[AuditUpdateProcessName]
             ,[AuditUpdateUser]
             ,[AuditUpdateDate] 
             ,[AuditExportProcessName]
             ,[AuditExportUser]
             ,[AuditExportDate] 
             ,[ConfirmationNumber]
             ,[StepsComplete]
             ,[Year]
             ,[AuthorizedName]
             ,[AuthorizedEmail]
             ,[AuthorizedEmailConsent]
             ,[DwSourceName]
             ,[DwInsertDate]
             ,[DwInsertUsername]
             ,[DwInsertProcessName]
             ,[DwUpdateDate]
             ,[DwUpdateUsername]
             ,[DwUpdateProcessName]
             )
      VALUES (
             src.[EmployerElectionID]
             ,src.[EmployerNumber]
             ,src.[CurrentStep]
             ,src.[CompletedUser]
             ,src.[CompletedOrganization]
             ,src.[CompletedDate]
             ,src.[AuditInsertProcessName]
             ,src.[AuditInsertUser]
             ,src.[AuditInsertDate] 
             ,src.[AuditUpdateProcessName]
             ,src.[AuditUpdateUser]
             ,src.[AuditUpdateDate] 
             ,src.[AuditExportProcessName]
             ,src.[AuditExportUser]
             ,src.[AuditExportDate] 
             ,src.[ConfirmationNumber]
             ,src.[StepsComplete]
             ,src.[Year]
             ,src.[AuthorizedName]
             ,src.[AuthorizedEmail]
             ,src.[AuthorizedEmailConsent]
             ,@SourceName -- DwSourceName
             ,@RunTime -- DwInsertDate
             ,@ExecutingUser -- DwInsertUsername
             ,@ProcessName -- DwInsertProcessName
             ,@RunTime -- DwUpdateDate
             ,@ExecutingUser -- DwUpdateUsername
             ,@ProcessName -- DwUpdateProcessName
              )
WHEN NOT MATCHED BY SOURCE
THEN DELETE;

SET @SourceName = '[CPS_DW_STAGE].[dbo].[EmployerElectionOverride]';

MERGE [CPS_DW].[dbo].[EmployerElectionOverride] tgt USING
      [CPS_DW_STAGE].[dbo].[EmployerElectionOverride] src
ON  tgt.[EmployerElectionOverrideId] = src.[EmployerElectionOverrideId]
WHEN MATCHED
AND (    (tgt.[EmployerNumber] <> src.[EmployerNumber] )
      OR (tgt.[Year] <> src.[Year] )
      OR (tgt.[MaxHealthOverride] <> src.[MaxHealthOverride])
      OR (tgt.[AuditUpdateProcessName] <> src.[AuditUpdateProcessName])
      OR (tgt.[AuditUpdateUser] <> src.[AuditUpdateUser])
      OR (tgt.[AuditUpdateDate] <> src.[AuditUpdateDate])
     )
THEN UPDATE 
         SET tgt.[EmployerNumber] = src.[EmployerNumber],
             tgt.[Year] = src.[Year],
             tgt.[MaxHealthOverride] = src.[MaxHealthOverride],
             tgt.[AuditUpdateProcessName] = src.[AuditUpdateProcessName],
             tgt.[AuditUpdateUser] = src.[AuditUpdateUser],
             tgt.[AuditUpdateDate] = src.[AuditUpdateDate]             
WHEN NOT MATCHED
THEN INSERT (
             [EmployerElectionOverrideID]
             ,[EmployerNumber]
             ,[Year]
             ,[MaxHealthOverride]
             ,[AuditInsertProcessName]
             ,[AuditInsertUser]
             ,[AuditInsertDate] 
             ,[AuditUpdateProcessName]
             ,[AuditUpdateUser]
             ,[AuditUpdateDate] 
             ,[AuditExportProcessName]
             ,[AuditExportUser]
             ,[AuditExportDate] 
             ,[DwSourceName]
             ,[DwInsertDate]
             ,[DwInsertUsername]
             ,[DwInsertProcessName]
             ,[DwUpdateDate]
             ,[DwUpdateUsername]
             ,[DwUpdateProcessName]
             )
      VALUES (
              src.[EmployerElectionOverrideID]
             ,src.[EmployerNumber]
             ,src.[Year]
             ,src.[MaxHealthOverride]
             ,src.[AuditInsertProcessName]
             ,src.[AuditInsertUser]
             ,src.[AuditInsertDate] 
             ,src.[AuditUpdateProcessName]
             ,src.[AuditUpdateUser]
             ,src.[AuditUpdateDate] 
             ,src.[AuditExportProcessName]
             ,src.[AuditExportUser]
             ,src.[AuditExportDate] 
             ,@SourceName -- DwSourceName
             ,@RunTime -- DwInsertDate
             ,@ExecutingUser -- DwInsertUsername
             ,@ProcessName -- DwInsertProcessName
             ,@RunTime -- DwUpdateDate
             ,@ExecutingUser -- DwUpdateUsername
             ,@ProcessName -- DwUpdateProcessName
              )
WHEN NOT MATCHED BY SOURCE
THEN DELETE;

SET @SourceName = '[CPS_DW_STAGE].[dbo].[EmployerElectionPlan]';

--several columns here will be replaced
MERGE [CPS_DW].[dbo].[EmployerElectionPlan] tgt 
USING
-- this will have to be a query that replaces the redundant columns
-- with a join to cps_dw.dbo.BenefitPlan
-- join on benefitcode=benefitcode
--- and dw.benefitplancode=stage.plancode
(
      SELECT  [EmployerElectionPlanID]
             ,[EmployerElectionID]
             ,[BenefitPlanId]
             ,[EmployerElectionPlanOrder]
             ,[AuditInsertProcessName]
             ,[AuditInsertUser]
             ,[AuditInsertDate] 
             ,[AuditUpdateProcessName]
             ,[AuditUpdateUser]
             ,[AuditUpdateDate] 
             ,[AuditExportProcessName]
             ,[AuditExportUser]
             ,[AuditExportDate] 
        FROM [CPS_DW_STAGE].[dbo].[EmployerElectionPlan] stageEEP
        LEFT JOIN   [CPS_DW].[dbo].BenefitPlan dwBP
        ON     dwBP.BenefitCode = stageEEP.BenefitCode
        AND    dwBP.BenefitPlanCode = stageEEP.PlanCode
   		WHERE  --stageEEP.PlanCode NOT LIKE '%WAIVE%'
		 --   AND  stageEEP.PlanCode NOT LIKE '%HRA%'
		 --   AND  stageEEP.PlanCode NOT LIKE '%HSA%'
		 --   AND  stageEEP.PlanCode NOT LIKE '%FSA%'
		 --   AND  stageEEP.PlanCode NOT LIKE '%AUTOSAVE%'
			--and 
			[BenefitPlanId] is not null
) AS src
ON tgt.[EmployerElectionPlanId] = src.[EmployerElectionPlanId]
AND tgt.[EmployerElectionId] = src.[EmployerElectionId]
WHEN MATCHED
AND  (
             (tgt.[BenefitPlanId] <> src.[BenefitPlanId])
             OR (tgt.[EmployerElectionPlanOrder] <> src.[EmployerElectionPlanOrder])
             OR (tgt.[AuditUpdateProcessName] <> src.[AuditUpdateProcessName])
             OR (tgt.[AuditUpdateUser] <> src.[AuditUpdateUser])
             OR (tgt.[AuditUpdateDate] <> src.[AuditUpdateDate])
      )
THEN UPDATE
      SET tgt.[BenefitPlanId] = src.[BenefitPlanId],
          tgt.[EmployerElectionPlanOrder] = src.[EmployerElectionPlanOrder],
          tgt.[AuditUpdateProcessName] = src.[AuditUpdateProcessName],
          tgt.[AuditUpdateUser] = src.[AuditUpdateUser],
          tgt.[AuditUpdateDate] = src.[AuditUpdateDate]
WHEN NOT MATCHED
THEN INSERT (
             [EmployerElectionPlanID]
             ,[EmployerElectionID]
             ,[BenefitPlanId]
             ,[EmployerElectionPlanOrder]
             ,[AuditInsertProcessName]
             ,[AuditInsertUser]
             ,[AuditInsertDate] 
             ,[AuditUpdateProcessName]
             ,[AuditUpdateUser]
             ,[AuditUpdateDate] 
             ,[AuditExportProcessName]
             ,[AuditExportUser]
             ,[AuditExportDate] 
             ,[DwSourceName]
             ,[DwInsertDate]
             ,[DwInsertUsername]
             ,[DwInsertProcessName]
             ,[DwUpdateDate]
             ,[DwUpdateUsername]
             ,[DwUpdateProcessName]
             )
      VALUES (
             src.[EmployerElectionPlanID]
             ,src.[EmployerElectionID]
             ,src.[BenefitPlanId]
             ,src.[EmployerElectionPlanOrder]
             ,src.[AuditInsertProcessName]
             ,src.[AuditInsertUser]
             ,src.[AuditInsertDate] 
             ,src.[AuditUpdateProcessName]
             ,src.[AuditUpdateUser]
             ,src.[AuditUpdateDate] 
             ,src.[AuditExportProcessName]
             ,src.[AuditExportUser]
             ,src.[AuditExportDate] 
             ,@SourceName -- DwSourceName
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
