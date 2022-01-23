CREATE TABLE [dbo].[BasIncomingEmployeeCoverage_old_del]
(
[BasIncomingEmployeeCoverageId] [int] NOT NULL IDENTITY(1, 1),
[EmployeeSsn] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Filler2] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BenefitId] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanId] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OptionId] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CoverageEffectiveDate] [date] NULL,
[ApprovedOrInforceAmount] [decimal] (30, 2) NULL,
[AnnualEeCost] [decimal] (10, 2) NULL,
[AnnualErCost] [decimal] (10, 2) NULL,
[TotalAnnualCost] [decimal] (10, 2) NULL,
[BenefitEndDate] [date] NULL,
[OptOutReason] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BasIncomingEmployeeCoverage_old_del] ADD CONSTRAINT [PK__BasIncom__8D73D45FD1869BC9] PRIMARY KEY CLUSTERED ([BasIncomingEmployeeCoverageId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
