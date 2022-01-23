CREATE TABLE [dbo].[RostersIncomingRosteredStaffAssignments]
(
[CW_ID_TYPE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CW_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ORGID_TYPE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ORG_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ORG_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ORG_CITY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ORG_STATE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[POSITION_TITLE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[START_DATE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
