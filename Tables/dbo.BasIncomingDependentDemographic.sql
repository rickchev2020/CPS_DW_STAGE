CREATE TABLE [dbo].[BasIncomingDependentDemographic]
(
[BasIncomingDependentDemographicId] [int] NOT NULL IDENTITY(1, 1),
[EmployeeSsn] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployeeId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSsn] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentLastName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentFirstName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentMiddleNameOrInitial] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentBirthdate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentGender] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Relationship] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EbsUniqueDependentId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSequenceNumberLawson] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentSuffix] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MarriageDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Disabled] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DisabledEffectiveDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QualifiedMedicalChildSupportOrder] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QualifiedMedicalChildSupportOrderEffectiveDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DisabledMedicareEligibility] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DisabledMedicareEligibilityEffectiveDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentMedicareEligible] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsStudent] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MedicarePrimaryIndicator] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentAddress1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentAddress2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentAddress3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentCity] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentState] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DependentPostal] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeletedDependentFlag] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsVerifiedDependent] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[BasIncomingDependentDemographic] ADD CONSTRAINT [PK__BasIncom__0A48FFAAF933B449] PRIMARY KEY CLUSTERED ([BasIncomingDependentDemographicId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO