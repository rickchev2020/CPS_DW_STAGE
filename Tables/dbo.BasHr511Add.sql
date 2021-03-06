CREATE TABLE [dbo].[BasHr511Add]
(
[LAST_NAME] [char] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FIRST_NAME] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[MIDDLE_INIT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NAME_SUFFIX] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NAME_PREFIX] [char] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[FICA_NBR] [char] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMP_STATUS] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DATE_HIRED] [datetime] NULL,
[ADJ_HIRE_DATE] [datetime] NULL,
[R_POSITION] [char] (12) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[JOB_CODE] [char] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PAY_RATE] [decimal] (13, 4) NOT NULL,
[WK_PHONE_NBR] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMAIL_ADDRESS] [char] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HIRE_SOURCE] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[BIRTHDATE] [datetime] NOT NULL,
[TRUE_MAR_STAT] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SEX] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ADDR1] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDR2] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADDR3] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CITY] [char] (58) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[STATE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ZIP] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[HM_PHONE_NBR] [char] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMAIL_PERSONAL] [char] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[STAND_HOURS] [decimal] (7, 2) NOT NULL,
[BEN_SALARY_1] [decimal] (11, 2) NOT NULL,
[BEN_SALARY_3] [decimal] (11, 2) NOT NULL,
[BEN_SALARY_2] [decimal] (11, 2) NOT NULL,
[BEN_SALARY_4] [decimal] (11, 2) NOT NULL,
[A_FIELD_97] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[A_FIELD_96] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SalariedOrHourlyIndicator] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EmploymentDesignation] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
