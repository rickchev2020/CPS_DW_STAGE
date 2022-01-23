CREATE TABLE [dbo].[ACQ_RATETBLHDR]
(
[COMPANY] [smallint] NULL,
[TABLE_CODE] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[START_DATE] [datetime] NULL,
[TABLE_TYPE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R_DESC] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PCT_RATE_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURRENCY_CODE] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURR_ND] [tinyint] NULL,
[CREATE_DATE] [datetime] NULL,
[CREATE_TIME] [decimal] (6, 0) NULL,
[CREATE_USER_ID] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE_STAMP] [datetime] NULL,
[TIME_STAMP] [decimal] (6, 0) NULL,
[USER_ID] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CT_COMPANY] [smallint] NULL,
[CT_TABLE_CODE] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CT_START_DATE] [datetime] NULL,
[CHANGE_TYPE] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRIMARYKEY] [char] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertDate] [datetime] NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateDate] [datetime] NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
