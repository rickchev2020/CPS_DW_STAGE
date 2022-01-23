CREATE TABLE [hub].[ACQ_ACTION]
(
[ActionId] [int] NULL,
[Title] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DueDate] [date] NULL,
[StartDate] [date] NULL,
[EndDate] [date] NULL,
[System] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CT_ActionID] [int] NOT NULL,
[SYS_CHANGE_OPERATION] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SYS_CHANGE_CONTEXT] [varbinary] (128) NULL,
[lastversion] [bigint] NULL,
[maxversion] [bigint] NULL,
[ETLupdatetimestamp] [datetime] NULL
) ON [PRIMARY]
GO
