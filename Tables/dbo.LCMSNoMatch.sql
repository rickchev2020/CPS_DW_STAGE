CREATE TABLE [dbo].[LCMSNoMatch]
(
[ID_TYPE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CW_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TITLE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FIRST_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MIDDLE_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUFFIX] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BIRTHDATE] [date] NULL,
[CLASS_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CITY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATE_CODE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZIP] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COUNTRY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATUS] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATUS_ACTION1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EFFECTIVE_DATE] [date] NULL,
[DIST_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[load_datetm] [datetime] NOT NULL
) ON [PRIMARY]
GO
