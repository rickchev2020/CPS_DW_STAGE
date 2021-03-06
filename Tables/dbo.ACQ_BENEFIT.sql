CREATE TABLE [dbo].[ACQ_BENEFIT]
(
[COMPANY] [smallint] NULL,
[PLAN_TYPE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMPLOYEE] [int] NULL,
[START_DATE] [datetime] NULL,
[PLAN_CODE] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FLEX_PLAN] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STOP_DATE] [datetime] NULL,
[PLAN_OPTION] [smallint] NULL,
[COV_OPTION] [smallint] NULL,
[CMP_FLX_CONT] [decimal] (13, 4) NULL,
[EMP_PRE_CONT] [decimal] (13, 4) NULL,
[EMP_AFT_CONT] [decimal] (13, 4) NULL,
[COMP_CONT] [decimal] (13, 4) NULL,
[PREM_UPD_DT] [datetime] NULL,
[ELIG_UPD_DT] [datetime] NULL,
[COV_UPD_DT] [datetime] NULL,
[GL_UPD_DT] [datetime] NULL,
[PAY_RATE] [decimal] (13, 4) NULL,
[COVER_AMT] [decimal] (11, 2) NULL,
[DEP_COVER_AMT] [decimal] (11, 2) NULL,
[PCT_AMT_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NBR_HOURS] [decimal] (6, 3) NULL,
[BOND_DED_AMT] [decimal] (11, 2) NULL,
[NBR_PURCH] [smallint] NULL,
[YTD_CONT] [decimal] (13, 2) NULL,
[CMP_SEQ_NBR] [smallint] NULL,
[CMP_AFT_SEQ] [smallint] NULL,
[PRE_SEQ_NBR] [smallint] NULL,
[AFT_SEQ_NBR] [smallint] NULL,
[FLEX_DED_SEQ] [smallint] NULL,
[STM_SEQ_NBR] [smallint] NULL,
[TA_UPD_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COV_OVER_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TAKEN_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CYCLES_REMAIN] [smallint] NULL,
[YTD_FLEX_CONT] [decimal] (13, 2) NULL,
[ELIG_GROUP] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COV_GROUP] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PREM_GROUP] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GL_GROUP] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MULTIPLE] [decimal] (6, 3) NULL,
[ANNUAL_AMT] [decimal] (11, 4) NULL,
[SMOKER] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CREATION_DATE] [datetime] NULL,
[UPD_DATE] [datetime] NULL,
[LAST_SEQ_PURCH] [smallint] NULL,
[COV_SAL_DATE] [datetime] NULL,
[COV_AGE_DATE] [datetime] NULL,
[CNT_SAL_DATE] [datetime] NULL,
[CNT_AGE_DATE] [datetime] NULL,
[CNT_SERV_DATE] [datetime] NULL,
[EFD_START_DATE] [datetime] NULL,
[PRE_AFT_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PEND_EVIDENCE] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMP_MATCH] [decimal] (5, 2) NULL,
[MTCH_UP_TO] [decimal] (5, 2) NULL,
[SOURCE] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURRENCY_CODE] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURR_ND] [tinyint] NULL,
[USER_ID] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TIME_STAMP] [decimal] (6, 0) NULL,
[TRAN_SEQ_NBR] [smallint] NULL,
[TA_OBJ_ID] [decimal] (12, 0) NULL,
[CO_PCT_AMT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMP_YTD_CONT] [decimal] (13, 2) NULL,
[DED_START_DATE] [datetime] NULL,
[DED_STOP_DATE] [datetime] NULL,
[CREATE_TIME] [decimal] (6, 0) NULL,
[CREATE_USER_ID] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L_INDEX] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BENSET9_SS_SW] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BENSETWB9_SS_SW] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L_ATBEN_SS_SW] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
