CREATE TABLE [dbo].[HubEmployeeAction]
(
[EmployeeActionId] [int] NOT NULL,
[EmployeeId] [int] NOT NULL,
[ActionId] [int] NOT NULL,
[CompletedDate] [date] NULL,
[Completable] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HubEmployeeAction] ADD CONSTRAINT [PK__HubEmplo__2E43F401A166C19A] PRIMARY KEY CLUSTERED ([EmployeeActionId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
