CREATE TABLE [dbo].[PromanageVisionDeductibleFile]
(
[PromanageVisionDeductibleFileId] [int] NOT NULL IDENTITY(1, 1),
[BenefitCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PlanCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IndividualDeductible] [int] NULL,
[FamilyDeductible] [int] NULL,
[EmbeddedDeductible] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeductibleNotes] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[PromanageVisionDeductibleFile] ADD CONSTRAINT [PK__Promanag__3CC343E223875C6B] PRIMARY KEY CLUSTERED ([PromanageVisionDeductibleFileId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
