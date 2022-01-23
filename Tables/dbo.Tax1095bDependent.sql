CREATE TABLE [dbo].[Tax1095bDependent]
(
[MemberNumber] [int] NOT NULL,
[EbsUniqueDependentId] [int] NOT NULL,
[DependentSsn] [varchar] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentFirstName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentLastName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentBirthdate] [date] NULL,
[DwInsertUsername] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwUpdateUsername] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tax1095bDependent] ADD CONSTRAINT [PK__Tax1095b__006667C1FB72FC75] PRIMARY KEY CLUSTERED ([MemberNumber], [EbsUniqueDependentId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tax1095bDependent] WITH NOCHECK ADD CONSTRAINT [FK_Tax1095bDependent_Tax1095bMember] FOREIGN KEY ([MemberNumber]) REFERENCES [dbo].[Tax1095bMember] ([MemberNumber])
GO
ALTER TABLE [dbo].[Tax1095bDependent] NOCHECK CONSTRAINT [FK_Tax1095bDependent_Tax1095bMember]
GO
