CREATE TABLE [dbo].[ACQ_PRSYSTEM]
(
[COMPANY] [smallint] NULL,
[PROCESS_LEVEL] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NAME] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LONG_NAME] [char] (75) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDR1] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDR2] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDR3] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDR4] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CITY] [char] (58) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ZIP] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAYROLL_YEAR] [smallint] NULL,
[BSI_COMPANY] [char] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GL_UNITS] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DC_DED_CLASS] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OVERTIME] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAY_IN_KIND] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TIPS] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AUTO_EMPLOYEE] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_EMPLOYEE] [int] NULL,
[BATCH_OPTION] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AUTO_BTCH_NBR] [int] NULL,
[BATCH_CONTROL] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ES_DIST_CO] [smallint] NULL,
[ES_ACCT_UNIT] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ES_ACCOUNT] [int] NULL,
[ES_SUB_ACCT] [smallint] NULL,
[EXP_DIST_CO] [smallint] NULL,
[EXP_ACCT_UNIT] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXP_ACCOUNT] [int] NULL,
[EXP_SUB_ACCT] [smallint] NULL,
[ACH_COMP_ID] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMPLOYEE_SEQ] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BANK_CODE] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CL_DIST_CO] [smallint] NULL,
[CL_ACCT_UNIT] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CL_ACCOUNT] [int] NULL,
[CL_SUB_ACCT] [smallint] NULL,
[PIK_DIST_CO] [smallint] NULL,
[PIK_ACCT_UNIT] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PIK_ACCOUNT] [int] NULL,
[PIK_SUB_ACCT] [smallint] NULL,
[PR132_RUN_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PR140_RUN_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PR160_RUN_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PR199_RUN_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TA170_RUN_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TA199_RUN_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TP135_RUN_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMPLETE_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SERIAL_NBR] [int] NULL,
[AUTO_APP] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_APP] [int] NULL,
[ANNUAL_HOURS] [decimal] (8, 4) NULL,
[EEO4_OPTION] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FNCTN_DESC] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BEG_SAL_RANGE_01] [decimal] (13, 4) NULL,
[BEG_SAL_RANGE_02] [decimal] (13, 4) NULL,
[BEG_SAL_RANGE_03] [decimal] (13, 4) NULL,
[BEG_SAL_RANGE_04] [decimal] (13, 4) NULL,
[BEG_SAL_RANGE_05] [decimal] (13, 4) NULL,
[BEG_SAL_RANGE_06] [decimal] (13, 4) NULL,
[BEG_SAL_RANGE_07] [decimal] (13, 4) NULL,
[END_SAL_RANGE_01] [decimal] (13, 4) NULL,
[END_SAL_RANGE_02] [decimal] (13, 4) NULL,
[END_SAL_RANGE_03] [decimal] (13, 4) NULL,
[END_SAL_RANGE_04] [decimal] (13, 4) NULL,
[END_SAL_RANGE_05] [decimal] (13, 4) NULL,
[END_SAL_RANGE_06] [decimal] (13, 4) NULL,
[END_SAL_RANGE_07] [decimal] (13, 4) NULL,
[LIMIT_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PRD_OPTION] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GLI_OPTION] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PS_OPTION] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SEC_SEARCH] [smallint] NULL,
[PL_OPTION] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACR_DIST_CO] [smallint] NULL,
[ACR_ACCT_UNIT] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_CHECK_ID] [decimal] (12, 0) NULL,
[INCLUDE_PR132] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INCLUDE_TP135] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_TIME_SEQ] [decimal] (12, 0) NULL,
[OT_PLAN_CODE_01] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OT_PLAN_CODE_02] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OT_PLAN_CODE_03] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OT_PLAN_CODE_04] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OT_PLAN_CODE_05] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RECIP_CALC] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LOCAL_MAX] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_JOB_REQ] [int] NULL,
[IMM_DEST] [int] NULL,
[IMM_DEST_NAME] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IMM_ORIG] [decimal] (10, 0) NULL,
[IMM_ORIG_NAME] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AT_LIMIT_DEDS] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SEC_LVL] [tinyint] NULL,
[SEC_LOCATION] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHK_DIGIT_EDIT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AUTO_POSITION] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_POSITION] [decimal] (12, 0) NULL,
[REQ_CLOSE_STAT] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTION_CODE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REASON] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AUTO_JOB_REQ] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AP_COMPANY] [smallint] NULL,
[BSI_CONT_ALLOC] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURRENCY_CODE] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURR_ND] [tinyint] NULL,
[CURRENCY_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COUNTRY_CODE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WORK_COUNTRY] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CA_REL_CORP] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[US_REL_CORP] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BUS_NBR_GRP] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QC_ENT_NBR_GRP] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COUNTRY_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAX_DED_IND] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HIST_CORR_FLAG] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TAX_FORMS] [tinyint] NULL,
[EMP_TAX_ADDR] [tinyint] NULL,
[DUP_SOC_NBR] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTIVE_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[USER_ID] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE_STAMP] [datetime] NULL,
[TIME_STAMP] [decimal] (6, 0) NULL,
[RECRUIT_FLAG] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TA146_RUN_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TA198_RUN_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INCLUDE_UK121] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UK121_RUN_FLG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMPLOYER_DED] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TAX_LOC_MSGLVL] [tinyint] NULL,
[TAX_FILTER] [tinyint] NULL,
[UPGRADE_FLD1] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OVR_DED_EXP] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDR_CONFIG] [tinyint] NULL,
[LOCAL_RECIP_CD] [smallint] NULL,
[LP_POST_RULE] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHONE_NBR] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHONE_CNTRY] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PHONE_EXT] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LTM_FLAG] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACH_COMP_NAME] [char] (16) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMAIL_ADD] [char] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PAN] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BUS_NBR_GRP_FL] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ROUND_METH_DOL] [tinyint] NULL,
[ROUND_TO_DOL] [decimal] (18, 6) NULL,
[LICENSE_NBR] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PENSION_ID] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STD_HRS_CLASS] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[UNPD_LEAVE_CLS] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[INTERFACE] [tinyint] NULL,
[CT_COMPANY] [smallint] NULL,
[CT_PROCESS_LEVEL] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
