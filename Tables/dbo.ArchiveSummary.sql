CREATE TABLE [dbo].[ArchiveSummary]
(
[ArchiveSummaryId] [int] NOT NULL IDENTITY(1, 1),
[SchemaName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TableName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ArchiveRowCount] [int] NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArchiveSummary] ADD CONSTRAINT [PK__ArchiveS__AA465F37E3650D6C] PRIMARY KEY CLUSTERED ([ArchiveSummaryId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
