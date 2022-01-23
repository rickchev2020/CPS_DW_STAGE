CREATE TABLE [dbo].[RetirementChpExtensionBenefits]
(
[RetirementChpExtensionBenefitsId] [int] NOT NULL IDENTITY(1, 1),
[MemberNumber] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanCode] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CoverageLevel] [int] NULL,
[ExtensionStartDate] [date] NULL,
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
ALTER TABLE [dbo].[RetirementChpExtensionBenefits] ADD CONSTRAINT [PK__Retireme__7CAD9239A35FDA28] PRIMARY KEY CLUSTERED ([RetirementChpExtensionBenefitsId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
