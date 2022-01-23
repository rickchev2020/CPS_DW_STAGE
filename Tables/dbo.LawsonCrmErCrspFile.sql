CREATE TABLE [dbo].[LawsonCrmErCrspFile]
(
[LawsonCrmErCrspFileId] [int] NOT NULL IDENTITY(1, 1),
[ErNumber] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ErOnEbso] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErMatchAmount] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErMaxAmount] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ErMatchEffDate] [date] NULL,
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
ALTER TABLE [dbo].[LawsonCrmErCrspFile] ADD CONSTRAINT [PK__LawsonCr__68A4E4ABE9DCEE7C] PRIMARY KEY CLUSTERED ([LawsonCrmErCrspFileId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
