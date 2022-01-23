CREATE TABLE [dbo].[BasIncomingEmployeeDemographicEndOfMonth_v01_del]
(
[EmployerId] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployeeSsn] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployeeId] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleNameOrInitial] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthdate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address1] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address2] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Address3] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[City] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[State] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Postal] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[County] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressEffectiveDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PrimaryPhoneNumber] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WorkPhone] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MobilePhoneNumber] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[WorkEmailAddress] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HomeEmailAddress] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OriginalHireDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LatestHireDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmploymentStatus] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmploymentStatusEffectiveDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DeathDateAttribute] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TerminationDateAttribute] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BenefitsEligibilityDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmployerDepartmentReporting] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ScheduledHours] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ScheduledHoursEffectiveDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BaseAnnualSalaryAcrFactor] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AnnualCashHousingAllowanceAcrFactor] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HomeProvidedAmountAcrFactor] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AnnualCashUtilityAllowanceAcrFactor] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TotalAcrSumOfThreeAbove] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AcrEffectiveDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JobTitleOrClass] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JobTitleOrClassDescription] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalariedOrHourlyIndicator] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SalariedOrHourlyIndicatorEffectiveDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RosterNonRosterIndicator] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RosteredOrCommissionedSocialSecurityIndicator] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RosterNonRosterIndicatorEffectiveDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaritalStatus] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MaritalStatusEffectiveDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LawsonEmployeeId] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MissionaryTypeIndicator] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MissionCountryCode] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MissionaryTypeEffectiveDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BilltoEmployerTaip] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChpCostAndBillingOverride] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CdspCostAndBillingOverride] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VoluntaryBenefitsCostAndBillingOverride] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChpCostAndBillngOverrideEndDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CdspCostAndBillngOverrideEndDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ChpCostAndBillingOverrideEmployerNumber] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CdspCostAndBillingOverrideEmployerNumber] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VoluntaryBenefitsCostandBillingOverrideEmployerNumber] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[VoluntaryBenefitsCostandBillngOverrideEndDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CrpTraditionalRegularFullBasisIndicator] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CrpTraditionalRegularFullBasisEffectiveDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Extensiontype] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtensionPaidThruDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtensionStartDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ExtensionEndDate] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CpsPreviousEmployerNumber] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertDate] [datetime] NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateDate] [datetime] NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Month] [varchar] (9) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO