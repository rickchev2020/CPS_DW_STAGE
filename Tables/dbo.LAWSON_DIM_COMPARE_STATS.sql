CREATE TABLE [dbo].[LAWSON_DIM_COMPARE_STATS]
(
[ProcessDate] [date] NULL,
[TableName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Discrepancy] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Count] [int] NULL,
[ProcessStart] [datetime] NULL,
[ProcessEnd] [datetime] NULL,
[Duration] [time] NULL
) ON [PRIMARY]
GO
