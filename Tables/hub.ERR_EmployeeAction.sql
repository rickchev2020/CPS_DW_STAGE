CREATE TABLE [hub].[ERR_EmployeeAction]
(
[SYS_CHANGE_OPERATION] [nvarchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SYS_CHANGE_CONTEXT] [binary] (128) NULL,
[lastversion] [bigint] NULL,
[maxversion] [bigint] NULL,
[ETLupdatetimestamp] [datetime] NULL,
[ActionId] [int] NULL,
[EmployeeActionId] [int] NULL,
[EmployeeId] [int] NULL,
[CompletedDate] [date] NULL,
[Completable] [bit] NULL,
[CT_EmployeeActionID] [int] NULL,
[rownumber] [bigint] NULL,
[ErrorCode] [int] NULL,
[ErrorColumn] [int] NULL,
[ErrorDescription] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
