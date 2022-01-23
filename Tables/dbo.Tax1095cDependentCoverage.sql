CREATE TABLE [dbo].[Tax1095cDependentCoverage]
(
[MemberSsn] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DependentSsn] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentFirstName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentMiddleName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentLastName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentBirthdate] [date] NULL,
[EbsUniqueDependentId] [int] NOT NULL,
[All12] [bit] NULL,
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
ALTER TABLE [dbo].[Tax1095cDependentCoverage] ADD CONSTRAINT [PK__Tax1095c__A42E3A3D8051158D] PRIMARY KEY CLUSTERED ([MemberSsn], [EbsUniqueDependentId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
