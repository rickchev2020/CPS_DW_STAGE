CREATE TABLE [dbo].[RSFullMatchName]
(
[CW_ID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMPLOYEE] [int] NOT NULL,
[FIRST NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MIDDLE NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LAST NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RSAddr1] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Addr1] [varchar] (60) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RSCity] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CITY] [char] (58) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[RSState] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[STATE] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[PROCESS_LEVEL] [char] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ADJ_HIRE_DATE] [datetime] NOT NULL,
[TERM_DATE] [datetime] NOT NULL,
[A_FIELD] [char] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CLASS_NAME] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EMP_STATUS] [char] (2) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[StatAction] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACTION_DATE] [date] NULL,
[ETLRowStartDate] [datetime] NULL
) ON [PRIMARY]
GO
