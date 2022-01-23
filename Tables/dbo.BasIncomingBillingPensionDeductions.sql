CREATE TABLE [dbo].[BasIncomingBillingPensionDeductions]
(
[BasIncomingBillingPensionDeductionsId] [int] NOT NULL IDENTITY(1, 1),
[MemberNumber] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SocialSecurityNumber] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceModifiedDate] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwSourceName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BasIncomingBillingPensionDeductions] ADD CONSTRAINT [PK__BasIncom__91176E1DBA87521A] PRIMARY KEY CLUSTERED ([BasIncomingBillingPensionDeductionsId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
