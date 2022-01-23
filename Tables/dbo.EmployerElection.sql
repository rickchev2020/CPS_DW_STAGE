CREATE TABLE [dbo].[EmployerElection]
(
[EmployerElectionId] [int] NOT NULL,
[EmployerNumber] [nvarchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CurrentStep] [int] NOT NULL,
[CompletedUser] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompletedOrganization] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompletedDate] [datetime] NULL,
[AuditInsertProcessName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditInsertUser] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditInsertDate] [datetime] NOT NULL,
[AuditUpdateProcessName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditUpdateUser] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditUpdateDate] [datetime] NOT NULL,
[AuditExportProcessName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditExportUser] [nvarchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuditExportDate] [datetime] NULL,
[ConfirmationNumber] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__EmployerE__Confi__7755B73D] DEFAULT (''),
[StepsComplete] [bit] NOT NULL CONSTRAINT [DF__EmployerE__Steps__7849DB76] DEFAULT ((0)),
[Year] [int] NOT NULL CONSTRAINT [DF__EmployerEl__Year__793DFFAF] DEFAULT ((0)),
[AuthorizedName] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuthorizedEmail] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AuthorizedEmailConsent] [bit] NOT NULL CONSTRAINT [DF__EmployerE__Autho__7A3223E8] DEFAULT ((0)),
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