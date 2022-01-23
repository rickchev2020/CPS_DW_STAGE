CREATE TABLE [dbo].[RetirementChpExtensionDemographics]
(
[RetirementChpExtensionDemographicsId] [int] NOT NULL IDENTITY(1, 1),
[MemberNumber] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployerNumber] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployerZip] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MonthsInChp] [int] NULL,
[MemberBirthday] [date] NULL,
[SpouseBirthday] [date] NULL,
[FirstName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[RetirementChpExtensionDemographics] ADD CONSTRAINT [PK__Retireme__61D4FBDED4D357D3] PRIMARY KEY CLUSTERED ([RetirementChpExtensionDemographicsId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
