CREATE TABLE [dbo].[OpenEnrollmentChangeArchive]
(
[OpenEnrollmentChangeId] [int] NOT NULL IDENTITY(1, 1),
[EmployerNumber] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MemberNumber] [int] NOT NULL,
[CurrentCoverageEffectiveDate] [date] NULL,
[CurrentBenefitName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CurrentPlanName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CurrentTierOptionName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CurrentElectedAmount] [decimal] (11, 2) NULL,
[CurrentPendedAmount] [decimal] (11, 2) NULL,
[InforceBenefitAmount] [decimal] (11, 2) NULL,
[ElectionCostPerMonth] [decimal] (11, 2) NULL,
[EmployerCostPerMonth] [decimal] (11, 2) NULL,
[ElectedBenefitName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElectedPlanName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElectedTierOptionName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ElectedCoverageEffectiveDate] [date] NULL,
[ElectedElectedAmount] [decimal] (11, 2) NULL,
[ElectedAmountPended] [decimal] (11, 2) NULL,
[ElectedInforceInitialBenefitAmount] [decimal] (11, 2) NULL,
[ElectedElectionCostPerMonth] [decimal] (11, 2) NULL,
[ElectedEmployerCostPerMonth] [decimal] (11, 2) NULL,
[ChangeType] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OpenEnrollmentChangeArchive] ADD CONSTRAINT [PK__OpenEnro__B6520CFB09190A7D] PRIMARY KEY CLUSTERED ([OpenEnrollmentChangeId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
