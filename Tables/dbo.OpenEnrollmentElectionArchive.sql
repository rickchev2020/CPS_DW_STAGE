CREATE TABLE [dbo].[OpenEnrollmentElectionArchive]
(
[OpenEnrollmentElectionId] [int] NOT NULL IDENTITY(1, 1),
[EmployerNumber] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MemberNumber] [int] NOT NULL,
[BenefitName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TierOptionName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElectedAmount] [decimal] (11, 2) NULL,
[MemberInforceCostPerMonth] [decimal] (11, 2) NULL,
[EmployerInforceCostPerMonth] [decimal] (11, 2) NULL,
[ChangeReason] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OpenEnrollmentElectionArchive] ADD CONSTRAINT [PK__OpenEnro__50F93F0C89F6EEF5] PRIMARY KEY CLUSTERED ([OpenEnrollmentElectionId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
