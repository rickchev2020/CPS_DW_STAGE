CREATE TABLE [dbo].[CpsToBasLawsonMiscFile]
(
[CpsToBasLawsonMiscFileId] [int] NOT NULL IDENTITY(1, 1),
[LINE ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMPLOYER ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMPLOYEE SSN] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMPLOYEE ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FIRST NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MIDDLE NAME / INITIAL] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUFFIX] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS3] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CITY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[POSTAL] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COUNTRY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS EFFECTIVE DATE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP Adj Service Date] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Original Hire Date] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Lawson EMS_EMP_STATUS] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson EMS_EMP_STATUS Effective Date] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson EMS_Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Okta Email Address] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP Continuous Service] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[CpsToBasLawsonMiscFile] ADD CONSTRAINT [PK__CpsToBas__65AD91B14B07D22D] PRIMARY KEY CLUSTERED ([CpsToBasLawsonMiscFileId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
