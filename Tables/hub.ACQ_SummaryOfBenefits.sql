CREATE TABLE [hub].[ACQ_SummaryOfBenefits]
(
[SummaryOfBenefitsId] [int] NULL,
[PlanOptionId] [int] NULL,
[SbcName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SbcUrl] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CT_SummaryOfBenefitsID] [int] NULL,
[SYS_CHANGE_OPERATION] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SYS_CHANGE_CONTEXT] [varbinary] (128) NULL,
[lastversion] [bigint] NULL,
[maxversion] [bigint] NULL,
[ETLupdatetimestamp] [datetime] NULL
) ON [PRIMARY]
GO
