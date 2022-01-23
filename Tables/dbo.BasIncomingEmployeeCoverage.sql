CREATE TABLE [dbo].[BasIncomingEmployeeCoverage]
(
[BasIncomingEmployeeCoverageId] [int] NOT NULL IDENTITY(1, 1),
[EmployeeSsn] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Filler2] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BenefitId] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanId] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OptionId] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CoverageEffectiveDate] [date] NULL,
[ApprovedOrInforceAmount] [decimal] (30, 2) NULL,
[AnnualEeCost] [decimal] (10, 2) NULL,
[AnnualErCost] [decimal] (10, 2) NULL,
[TotalAnnualCost] [decimal] (10, 2) NULL,
[BenefitEndDate] [date] NULL,
[OptOutReason] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[BasIncomingEmployeeCoverage] ADD CONSTRAINT [PK__BasIncom__8D73D45FF7384EC4] PRIMARY KEY CLUSTERED ([BasIncomingEmployeeCoverageId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
