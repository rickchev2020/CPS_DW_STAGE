CREATE TABLE [dbo].[CrmSalesforceAccount]
(
[CrmSalesforceAccountId] [int] NOT NULL IDENTITY(1, 1),
[Id] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson_ID__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Federal_EIN__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Primary_R_S_Number__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RSO_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Owner_Full_Name__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Manager_Email_MKTO__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Calendly_Link] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Primary_Contact_SFDC_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Autosave_Election__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoSave_Eligibility_Rule__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoSave_New_Hire_Waiting_Period__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoSave_Opt_Out_Rule__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoSave_Participation_Rule__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Broker_Managed__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_Risk] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP_Risk] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRSP_Risk] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employer_Election_Period__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HR__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AI_Effective_Date] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CI_Effective_Date] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CDSP_Option] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Member_Portal_Experience__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Open_Enrollment_Period__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Open_Enrollment_Mail_Date] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Payroll_Provider__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R_S_Employer_Type__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vitality_Eligible_Worker_Code] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vitality_Strategy_Code] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vitality_Branch_Code] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VCM_Active] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CrmSalesforceAccount] ADD CONSTRAINT [PK__CrmSales__950BCA4D401671FC] PRIMARY KEY CLUSTERED ([CrmSalesforceAccountId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
