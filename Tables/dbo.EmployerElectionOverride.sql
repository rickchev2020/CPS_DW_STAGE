CREATE TABLE [dbo].[EmployerElectionOverride]
(
[EmployerElectionOverrideId] [int] NOT NULL,
[EmployerNumber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Year] [int] NOT NULL,
[MaxHealthOverride] [int] NULL,
[AuditInsertProcessName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditInsertUser] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditInsertDate] [datetime] NOT NULL,
[AuditUpdateProcessName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditUpdateUser] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditUpdateDate] [datetime] NOT NULL,
[AuditExportProcessName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditExportUser] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditExportDate] [datetime] NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
