CREATE TABLE [dbo].[ERR_employed]
(
[EmployeeId] [int] NULL,
[EmployedId] [int] NULL,
[EmployerId] [int] NULL,
[RoleId] [int] NULL,
[ErrorCode] [int] NULL,
[ErrorColumn] [int] NULL,
[ErrorDescription] [nvarchar] (1024) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
