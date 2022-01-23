CREATE TABLE [dbo].[EEDemoComparePREVresults_Demographics]
(
[column_seq] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[employerid] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[employeessn] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[employee] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[lastName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[columnName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CURR] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PREV] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateDate] [datetime] NULL
) ON [PRIMARY]
GO
