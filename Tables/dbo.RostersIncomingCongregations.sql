CREATE TABLE [dbo].[RostersIncomingCongregations]
(
[CONG_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CONGID_TYPE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MAIL_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAILINGADD_1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAILINGADD_2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAILING_CITY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAILINGSTATE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAILINGZIP] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAILINGCOUNTRY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHYSICAL_ADD1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHYSICAL_ADD2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHYSICAL_CITY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHYSICALSTATE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHYSICALZIP] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHYSICALCOUNTRY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHONE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FAX] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMAIL] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WEBSITE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DIST_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DIST_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE_ORGANIZED] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ROSTERED_COUNT] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OFFICIAL_MAIL_ONLY] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MULTI_PARISH_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MULTI_PARISH_DATE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MULTI_PARISH_END_DATE] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FED_TAX_NUMBER] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MEMBERSHIP_BAPTIZED] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MEMBERSHIP_CONFIRMED] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WEEKLY_AVG_ATTEND] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
