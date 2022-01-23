CREATE TABLE [dbo].[AmWinsAdjustment]
(
[AmWinsAdjustmentId] [int] NOT NULL IDENTITY(1, 1),
[SubscriberName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriberType] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployeeId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillToEmployerNumber] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FlResident] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PensionDeduction] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AdjustmentReason] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Amount] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[AmWinsAdjustment] ADD CONSTRAINT [PK__AmWinsAd__ACB89DE2F3F1956D] PRIMARY KEY CLUSTERED ([AmWinsAdjustmentId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
