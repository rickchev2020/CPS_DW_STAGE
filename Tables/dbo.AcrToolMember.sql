CREATE TABLE [dbo].[AcrToolMember]
(
[AcrToolMemberId] [int] NOT NULL IDENTITY(1, 1),
[EmployerNumber] [varchar] (5) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MemberNumber] [int] NULL,
[LastName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmploymentStatus] [char] (1) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AcrYear] [int] NULL,
[ScheduledHours] [decimal] (11, 2) NULL,
[BaseAnnualSalary] [decimal] (11, 2) NULL,
[AnnualCashHousingAllowance] [decimal] (11, 2) NULL,
[HomeProvidedAmount] [decimal] (11, 2) NULL,
[AnnualCashUtilityAllowance] [decimal] (11, 2) NULL,
[TotalSalary] [decimal] (11, 2) NULL,
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
ALTER TABLE [dbo].[AcrToolMember] ADD CONSTRAINT [PK__AcrToolM__33E409DE40A98FDF] PRIMARY KEY CLUSTERED ([AcrToolMemberId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO
