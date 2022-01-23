CREATE TABLE [dbo].[OpenEnrollmentElection]
(
[OpenEnrollmentElectionId] [int] NOT NULL IDENTITY(1, 1),
[Employer ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employee ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CPS Member ID] [int] NULL,
[Employee SSN] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[First Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Work Email] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Personal Email] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address 1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address 2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Zip] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Benefit Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plan Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Tier Option Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Elected Amount] [decimal] (11, 2) NULL,
[EE Inforce Cost Per Month] [decimal] (11, 2) NULL,
[ER Inforce Cost Per Month] [decimal] (11, 2) NULL,
[Change Reason] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[OpenEnrollmentElection] ADD CONSTRAINT [PK__OpenEnro__50F93F0CC7E8C0D1] PRIMARY KEY CLUSTERED ([OpenEnrollmentElectionId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
