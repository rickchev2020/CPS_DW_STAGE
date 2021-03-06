CREATE TABLE [dbo].[BasBasicLifeSnapshot]
(
[EFFECTIVE_DATE] [datetime] NULL,
[FIRST_NAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MIDDLE_NAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_NAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SSN] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BENEFIT_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BENEFIT_NAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLAN_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PLAN_NAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TIER_OPTION_ID] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TIER_NAME] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INITIAL_BENEFIT_AMOUNT] [float] NULL,
[FINAL_BENEFIT_AMOUNT] [float] NULL,
[PROCESSED_ATTRIBUTES] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REPORTED_ATTRIBUTES] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COVERAGE_EFFECTIVE_DATE] [datetime] NULL,
[COVERAGE_TERMINATION_DATE] [nvarchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BasBasicLifeSnapshot] ADD CONSTRAINT [PK__BasBasic__CA1E8E3D84039841] PRIMARY KEY CLUSTERED ([SSN]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
