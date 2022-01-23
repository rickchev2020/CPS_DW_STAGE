CREATE TABLE [dbo].[TruvenPlanMatrix]
(
[TruvenPlanMatrixId] [int] NOT NULL IDENTITY(1, 1),
[PlanCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PlanLevel] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PlanDescription] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PlanType] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PlanStartDate] [date] NOT NULL,
[PlanStopDate] [date] NOT NULL,
[PlanInsuranceCarrier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CobraCoveredInd] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RetCoveredInd] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RatingMethod] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DrugPlanCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DrugPlanCarrier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VisionPlanCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VisionPlanCarrier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DentalPlanCode] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DentalPlanCarrier] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MentalHealthCoverageInd] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DentalCoverageInd] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[VisionCoverageInd] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DisabilitySurvivorCoverageInd] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MedicalCoverageInd] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DrugCoverageInd] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FullyInsuredMedical] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[TruvenPlanMatrix] ADD CONSTRAINT [PK_TruvenPlanMatrix] PRIMARY KEY CLUSTERED ([TruvenPlanMatrixId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
