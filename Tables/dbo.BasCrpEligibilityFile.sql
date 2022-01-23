CREATE TABLE [dbo].[BasCrpEligibilityFile]
(
[BasCrpEligibilityFileId] [int] NOT NULL IDENTITY(1, 1),
[LINE ID] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[EMPLOYEE SSN] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP Plan Override] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP Percentage Rate] [decimal] (4, 3) NULL,
[CRP Effective Date] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SendToManualProcessing] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BasCrpEligibilityFile] ADD CONSTRAINT [PK__BasCrpEl__BFED3FF80CDC7369] PRIMARY KEY CLUSTERED ([BasCrpEligibilityFileId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
