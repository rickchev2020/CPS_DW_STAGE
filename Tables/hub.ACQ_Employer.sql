CREATE TABLE [hub].[ACQ_Employer]
(
[EmployerId] [int] NULL,
[EmployerNumber] [varchar] (25) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployerName] [varchar] (200) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhoneNumber] [varchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine1] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine2] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressLine3] [varchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Zipcode] [varchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CompletedACR] [bit] NULL,
[ElectedPlans] [bit] NULL,
[SmallLogoUrl] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LargeLogoUrl] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CT_EmployerID] [int] NULL,
[SYS_CHANGE_OPERATION] [nchar] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SYS_CHANGE_CONTEXT] [varbinary] (128) NULL,
[lastversion] [bigint] NULL,
[maxversion] [bigint] NULL,
[ETLupdatetimestamp] [datetime] NULL
) ON [PRIMARY]
GO
