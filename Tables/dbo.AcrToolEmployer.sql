CREATE TABLE [dbo].[AcrToolEmployer]
(
[AcrToolEmployerId] [int] NOT NULL IDENTITY(1, 1),
[EmployerNumber] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployerName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StateCode] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZipCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContactEmail] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CrpAdoptionDate] [date] NULL,
[ChpAdoptionDate] [date] NULL,
[ChpMinHours] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PortalRegisteredInd] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChpElectionInd] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[AcrToolEmployer] ADD CONSTRAINT [PK__AcrToolE__F8F36415E92469A2] PRIMARY KEY CLUSTERED ([AcrToolEmployerId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
