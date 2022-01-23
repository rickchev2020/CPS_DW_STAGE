CREATE TABLE [dbo].[BasIncomingEmployeeCoverageEndOfYear_bak_20211216]
(
[BasIncomingEmployeeCoverageEndOfYearId] [int] NOT NULL IDENTITY(1, 1),
[EmployeeSsn] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Filler2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BenefitId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OptionId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CoverageEffectiveDate] [date] NULL,
[ApprovedOrInforceAmount] [decimal] (30, 2) NULL,
[AnnualEeCost] [decimal] (10, 2) NULL,
[AnnualErCost] [decimal] (10, 2) NULL,
[TotalAnnualCost] [decimal] (10, 2) NULL,
[BenefitEndDate] [date] NULL,
[OptOutReason] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
