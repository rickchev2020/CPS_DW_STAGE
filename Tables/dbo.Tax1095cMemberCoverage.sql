CREATE TABLE [dbo].[Tax1095cMemberCoverage]
(
[MemberNumber] [int] NOT NULL,
[EmployerNumber] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberSsn] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthdate] [date] NULL,
[All12] [bit] NOT NULL,
[Jan] [bit] NULL,
[Feb] [bit] NULL,
[Mar] [bit] NULL,
[Apr] [bit] NULL,
[May] [bit] NULL,
[Jun] [bit] NULL,
[Jul] [bit] NULL,
[Aug] [bit] NULL,
[Sep] [bit] NULL,
[Oct] [bit] NULL,
[Nov] [bit] NULL,
[Dec] [bit] NULL,
[DwInsertUsername] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwUpdateUsername] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tax1095cMemberCoverage] ADD CONSTRAINT [PK__Tax1095c__F9D9F88F293ABB15] PRIMARY KEY CLUSTERED ([MemberNumber]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
