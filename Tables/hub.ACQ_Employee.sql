CREATE TABLE [hub].[ACQ_Employee]
(
[EmployeeId] [int] NULL,
[EmployeeNumber] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last4Ssn] [varchar] (4) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine1] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Zipcode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthdate] [date] NULL,
[Email] [varchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneNumberPrimary] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OktaEmail] [varchar] (320) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine2] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine3] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OktaRegisteredDate] [datetime] NULL,
[CT_EmployeeID] [int] NULL,
[SYS_CHANGE_OPERATION] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SYS_CHANGE_CONTEXT] [varbinary] (128) NULL,
[lastversion] [bigint] NULL,
[maxversion] [bigint] NULL,
[ETLupdatetimestamp] [datetime] NULL
) ON [PRIMARY]
GO
