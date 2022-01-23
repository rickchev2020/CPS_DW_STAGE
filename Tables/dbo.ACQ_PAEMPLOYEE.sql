CREATE TABLE [dbo].[ACQ_PAEMPLOYEE]
(
[COMPANY] [smallint] NULL,
[EMPLOYEE] [int] NULL,
[SUPP_ADDR1] [char] (57) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUPP_ADDR2] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUPP_ADDR3] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUPP_ADDR4] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUPP_CITY] [char] (58) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUPP_STATE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUPP_ZIP] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUPP_CNTRY_CD] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HM_PHONE_CNTRY] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HM_PHONE_NBR] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WK_PHONE_CNTRY] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WK_PHONE_NBR] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WK_PHONE_EXT] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EEO_CLASS] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SEX] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HANDICAP_ID] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMP_CODE] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[COMP_NBR] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VETERAN] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BIRTHDATE] [datetime] NULL,
[BIRTH_CITY] [char] (58) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BIRTH_STATE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BIRTH_CNTRY_CD] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SENIOR_DATE] [datetime] NULL,
[MAIDEN_LST_NM] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAIDEN_FST_NM] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAIDEN_MI] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FORMER_LST_NM] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FORMER_FST_NM] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FORMER_MI] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LOCAT_CODE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HIRE_SOURCE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SECURITY_CODE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SECURITY_NBR] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BARGAIN_UNIT] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CLOCK_NBR] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MAIL_GROUP] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MB_NBR] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DRAFT_STATUS] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FINAL_RANK] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CUR_STATUS] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_PHYSICAL] [datetime] NULL,
[PHY_SCHD] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NEXT_PHYSICAL] [datetime] NULL,
[HEIGHT_FT] [smallint] NULL,
[HEIGHT_IN] [smallint] NULL,
[WGHT] [decimal] (5, 2) NULL,
[BLOOD_TYPE] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARKING_LOT] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PARKING_SPACE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DR_LICENSE] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DR_LIC_ST] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EXP_DATE] [datetime] NULL,
[DR_LIC_CLASS] [char] (3) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[REV_SCHEDULE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NEXT_REVIEW] [datetime] NULL,
[NEXT_REV_CODE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_REVIEW] [datetime] NULL,
[LAST_MIL_SEQ] [smallint] NULL,
[LAST_REV_SEQ] [smallint] NULL,
[LAST_COM_SEQ] [smallint] NULL,
[LAST_INT_SEQ] [smallint] NULL,
[LAST_BNF_SEQ] [smallint] NULL,
[LAST_INV_NBR] [smallint] NULL,
[LAST_EPC_SEQ] [smallint] NULL,
[FNCTN_GROUP] [smallint] NULL,
[EXCLUDE_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NBR_HL_DEP] [smallint] NULL,
[NBR_DN_DEP] [smallint] NULL,
[LIFE_STYLE_CR] [smallint] NULL,
[HL_COV_PROOF] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DN_COV_PROOF] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HL_VERIFY_DT] [datetime] NULL,
[DN_VERIFY_DT] [datetime] NULL,
[SPOUSE_EMP] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SP_EMP_ADDR1] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SP_EMP_ADDR2] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SP_EMP_ADDR3] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SP_EMP_ADDR4] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SP_EMP_CITY] [char] (58) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SP_EMP_STATE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SP_EMP_ZIP] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SP_EMP_COUNTRY] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SP_EMP_PH_CNTR] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SP_EMP_PH_NBR] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OWNER_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[KEY_EMP_FLAG] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OFFICER] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HIGH_COMP] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SMOKER] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[I9_STATUS] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[I9_ALIEN_NBR] [char] (11) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[I9_ADMIT_NBR] [char] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[I9_STA_EXP_DT] [datetime] NULL,
[I9_DOC_NBR_01] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[I9_DOC_NBR_02] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[I9_DOC_TYPE_01] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[I9_DOC_TYPE_02] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[I9_DOC_EXP_DT_01] [datetime] NULL,
[I9_DOC_EXP_DT_02] [datetime] NULL,
[I9_AUTHORIZE] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TRUE_MAR_STAT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST_PAE_SEQ] [smallint] NULL,
[PRIMARY_CARE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FAMILY_AGG] [int] NULL,
[BEN_SALARY_1] [decimal] (11, 2) NULL,
[BEN_SALARY_2] [decimal] (11, 2) NULL,
[BEN_SALARY_3] [decimal] (11, 2) NULL,
[BEN_SALARY_4] [decimal] (11, 2) NULL,
[BEN_SALARY_5] [decimal] (11, 2) NULL,
[BEN_DATE_1] [datetime] NULL,
[BEN_DATE_2] [datetime] NULL,
[BEN_DATE_3] [datetime] NULL,
[BEN_DATE_4] [datetime] NULL,
[BEN_DATE_5] [datetime] NULL,
[SEC_LVL] [tinyint] NULL,
[SEC_LOCATION] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WORK_ZIP] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HEIGHT_UNIT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WGHT_UNIT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LANGUAGE_CODE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RELIGION] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DISABILITY] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUPP_PHONE_CNT] [char] (6) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUPP_PHONE_NBR] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CONSENT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ABORIGINAL] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VISIBLE_MIN] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RELATED_EMP] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[I9_DOC_DESCR_01] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[I9_DOC_DESCR_02] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BILINGUAL] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SUPP_COUNTY] [char] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STOCK_TRADE] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DATE_ASSIGN] [datetime] NULL,
[USER_AMOUNT] [decimal] (13, 4) NULL,
[ESTAB_PATIENT] [tinyint] NULL,
[PRIOR_COV_MO] [smallint] NULL,
[MEDICARE_IND] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TAX_FREQUENCY] [smallint] NULL,
[EMPLOYEE_TYPE] [smallint] NULL,
[SURVEY_DATE] [datetime] NULL,
[UPDATED_BY_LTM] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L_INDEX] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[L_ATPEM_SS_SW] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CT_COMPANY] [smallint] NULL,
[CT_EMPLOYEE] [int] NULL,
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
