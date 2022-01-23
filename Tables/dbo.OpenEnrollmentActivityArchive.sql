CREATE TABLE [dbo].[OpenEnrollmentActivityArchive]
(
[OpenEnrollmentActivityId] [int] NOT NULL IDENTITY(1, 1),
[EmployerNumber] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MemberNumber] [int] NOT NULL,
[ActionDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ActionRole] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Username] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ConfirmedDate] [datetime] NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OpenEnrollmentActivityArchive] ADD CONSTRAINT [PK__OpenEnro__687772DF3C833A6A] PRIMARY KEY CLUSTERED ([OpenEnrollmentActivityId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
