CREATE TABLE [dbo].[PromanageVisionEmployerFile]
(
[PromanageVisionEmployerFileId] [int] NOT NULL IDENTITY(1, 1),
[ErNumber] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RsType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactEmail] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactFirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactLastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[PromanageVisionEmployerFile] ADD CONSTRAINT [PK__Promanag__7CFC4C0525B7AE83] PRIMARY KEY CLUSTERED ([PromanageVisionEmployerFileId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
