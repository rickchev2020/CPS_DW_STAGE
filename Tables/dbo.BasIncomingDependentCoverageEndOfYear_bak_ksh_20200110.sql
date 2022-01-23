CREATE TABLE [dbo].[BasIncomingDependentCoverageEndOfYear_bak_ksh_20200110]
(
[BasIncomingDependentCoverageEndOfYearId] [int] NOT NULL IDENTITY(1, 1),
[EmployeeSsn] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSsn] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BenefitId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OptionId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CoverageEffectiveDate] [date] NULL,
[CoverageTerminationDate] [date] NULL,
[EbsUniqueDependentId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSequenceNumberLawson] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
