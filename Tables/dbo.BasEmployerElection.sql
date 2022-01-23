CREATE TABLE [dbo].[BasEmployerElection]
(
[BasEmployerElectionId] [int] NOT NULL IDENTITY(1, 1),
[ERNumber] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployerFullName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PlanYear] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FederalEIN] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WorkZipCode] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Exempt_NonExempt] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QCCOIndicator] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LimitedAdoptionIndicator] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CDSPEligIndicator] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SuppLifeEligIndicator] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccidentInsuranceEligIndicator] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CriticalIllnessEligIndicator] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDEligIndicator] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRPPlanTraditional] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRPPlanAccountOption] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRPWaitingPeriodFlag] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRPAcctOptionEligFactor] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRSPElig] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHPMEDHours] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHPDENHours] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHPVISHours] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ICAccess] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PayFrequency] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CategoryofActualparticipation] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AOLastEffectiveDate] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AOOriginalEffectiveDate] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChangeDate] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EffectiveDate] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Med1] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Med2] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Med3] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GEOBlue_Option1] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GEOBlue_Option2] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DentalUnbundled] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DentalBundledNonHMO] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DentalBundledHMO] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GEOBlueDental] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VisionUnbundled] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VisionBundled] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GEOBlueVision] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BasEmployerElection] ADD CONSTRAINT [PK__BasEmplo__2E973EA071399B53] PRIMARY KEY CLUSTERED ([BasEmployerElectionId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO