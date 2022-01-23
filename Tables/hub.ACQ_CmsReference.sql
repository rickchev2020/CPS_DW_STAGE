CREATE TABLE [hub].[ACQ_CmsReference]
(
[CmsReferenceId] [int] NULL,
[CmsType] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CmsSubType] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[StartTime] [datetime] NULL,
[EndTime] [datetime] NULL,
[Sequence] [smallint] NULL,
[CmsContentId] [int] NULL,
[RuleName] [varchar] (1000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CT_CmsReferenceID] [int] NULL,
[SYS_CHANGE_OPERATION] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SYS_CHANGE_CONTEXT] [varbinary] (128) NULL,
[lastversion] [bigint] NULL,
[maxversion] [bigint] NULL,
[ETLupdatetimestamp] [datetime] NULL
) ON [PRIMARY]
GO
