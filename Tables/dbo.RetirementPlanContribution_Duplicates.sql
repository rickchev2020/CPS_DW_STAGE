CREATE TABLE [dbo].[RetirementPlanContribution_Duplicates]
(
[RetirementPlanContributionId] [int] NOT NULL,
[EmployerNumber] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployerName] [varchar] (80) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberSsn] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberNumber] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberFullName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProcessedDate] [date] NULL,
[PayrollDate] [date] NULL,
[PreTaxContribution] [decimal] (11, 2) NULL,
[EmployerContribution] [decimal] (11, 2) NULL,
[LoanActivityAmount] [decimal] (11, 2) NULL,
[RothContribution] [decimal] (11, 2) NULL,
[OtherContribution] [decimal] (11, 2) NULL,
[ChurchSize] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
