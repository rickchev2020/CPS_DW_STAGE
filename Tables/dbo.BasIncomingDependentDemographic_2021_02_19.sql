CREATE TABLE [dbo].[BasIncomingDependentDemographic_2021_02_19]
(
[BasIncomingDependentDemographicId] [int] NOT NULL IDENTITY(1, 1),
[EmployeeSsn] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Filler2] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSsn] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentLastName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentFirstName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentMiddleNameOrInitial] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentBirthdate] [date] NULL,
[DependentGender] [varchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Relationship] [varchar] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EbsUniqueDependentId] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSequenceNumberLawson] [varchar] (24) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[BasIncomingDependentDemographic_2021_02_19] ADD CONSTRAINT [PK__BasIncom__0A48FFAA4AF598BB] PRIMARY KEY CLUSTERED ([BasIncomingDependentDemographicId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
