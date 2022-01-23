CREATE TABLE [dbo].[BasIncomingDependentDemographicEndOfMonth_v01_del]
(
[EmployeeSsn] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Filler2] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSsn] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentLastName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentFirstName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentMiddleNameOrInitial] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentBirthdate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentGender] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Relationship] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EbsUniqueDependentId] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSequenceNumberLawson] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertDate] [datetime] NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateDate] [datetime] NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Month] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
