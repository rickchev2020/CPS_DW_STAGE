CREATE TABLE [dbo].[BasIncomingBillingPlanCodes]
(
[BasIncomingBillingPlanCodesId] [int] NOT NULL IDENTITY(1, 1),
[GroupNumber] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanExchangeId] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CrpFullRegularBasis] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CrpWaitingPeriodFlag] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LawsonPlanType] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LawsonPlanCode] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceModifiedDate] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwSourceName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BasIncomingBillingPlanCodes] ADD CONSTRAINT [PK__BasIncom__69FE9A1427390F97] PRIMARY KEY CLUSTERED ([BasIncomingBillingPlanCodesId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
