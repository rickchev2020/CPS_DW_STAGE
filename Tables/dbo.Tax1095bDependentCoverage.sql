CREATE TABLE [dbo].[Tax1095bDependentCoverage]
(
[MemberNumber] [int] NOT NULL,
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
ALTER TABLE [dbo].[Tax1095bDependentCoverage] ADD CONSTRAINT [PK__Tax1095b__006667C1C8E65572] PRIMARY KEY CLUSTERED ([MemberNumber], [EbsUniqueDependentId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Tax1095bDependentCoverage] WITH NOCHECK ADD CONSTRAINT [FK_Tax1095bDependentCoverage_Tax1095bDependent] FOREIGN KEY ([MemberNumber], [EbsUniqueDependentId]) REFERENCES [dbo].[Tax1095bDependent] ([MemberNumber], [EbsUniqueDependentId])
GO
ALTER TABLE [dbo].[Tax1095bDependentCoverage] NOCHECK CONSTRAINT [FK_Tax1095bDependentCoverage_Tax1095bDependent]
GO
