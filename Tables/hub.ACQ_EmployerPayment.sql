CREATE TABLE [hub].[ACQ_EmployerPayment]
(
[EmployerPaymentId] [int] NULL,
[EmployerId] [int] NULL,
[LastPaidAmount] [decimal] (19, 4) NULL,
[LastPaidDate] [date] NULL,
[OutstandingPayment] [decimal] (19, 4) NULL,
[CT_EmployerPaymentID] [int] NULL,
[SYS_CHANGE_OPERATION] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SYS_CHANGE_CONTEXT] [varbinary] (128) NULL,
[lastversion] [bigint] NULL,
[maxversion] [bigint] NULL,
[ETLupdatetimestamp] [datetime] NULL
) ON [PRIMARY]
GO
