CREATE TABLE [dbo].[ACQ_WBPBENTAG]
(
[COMPANY] [smallint] NULL,
[PLAN_TYPE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMPLOYEE] [int] NULL,
[START_DATE] [datetime] NULL,
[PLAN_CODE] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LCMS_ROSTER] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SS_PARTIC] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMP_STATUS] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESS_LEVEL] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NONPARTIC_CD] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP_VEST] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SRA_VEST] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[USER_ID] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TIME_STAMP] [decimal] (6, 0) NULL,
[DATE_STAMP] [datetime] NULL,
[CT_COMPANY] [smallint] NULL,
[CT_PLAN_TYPE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CT_EMPLOYEE] [int] NULL,
[CT_START_DATE] [datetime] NULL,
[CT_PLAN_CODE] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
