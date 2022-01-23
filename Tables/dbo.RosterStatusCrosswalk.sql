CREATE TABLE [dbo].[RosterStatusCrosswalk]
(
[ID] [int] NULL,
[RosterClassName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LawsonClassName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertDate] [datetime] NULL,
[DwInsertProcessName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertUsername] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateDate] [datetime] NULL,
[DwUpdateProcessName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateUsername] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
