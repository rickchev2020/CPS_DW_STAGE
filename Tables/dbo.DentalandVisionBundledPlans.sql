CREATE TABLE [dbo].[DentalandVisionBundledPlans]
(
[PlanID] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vision] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dental] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertDate] [datetime] NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateDate] [datetime] NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO
