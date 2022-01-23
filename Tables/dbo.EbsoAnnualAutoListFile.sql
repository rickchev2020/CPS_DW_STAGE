CREATE TABLE [dbo].[EbsoAnnualAutoListFile]
(
[EbsoAnnualAutoListFileId] [int] NOT NULL IDENTITY(1, 1),
[GrpNumber] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GrpName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoAnnualElection] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceModifiedDate] [date] NOT NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[EbsoAnnualAutoListFile] ADD CONSTRAINT [PK__EbsoAnnu__8B2925E3A45BFCAB] PRIMARY KEY CLUSTERED ([EbsoAnnualAutoListFileId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
