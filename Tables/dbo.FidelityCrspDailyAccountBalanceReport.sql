CREATE TABLE [dbo].[FidelityCrspDailyAccountBalanceReport]
(
[FidelityCrspDailyAccountBalanceReportId] [int] NOT NULL IDENTITY(1, 1),
[SSN] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BALANCE] [decimal] (11, 2) NULL,
[EEID] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATUS] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DVSN-NAME] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DVSN-CODE] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MISC-CODE] [varchar] (8) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FEE-CODE] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FILLER] [varchar] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[FidelityCrspDailyAccountBalanceReport] ADD CONSTRAINT [PK__Fidelity__AAB5C76ACB095FD0] PRIMARY KEY CLUSTERED ([FidelityCrspDailyAccountBalanceReportId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
