CREATE TABLE [dbo].[EmployerVitality]
(
[EmployerVitalityId] [int] NOT NULL IDENTITY(1, 1),
[EmployerNumber] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LegacyVitalityCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployerDistrict] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BranchCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StrategyCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EligibleWorkerCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NonChpStartDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NonChpEndDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EmployerVitality] ADD CONSTRAINT [PK__Employer__4A762F9C7744E44C] PRIMARY KEY CLUSTERED ([EmployerVitalityId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
