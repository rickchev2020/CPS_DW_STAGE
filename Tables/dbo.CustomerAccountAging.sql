CREATE TABLE [dbo].[CustomerAccountAging]
(
[CustomerAccountAgingID] [int] NOT NULL IDENTITY(1, 1),
[Company] [int] NOT NULL,
[CompanyName] [varchar] (30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CurrencyCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AsOfDate] [datetime] NULL,
[TotHeader] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Header12] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RiskCode2] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Customer2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CustomerName2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OpenAmt] [decimal] (16, 2) NULL,
[TotDso] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TermsCode2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CollectDays2] [decimal] (16, 2) NULL,
[SalesRep2] [int] NULL,
[TypeHeader] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DateHeader] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AgePeriod1E] [int] NULL,
[AgePeriod2] [int] NULL,
[AgePeriod2E] [int] NULL,
[AgePeriod3] [int] NULL,
[AgePeriod3E] [int] NULL,
[AgePeriod4] [int] NULL,
[AgePeriod4E] [int] NULL,
[AgePeriod5] [int] NULL,
[TransactionType2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AroInvoice2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ApplFlag2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FutureFl2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date3] [datetime] NULL,
[OpenAmt3] [decimal] (16, 2) NULL,
[pd1OpenAmt2] [decimal] (16, 2) NULL,
[pd2OpenAmt2] [decimal] (16, 2) NULL,
[pd3OpenAmt2] [decimal] (16, 2) NULL,
[pd4OpenAmt2] [decimal] (16, 2) NULL,
[pd5OpenAmt2] [decimal] (16, 2) NULL,
[pd6OpenAmt2] [decimal] (16, 2) NULL,
[pd1OpenAmt4] [decimal] (16, 2) NULL,
[pd3OpenAmt4] [decimal] (16, 2) NULL,
[pd5OpenAmt4] [decimal] (16, 2) NULL,
[pd7OpenAmt4] [decimal] (16, 2) NULL,
[pd2OpenAmt4] [decimal] (16, 2) NULL,
[pd4OpenAmt4] [decimal] (16, 2) NULL,
[pd6OpenAmt4] [decimal] (16, 2) NULL,
[TotHeader2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotDso2] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pd1Percent] [decimal] (16, 2) NULL,
[pd2Percent] [decimal] (16, 2) NULL,
[pd3Percent] [decimal] (16, 2) NULL,
[pd4Percent] [decimal] (16, 2) NULL,
[pd5Percent] [decimal] (16, 2) NULL,
[pd6Percent] [decimal] (16, 2) NULL,
[pd7Percent] [decimal] (16, 2) NULL,
[TransactionType] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AroInvoice] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ApplFlag] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FutureFl] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Date2] [datetime] NULL,
[OpenAmt2] [decimal] (16, 2) NULL,
[pd1OpenAmt] [decimal] (16, 2) NULL,
[pd2OpenAmt] [decimal] (16, 2) NULL,
[pd3OpenAmt] [decimal] (16, 2) NULL,
[pd4OpenAmt] [decimal] (16, 2) NULL,
[pd5OpenAmt] [decimal] (16, 2) NULL,
[pd6OpenAmt] [decimal] (16, 2) NULL,
[AgePeriod1E5] [int] NULL,
[AgePeriod25] [int] NULL,
[AgePeriod2E5] [int] NULL,
[AgePeriod35] [int] NULL,
[AgePeriod3E5] [int] NULL,
[AgePeriod45] [int] NULL,
[AgePeriod4E5] [int] NULL,
[AgePeriod55] [int] NULL,
[pd1OpenAmt10] [decimal] (16, 2) NULL,
[pd3OpenAmt10] [decimal] (16, 2) NULL,
[pd5OpenAmt10] [decimal] (16, 2) NULL,
[pd7OpenAmt7] [decimal] (16, 2) NULL,
[NetAmt5] [decimal] (16, 2) NULL,
[pd2OpenAmt10] [decimal] (16, 2) NULL,
[pd4OpenAmt10] [decimal] (16, 2) NULL,
[pd6OpenAmt10] [decimal] (16, 2) NULL,
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
ALTER TABLE [dbo].[CustomerAccountAging] ADD CONSTRAINT [PK__Customer__DC99E497577DD628] PRIMARY KEY CLUSTERED ([CustomerAccountAgingID]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO