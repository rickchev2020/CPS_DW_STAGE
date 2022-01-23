CREATE TABLE [dbo].[EbsoAchListFile]
(
[EbsoAchListFileId] [int] NOT NULL IDENTITY(1, 1),
[GrpNumber] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GrpName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AcctType] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[EbsoAchListFile] ADD CONSTRAINT [PK__EbsoAchL__CA7457D5EEEC6B22] PRIMARY KEY CLUSTERED ([EbsoAchListFileId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
