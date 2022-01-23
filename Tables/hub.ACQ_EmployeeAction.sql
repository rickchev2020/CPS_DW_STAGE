CREATE TABLE [hub].[ACQ_EmployeeAction]
(
[EmployeeActionId] [int] NULL,
[EmployeeId] [int] NULL,
[ActionId] [int] NULL,
[CompletedDate] [date] NULL,
[Completable] [bit] NULL,
[CT_EmployeeActionID] [int] NULL,
[SYS_CHANGE_OPERATION] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SYS_CHANGE_CONTEXT] [varbinary] (128) NULL,
[lastversion] [bigint] NULL,
[maxversion] [bigint] NULL,
[ETLupdatetimestamp] [datetime] NULL
) ON [PRIMARY]
GO
