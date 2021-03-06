CREATE TABLE [dbo].[ACQ_PRTIME]
(
[COMPANY] [smallint] NULL,
[EMPLOYEE] [int] NULL,
[CHECK_ID] [decimal] (12, 0) NULL,
[PAY_SUM_GRP] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TIME_SEQ] [decimal] (12, 0) NULL,
[JOB_CODE] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PROCESS_LEVEL] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WORK_STATE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HOURS] [decimal] (7, 2) NULL,
[RATE] [decimal] (13, 4) NULL,
[WAGE_AMOUNT] [decimal] (13, 2) NULL,
[DEPARTMENT] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PCT_DIST_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SHIFT] [tinyint] NULL,
[DST_ACCT_UNIT] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DST_ACCOUNT] [int] NULL,
[DST_SUB_ACCT] [smallint] NULL,
[DIST_COMPANY] [smallint] NULL,
[TR_DATE] [datetime] NULL,
[UNION_CODE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OT_PREM_AMT] [decimal] (13, 2) NULL,
[SHIFT_DIFF] [decimal] (13, 2) NULL,
[PAYROLL_YEAR] [smallint] NULL,
[QUARTER] [tinyint] NULL,
[PCD_SEQ_NBR] [int] NULL,
[PER_BEG_DATE] [datetime] NULL,
[PER_END_DATE] [datetime] NULL,
[WRK_BEG_DATE] [datetime] NULL,
[WRK_END_DATE] [datetime] NULL,
[CHECK_TYPE] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LOCAT_CODE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WC_STATE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OT_RECORD] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R_POSITION] [char] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVITY] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACCT_CATEGORY] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TIME_ACC_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SHFT_DIFF_RATE] [decimal] (13, 4) NULL,
[OT_RATE] [decimal] (13, 4) NULL,
[ATN_OBJ_ID] [decimal] (12, 0) NULL,
[GLT_OBJ_ID] [decimal] (12, 0) NULL,
[RECONCILED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TAX_FREQ_OVER] [smallint] NULL,
[REMUN_CODE] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BUS_NBR_GRP] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REPORT_ENTITY] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QC_ENT_NBR_GRP] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WC_CLASS] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURRENCY_CODE] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURR_ND] [tinyint] NULL,
[HM_PROCESS_LEV] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CA_WC_CLASS] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COUNTRY_CODE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PENS_SEQ_NBR] [smallint] NULL,
[ABN_OBJ_ID] [decimal] (12, 0) NULL,
[PAY_UNITS] [decimal] (7, 2) NULL,
[UNIT_MEASURE] [char] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[USER_ID] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE_STAMP] [datetime] NULL,
[NON_EARNINGS] [tinyint] NULL,
[ORIG_OBJ_ID] [decimal] (12, 0) NULL,
[RECORD_TYPE] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ATTEND_CODE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REASON_CODE] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TES_OBJ_ID] [decimal] (12, 0) NULL,
[RETRO_PENSION] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SERVICE_CODE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TIME_STAMP] [decimal] (6, 0) NULL,
[CREATE_DATE] [datetime] NULL,
[CREATE_TIME] [decimal] (6, 0) NULL,
[CREATE_USER_ID] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LNK_TIME_SEQ] [decimal] (12, 0) NULL,
[CONTRACT_YEAR] [smallint] NULL,
[CONT_SEQ_NBR] [decimal] (12, 0) NULL,
[CWC_EFFECT_DT] [datetime] NULL,
[CONTRACT_NBR] [int] NULL,
[SEGMENT_NBR] [int] NULL,
[CYC_START_DATE] [datetime] NULL,
[CYC_END_DATE] [datetime] NULL,
[CM_REG_FLAG] [tinyint] NULL,
[CM130_FLAG] [tinyint] NULL,
[MEMO] [char] (64) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXP_RPT_NBR] [char] (22) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REC_TYPE] [smallint] NULL,
[NOTIONAL] [decimal] (13, 4) NULL,
[ADDTL_RATE] [tinyint] NULL,
[PRTSET12_SS_SW] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRTSET8_SS_SW] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRTSET9_SS_SW] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CT_COMPANY] [smallint] NULL,
[CT_EMPLOYEE] [int] NULL,
[CT_CHECK_ID] [decimal] (12, 0) NULL,
[CT_PAY_SUM_GRP] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CT_TIME_SEQ] [decimal] (12, 0) NULL,
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
