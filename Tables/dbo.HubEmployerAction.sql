CREATE TABLE [dbo].[HubEmployerAction]
(
[EmployerActionId] [int] NOT NULL,
[EmployerId] [int] NULL,
[ActionId] [int] NULL,
[CompletedDate] [date] NULL,
[Completable] [bit] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[HubEmployerAction] ADD CONSTRAINT [PK__HubEmplo__6E1CFBBD45A4EDEB] PRIMARY KEY CLUSTERED ([EmployerActionId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
