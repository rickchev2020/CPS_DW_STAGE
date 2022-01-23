CREATE TABLE [dbo].[OpenEnrollmentActivity]
(
[OpenEnrollmentActivityId] [int] NOT NULL IDENTITY(1, 1),
[Employer ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employee ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CPS Member ID] [int] NULL,
[Employee SSN] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[First name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Work email] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Personal Email] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Action Taken] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ROLE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Requested By] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Confirmed On] [datetime] NULL,
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
ALTER TABLE [dbo].[OpenEnrollmentActivity] ADD CONSTRAINT [PK__OpenEnro__687772DF6BBBC4E3] PRIMARY KEY CLUSTERED ([OpenEnrollmentActivityId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
