CREATE TABLE [dbo].[PricingCommunityRates]
(
[PlanCode] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BenefitId] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CostArea] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Provider] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Year] [int] NOT NULL,
[Self] [decimal] (18, 2) NOT NULL,
[SelfSpouse] [decimal] (18, 2) NOT NULL,
[SelfChild] [decimal] (18, 2) NOT NULL,
[Family] [decimal] (18, 2) NOT NULL,
[Child] [decimal] (18, 2) NOT NULL,
[Spouse] [decimal] (18, 2) NOT NULL,
[SpouseChild] [decimal] (18, 2) NOT NULL,
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
ALTER TABLE [dbo].[PricingCommunityRates] ADD CONSTRAINT [PK_CommunityRates] PRIMARY KEY CLUSTERED ([PlanCode], [BenefitId], [CostArea], [Provider], [Year]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
