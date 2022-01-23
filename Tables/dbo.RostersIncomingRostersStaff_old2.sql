CREATE TABLE [dbo].[RostersIncomingRostersStaff_old2]
(
[ID_TYPE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CW_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[TITLE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FIRST_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MIDDLE_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUFFIX] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BIRTHDATE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLASS_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDRESS2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CITY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATE_CODE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZIP] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COUNTRY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHONE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMAIL] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATUS] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATUS_ACTION] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EFFECTIVE_DATE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DIST_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DIST_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OFFICIAL_MAIL_ONLY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ROSTER_DATE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[RostersIncomingRostersStaff_old2] ADD CONSTRAINT [PK_Incoming_Rosters_Staff] PRIMARY KEY CLUSTERED ([ID_TYPE], [CW_ID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
