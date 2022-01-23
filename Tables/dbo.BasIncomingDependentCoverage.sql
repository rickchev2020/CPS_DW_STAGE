CREATE TABLE [dbo].[BasIncomingDependentCoverage]
(
[BasIncomingDependentCoverageId] [int] NOT NULL IDENTITY(1, 1),
[EmployeeSsn] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSsn] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BenefitId] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanId] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OptionId] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CoverageEffectiveDate] [date] NULL,
[CoverageTerminationDate] [date] NULL,
[EbsUniqueDependentId] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSequenceNumberLawson] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[BasIncomingDependentCoverage] ADD CONSTRAINT [PK__BasIncom__407F6A1773CE6C34] PRIMARY KEY CLUSTERED ([BasIncomingDependentCoverageId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
