CREATE TABLE [dbo].[EbsoContributionDetailReport]
(
[EbsoContributionDetailReportId] [int] NOT NULL IDENTITY(1, 1),
[GrpNumber] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GrpName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnrID] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployeeId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EnrName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ProcessedDate] [date] NULL,
[PayRollDate] [date] NULL,
[PreTax] [decimal] (11, 2) NULL,
[ER] [decimal] (11, 2) NULL,
[Loan] [decimal] (11, 2) NULL,
[Roth] [decimal] (11, 2) NULL,
[Other] [decimal] (11, 2) NULL,
[ER Vested] [decimal] (11, 2) NULL,
[QNEC] [decimal] (11, 2) NULL,
[Source] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[EbsoContributionDetailReport] ADD CONSTRAINT [PK__EbsoCont__5869A655CBC8AB3D] PRIMARY KEY CLUSTERED ([EbsoContributionDetailReportId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
