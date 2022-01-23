CREATE TABLE [dbo].[BasIncomingMemberCoverageEndOfMonth]
(
[BasMemberCoverageId] [int] NOT NULL IDENTITY(1, 1),
[EmployeeSsn] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExternalMemberId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
[LawsonEmployeeId] [int] NULL,
[SourceMonth] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
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
ALTER TABLE [dbo].[BasIncomingMemberCoverageEndOfMonth] ADD CONSTRAINT [PK__BasIncom__7A549E9832EA7F76] PRIMARY KEY CLUSTERED ([BasMemberCoverageId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
