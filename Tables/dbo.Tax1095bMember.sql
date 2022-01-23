CREATE TABLE [dbo].[Tax1095bMember]
(
[MemberNumber] [int] NOT NULL,
[MemberSsn] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthdate] [date] NULL,
[Address1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Country] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertUsername] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwUpdateUsername] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tax1095bMember] ADD CONSTRAINT [PK__Tax1095b__F9D9F88F3226A1F6] PRIMARY KEY CLUSTERED ([MemberNumber]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
