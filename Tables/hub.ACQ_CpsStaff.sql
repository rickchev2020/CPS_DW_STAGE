CREATE TABLE [hub].[ACQ_CpsStaff]
(
[CpsStaffId] [int] NULL,
[FirstName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [varchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneNumberPrimary] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneNumberSecondary] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProfilePhotoUrl] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CT_CpsStaffID] [int] NULL,
[SYS_CHANGE_OPERATION] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SYS_CHANGE_CONTEXT] [varbinary] (128) NULL,
[lastversion] [bigint] NULL,
[maxversion] [bigint] NULL,
[ETLupdatetimestamp] [datetime] NULL
) ON [PRIMARY]
GO
