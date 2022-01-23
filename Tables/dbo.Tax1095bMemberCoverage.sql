CREATE TABLE [dbo].[Tax1095bMemberCoverage]
(
[MemberNumber] [int] NOT NULL,
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
ALTER TABLE [dbo].[Tax1095bMemberCoverage] ADD CONSTRAINT [PK__Tax1095b__F9D9F88FF5A354DA] PRIMARY KEY CLUSTERED ([MemberNumber]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tax1095bMemberCoverage] WITH NOCHECK ADD CONSTRAINT [FK_Tax1095bMemberCoverage_Tax1095bMember] FOREIGN KEY ([MemberNumber]) REFERENCES [dbo].[Tax1095bMember] ([MemberNumber])
GO
ALTER TABLE [dbo].[Tax1095bMemberCoverage] NOCHECK CONSTRAINT [FK_Tax1095bMemberCoverage_Tax1095bMember]
GO
