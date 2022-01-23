CREATE TABLE [hub].[ACQ_PlanService]
(
[PlanServiceId] [int] NULL,
[PlanName] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShortPlanName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sequence] [smallint] NULL,
[CT_PlanServiceID] [int] NULL,
[SYS_CHANGE_OPERATION] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SYS_CHANGE_CONTEXT] [varbinary] (128) NULL,
[lastversion] [bigint] NULL,
[maxversion] [bigint] NULL,
[ETLupdatetimestamp] [datetime] NULL
) ON [PRIMARY]
GO
