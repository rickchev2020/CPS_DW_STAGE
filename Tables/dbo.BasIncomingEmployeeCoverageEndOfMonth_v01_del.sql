CREATE TABLE [dbo].[BasIncomingEmployeeCoverageEndOfMonth_v01_del]
(
[EmployeeSsn] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Filler2] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BenefitId] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanId] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OptionId] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CoverageEffectiveDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ApprovedOrInforceAmount] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AnnualEeCost] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AnnualErCost] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotalAnnualCost] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BenefitEndDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OptOutReason] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertDate] [datetime] NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateDate] [datetime] NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Month] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
