CREATE TABLE [dbo].[PricingCostAreas]
(
[ZipCode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Year] [int] NOT NULL,
[Provider] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Value] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PricingCostAreas] ADD CONSTRAINT [PK_CostAreas] PRIMARY KEY CLUSTERED ([ZipCode], [Year], [Provider]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
