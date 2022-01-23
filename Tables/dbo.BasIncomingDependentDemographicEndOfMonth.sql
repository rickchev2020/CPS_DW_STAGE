CREATE TABLE [dbo].[BasIncomingDependentDemographicEndOfMonth]
(
[BasDependentDemographicId] [int] NOT NULL IDENTITY(1, 1),
[EmployeeSsn] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExternalMemberId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSsn] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentLastName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentFirstName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentMiddleNameOrInitial] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentBirthdate] [date] NULL,
[DependentGender] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Relationship] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EbsUniqueDependentId] [int] NULL,
[DependentSequenceNumberLawson] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceMonth] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
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
ALTER TABLE [dbo].[BasIncomingDependentDemographicEndOfMonth] ADD CONSTRAINT [PK__BasIncom__5FBF616FBB16FB04] PRIMARY KEY CLUSTERED ([BasDependentDemographicId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
