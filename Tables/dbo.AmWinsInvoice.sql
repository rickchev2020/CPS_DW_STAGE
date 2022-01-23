CREATE TABLE [dbo].[AmWinsInvoice]
(
[AmWinsInvoiceId] [int] NOT NULL IDENTITY(1, 1),
[Status] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriberName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SubscriberType] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployeeId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillToEmployerId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FlResidentPlanSelected] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GroupName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PensionDeduction] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MedicalPlanName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RxPlanName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MedicalAndRxPremiums] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DentalPlanName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DentalPremiums] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AncillaryPlanName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AncillaryPremiums] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotalPension] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ContribAmount] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[AmWinsInvoice] ADD CONSTRAINT [PK__AmWinsIn__1008D53AEE2BC102] PRIMARY KEY CLUSTERED ([AmWinsInvoiceId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
