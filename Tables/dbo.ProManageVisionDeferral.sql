CREATE TABLE [dbo].[ProManageVisionDeferral]
(
[ProManageVisionDeferralId] [int] NOT NULL IDENTITY(1, 1),
[FileRowId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ssns_unique] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[grpNumber_unique] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[pret_deferral] [decimal] (3, 2) NULL,
[roth_deferral] [decimal] (3, 2) NULL,
[total_deferral] [decimal] (3, 2) NULL,
[ebso_date] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mandy_file_date] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[upload_date] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[ProManageVisionDeferral] ADD CONSTRAINT [PK__ProManag__07AD97F8C0CB140F] PRIMARY KEY CLUSTERED ([ProManageVisionDeferralId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
