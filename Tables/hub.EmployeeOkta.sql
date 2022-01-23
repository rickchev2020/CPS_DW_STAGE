CREATE TABLE [hub].[EmployeeOkta]
(
[EmployeeOktaId] [int] NOT NULL IDENTITY(1, 1),
[EmployeeNumber] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last4Ssn] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthdate] [date] NULL,
[OktaEmail] [varchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OktaRegisteredDate] [date] NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [hub].[EmployeeOkta] ADD CONSTRAINT [PK__Employee__14171912D9319C22] PRIMARY KEY CLUSTERED ([EmployeeOktaId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
