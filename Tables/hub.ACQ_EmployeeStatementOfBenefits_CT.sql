CREATE TABLE [hub].[ACQ_EmployeeStatementOfBenefits_CT]
(
[EmployeeStatementOfBenefitsId] [int] NULL,
[EmployeeId] [int] NULL,
[MemberName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AnnualCompensationDate] [date] NULL,
[AnnualCompensation] [decimal] (19, 4) NULL,
[ErContributionToChp] [decimal] (19, 4) NULL,
[ErContributionToCdsp] [decimal] (19, 4) NULL,
[ErMatchForCrsp] [decimal] (19, 4) NULL,
[CrpProjectedAnnualAmount] [decimal] (19, 4) NULL,
[CrpProjectedAccountBalance] [decimal] (19, 4) NULL,
[CrpProjectedAnnualDate] [date] NULL,
[ChpEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChpOption] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChpParticipation] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CdspEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CdspMonthlyBenefitAmount] [decimal] (19, 4) NULL,
[SbCdspEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SbCdspCurrentParticipation] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SbAipEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SbAipCurrentParticipation] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LsbCdspAmount] [decimal] (19, 4) NULL,
[LsbAipAmount] [decimal] (19, 4) NULL,
[DbCdspEnrolledSpouseAmount] [decimal] (19, 4) NULL,
[DbCdspEnrolledDependentAmount] [decimal] (19, 4) NULL,
[DbCdspDependentName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DbAipEnrolledSpouseAmount] [decimal] (19, 4) NULL,
[DbAipCdspEnrolledDependentAmount] [decimal] (19, 4) NULL,
[DbAipCdspDependentName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CrpEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CrpCurrentParticipation] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CrspEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CrspEstimatedDeferralPercent] [int] NULL,
[CrspEstimatedDeferralDate] [date] NULL,
[CrspBalanceAmount] [decimal] (19, 4) NULL,
[CrspBalanceDate] [date] NULL,
[CT_EmployeeStatementOfBenefitsID] [int] NOT NULL,
[SYS_CHANGE_OPERATION] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SYS_CHANGE_CONTEXT] [varbinary] (128) NULL,
[lastversion] [bigint] NULL,
[maxversion] [bigint] NULL,
[ETLupdatetimestamp] [datetime] NOT NULL,
[AccidentEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ACQ_Emplo__Accid__17C286CF] DEFAULT (NULL),
[AccidentCurrentCoverage] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ACQ_Emplo__Accid__18B6AB08] DEFAULT (NULL),
[AccidentCurrentParticipation] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ACQ_Emplo__Accid__19AACF41] DEFAULT (NULL),
[CritillEmployeeEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ACQ_Emplo__Criti__1A9EF37A] DEFAULT (NULL),
[CritillEmployeeCurrentCoverage] [decimal] (19, 4) NULL CONSTRAINT [DF__ACQ_Emplo__Criti__1B9317B3] DEFAULT (NULL),
[CritillSpouseEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ACQ_Emplo__Criti__1C873BEC] DEFAULT (NULL),
[CritillSpouseCurrentCoverage] [decimal] (19, 4) NULL CONSTRAINT [DF__ACQ_Emplo__Criti__1D7B6025] DEFAULT (NULL),
[CritillChildEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ACQ_Emplo__Criti__1E6F845E] DEFAULT (NULL),
[CritillChildCurrentCoverage] [decimal] (19, 4) NULL CONSTRAINT [DF__ACQ_Emplo__Criti__1F63A897] DEFAULT (NULL),
[SupplifeEmployeeEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ACQ_Emplo__Suppl__2057CCD0] DEFAULT (NULL),
[SupplifeEmployeeCurrentCoverage] [decimal] (19, 4) NULL CONSTRAINT [DF__ACQ_Emplo__Suppl__214BF109] DEFAULT (NULL),
[SupplifeSpouseEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ACQ_Emplo__Suppl__22401542] DEFAULT (NULL),
[SupplifeSpouseCurrentCoverage] [decimal] (19, 4) NULL CONSTRAINT [DF__ACQ_Emplo__Suppl__2334397B] DEFAULT (NULL),
[SupplifeChildEnrollmentStatus] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL CONSTRAINT [DF__ACQ_Emplo__Suppl__24285DB4] DEFAULT (NULL),
[SupplifeChildCurrentCoverage] [decimal] (19, 4) NULL CONSTRAINT [DF__ACQ_Emplo__Suppl__251C81ED] DEFAULT (NULL)
) ON [PRIMARY]
GO
