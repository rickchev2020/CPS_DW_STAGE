CREATE TABLE [dbo].[CpsToBasLawsonMiscFileParallel]
(
[CpsToBasLawsonMiscFileId] [int] NOT NULL IDENTITY(1, 1),
[LINE ID] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMPLOYER ID] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMPLOYEE SSN] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMPLOYEE ID] [int] NULL,
[LAST NAME] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FIRST NAME] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MIDDLE NAME / INITIAL] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUFFIX] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS1] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS2] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS3] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CITY] [varchar] (58) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATE] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[POSTAL] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COUNTRY] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS EFFECTIVE DATE] [varchar] (8000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP Adj Service Date] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Original Hire Date] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson ID] [int] NOT NULL,
[Lawson EMS_EMP_STATUS] [varchar] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson EMS_EMP_STATUS Effective Date] [nvarchar] (4000) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson EMS_Description] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Okta Email Address] [varchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP Continuous Service] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CpsToBasLawsonMiscFileParallel] ADD CONSTRAINT [PK__CpsToBas__65AD91B1230468E3] PRIMARY KEY CLUSTERED ([CpsToBasLawsonMiscFileId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
