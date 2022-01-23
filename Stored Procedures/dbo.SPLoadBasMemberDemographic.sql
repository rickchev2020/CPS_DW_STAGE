SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[SPLoadBasMemberDemographic] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'SPLoadBasMemberDemographic'
	declare @SourceModifiedDate date 
	set @SourceModifiedDate = (select coalesce(max([SourceModifiedDate]),'1900-10-01') from cps_dw_stage.[dbo].[BasIncomingEmployeeDemographic])


INSERT INTO CPS_DW.[dbo].[BasMemberDemographic]
      ([EmployerId]
      ,[EmployeeSsn]
      ,[ExternalMemberId]
      ,[LastName]
      ,[FirstName]
      ,[MiddleNameOrInitial]
      ,[Suffix]
      ,[Birthdate]
      ,[Gender]
      ,[Address1]
      ,[Address2]
      ,[Address3]
      ,[City]
      ,[State]
      ,[Postal]
      ,[County]
      ,[AddressEffectiveDate]
      ,[PrimaryPhoneNumber]
      ,[WorkPhone]
      ,[MobilePhoneNumber]
      ,[WorkEmailAddress]
      ,[HomeEmailAddress]
      ,[OriginalHireDate]
      ,[LatestHireDate]
      ,[EmploymentStatus]
      ,[EmploymentStatusEffectiveDate]
      ,[DeathDateAttribute]
      ,[TerminationDateAttribute]
      ,[BenefitsEligibilityDate]
      ,[EmployerDepartmentReporting]
      ,[ScheduledHours]
      ,[ScheduledHoursEffectiveDate]
      ,[BaseAnnualSalaryAcrFactor]
      ,[AnnualCashHousingAllowanceAcrFactor]
      ,[HomeProvidedAmountAcrFactor]
      ,[AnnualCashUtilityAllowanceAcrFactor]
      ,[TotalAcrSumOfThreeAbove]
      ,[AcrEffectiveDate]
      ,[JobTitleOrClass]
      ,[JobTitleOrClassDescription]
      ,[SalariedOrHourlyIndicator]
      ,[SalariedOrHourlyIndicatorEffectiveDate]
      ,[RosterNonRosterIndicator]
      ,[RosteredOrCommissionedSocialSecurityIndicator]
      ,[RosterNonRosterIndicatorEffectiveDate]
      ,[Salutation]
      ,[MaritalStatus]
      ,[MaritalStatusEffectiveDate]
      ,[LawsonEmployeeId]
      ,[MissionaryTypeIndicator]
      ,[MissionCountryCode]
      ,[MissionaryTypeEffectiveDate]
      ,[BilltoEmployerTaip]
      ,[ChpCostAndBillingOverride]
      ,[CdspCostAndBillingOverride]
      ,[VoluntaryBenefitsCostAndBillingOverride]
      ,[ChpCostAndBillngOverrideEndDate]
      ,[CdspCostAndBillngOverrideEndDate]
      ,[ChpCostAndBillingOverrideEmployerNumber]
      ,[CdspCostAndBillingOverrideEmployerNumber]
      ,[VoluntaryBenefitsCostandBillingOverrideEmployerNumber]
      ,[VoluntaryBenefitsCostandBillngOverrideEndDate]
      ,[CrpTraditionalRegularFullBasisIndicator]
      ,[CrpTraditionalRegularFullBasisEffectiveDate]
      ,[Extensiontype]
      ,[ExtensionPaidThruDate]
      ,[ExtensionStartDate]
      ,[ExtensionEndDate]
      ,[CpsPreviousEmployerNumber]
      ,[MaidenName]
      ,[NewhireEmailAddress]
      ,[TerminationRuleIndicator]
      ,[ConcordiaSalutation]
      ,[JobClassEffectiveDate]
      ,[JobTitleEffectiveDate]
      ,[TaipEligIndicator]
      ,[TaipEligIndicatorEffectiveDate]
      ,[TaipDualCoverage]
      ,[TaipDualCoverageEffectiveDate]
      ,[PayFrequency]
      ,[CrpPlanEligOverride]
      ,[CrpPlanEligOverrideEffectiveDate]
      ,[CrpPercentageRate]
      ,[CrpPercentageRateEffectiveDate]
      ,[EmploymentDesignation]
      ,[EmploymentDesignationEffectiveDate]
      ,[ChpLastErOverride]
      ,[ChpYearsofService]
      ,[ChpYearsofServiceEffectiveDate]
      ,[TobaccoAttribute]
      ,[TobaccoAttributeEffectiveDate]
      ,[SpouseTobacco]
      ,[SpouseTobaccoEffectiveDate]
      ,[PremiumPlusEmployeeInd]
      ,[PremiumPlusEmployeeIndEffectiveDate]
      ,[PremiumPlusSpouseInd]
      ,[PremiumPlusSpouseIndEffectiveDate]
      ,[MedicareEligibleIndicator]
      ,[MedicareEligibleIndicatorEffectiveDate]
      ,[DisabilityStatus]
      ,[DisabilityStatusEffectiveDate]
      ,[CpsDisabilityNoCHP]
      ,[CpsDisabilityNoCHPEffectiveDate]
      ,[CpsEmployerWaiveDate]
      ,[CpsLastDayWorkPriortoDis]
      ,[CpsDisabWaiverBillToCDSP]
      ,[CpsDisabWaiverBillToCDSPEffectiveDate]
      ,[ChpPlanAvailabilityOverride]
      ,[ChpPlanAvailabilityOverrideEffectiveDate]
      ,[3TierOverride]
      ,[3TierOverrideEffectiveDate]
      ,[ChpGrandfatheredIndicator]
      ,[ChpGrandfatheredIndicatorEffectiveDate]
      ,[CdspOverride]
      ,[CdspOverrideEffectiveDate]
      ,[AcaEligibilityOverride]
      ,[AcaEligibilityOverrideEffectiveDate]
      ,[MnSupplifePrevDeniedFlag]
      ,[MnSupplifePrevDeniedFlagEffectiveDate]
      ,[MnSpSupplifePrevDeniedFlag]
      ,[MnSpSupplifePrevDeniedFlagEffectiveDate]
      ,[SecurianDirectBillIndicator]
      ,[SecurianDirectBillIndicatorEffectiveDate]
      ,[ETLRowStartDate]
      ,[ETLRowEndDate]
      ,[ETLRowIsCurrent]
      ,[DwInsertDate]
      ,[DwInsertUsername]
      ,[DwInsertProcessName]
      ,[DwUpdateDate]
      ,[DwUpdateUsername]
      ,[DwUpdateProcessName])
 select
       [EmployerId]
      ,[EmployeeSsn]
      ,[ExternalMemberId]
      ,[LastName]
      ,[FirstName]
      ,[MiddleNameOrInitial]
      ,[Suffix]
      ,[Birthdate]
      ,[Gender]
      ,[Address1]
      ,[Address2]
      ,[Address3]
      ,[City]
      ,[State]
      ,[Postal]
      ,[County]
      ,[AddressEffectiveDate]
      ,[PrimaryPhoneNumber]
      ,[WorkPhone]
      ,[MobilePhoneNumber]
      ,[WorkEmailAddress]
      ,[HomeEmailAddress]
      ,[OriginalHireDate]
      ,[LatestHireDate]
      ,[EmploymentStatus]
      ,[EmploymentStatusEffectiveDate]
      ,[DeathDateAttribute]
      ,[TerminationDateAttribute]
      ,[BenefitsEligibilityDate]
      ,[EmployerDepartmentReporting]
      ,[ScheduledHours]
      ,[ScheduledHoursEffectiveDate]
      ,[BaseAnnualSalaryAcrFactor]
      ,[AnnualCashHousingAllowanceAcrFactor]
      ,[HomeProvidedAmountAcrFactor]
      ,[AnnualCashUtilityAllowanceAcrFactor]
      ,[TotalAcrSumOfThreeAbove]
      ,[AcrEffectiveDate]
      ,[JobTitleOrClass]
      ,[JobTitleOrClassDescription]
      ,[SalariedOrHourlyIndicator]
      ,[SalariedOrHourlyIndicatorEffectiveDate]
      ,[RosterNonRosterIndicator]
      ,[RosteredOrCommissionedSocialSecurityIndicator]
      ,[RosterNonRosterIndicatorEffectiveDate]
      ,[Salutation]
      ,[MaritalStatus]
      ,[MaritalStatusEffectiveDate]
      ,[LawsonEmployeeId]
      ,[MissionaryTypeIndicator]
      ,[MissionCountryCode]
      ,[MissionaryTypeEffectiveDate]
      ,[BilltoEmployerTaip]
      ,[ChpCostAndBillingOverride]
      ,[CdspCostAndBillingOverride]
      ,[VoluntaryBenefitsCostAndBillingOverride]
      ,[ChpCostAndBillngOverrideEndDate]
      ,[CdspCostAndBillngOverrideEndDate]
      ,[ChpCostAndBillingOverrideEmployerNumber]
      ,[CdspCostAndBillingOverrideEmployerNumber]
      ,[VoluntaryBenefitsCostandBillingOverrideEmployerNumber]
      ,[VoluntaryBenefitsCostandBillngOverrideEndDate]
      ,[CrpTraditionalRegularFullBasisIndicator]
      ,[CrpTraditionalRegularFullBasisEffectiveDate]
      ,[Extensiontype]
      ,[ExtensionPaidThruDate]
      ,[ExtensionStartDate]
      ,[ExtensionEndDate]
      ,[CpsPreviousEmployerNumber]
      ,[MaidenName]
      ,[NewhireEmailAddress]
      ,[TerminationRuleIndicator]
      ,[ConcordiaSalutation]
      ,[JobClassEffectiveDate]
      ,[JobTitleEffectiveDate]
      ,[TaipEligIndicator]
      ,[TaipEligIndicatorEffectiveDate]
      ,[TaipDualCoverage]
      ,[TaipDualCoverageEffectiveDate]
      ,[PayFrequency]
      ,[CrpPlanEligOverride]
      ,[CrpPlanEligOverrideEffectiveDate]
      ,[CrpPercentageRate]
      ,[CrpPercentageRateEffectiveDate]
      ,[EmploymentDesignation]
      ,[EmploymentDesignationEffectiveDate]
      ,[ChpLastErOverride]
      ,[ChpYearsofService]
      ,[ChpYearsofServiceEffectiveDate]
      ,[TobaccoAttribute]
      ,[TobaccoAttributeEffectiveDate]
      ,[SpouseTobacco]
      ,[SpouseTobaccoEffectiveDate]
      ,[PremiumPlusEmployeeInd]
      ,[PremiumPlusEmployeeIndEffectiveDate]
      ,[PremiumPlusSpouseInd]
      ,[PremiumPlusSpouseIndEffectiveDate]
      ,[MedicareEligibleIndicator]
      ,[MedicareEligibleIndicatorEffectiveDate]
      ,[DisabilityStatus]
      ,[DisabilityStatusEffectiveDate]
      ,[CpsDisabilityNoCHP]
      ,[CpsDisabilityNoCHPEffectiveDate]
      ,[CpsEmployerWaiveDate]
      ,[CpsLastDayWorkPriortoDis]
      ,[CpsDisabWaiverBillToCDSP]
      ,[CpsDisabWaiverBillToCDSPEffectiveDate]
      ,[ChpPlanAvailabilityOverride]
      ,[ChpPlanAvailabilityOverrideEffectiveDate]
      ,[3TierOverride]
      ,[3TierOverrideEffectiveDate]
      ,[ChpGrandfatheredIndicator]
      ,[ChpGrandfatheredIndicatorEffectiveDate]
      ,[CdspOverride]
      ,[CdspOverrideEffectiveDate]
      ,[AcaEligibilityOverride]
      ,[AcaEligibilityOverrideEffectiveDate]
      ,[MnSupplifePrevDeniedFlag]
      ,[MnSupplifePrevDeniedFlagEffectiveDate]
      ,[MnSpSupplifePrevDeniedFlag]
      ,[MnSpSupplifePrevDeniedFlagEffectiveDate]
      ,[SecurianDirectBillIndicator]
      ,[SecurianDirectBillIndicatorEffectiveDate]
      ,[ETLRowStartDate]
      ,[ETLRowEndDate]
      ,[ETLRowIsCurrent]
      ,[DwInsertDate]
      ,[DwInsertUsername]
      ,[DwInsertProcessName]
      ,[DwUpdateDate]
      ,[DwUpdateUsername]
      ,[DwUpdateProcessName]
from (
	merge into CPS_DW.dbo.[BasMemberDemographic] as TGT
	using (
		SELECT
			   [BasIncomingEmployeeDemographicId]
			  ,[EmployerId]
			  ,[EmployeeSsn]
			  ,[EmployeeId] as [ExternalMemberId]
			  ,[LastName]
			  ,[FirstName]
			  ,[MiddleNameOrInitial]
			  ,[Suffix]
			  ,try_convert(date,substring([Birthdate],5,4) + substring([Birthdate],1,2) + substring([Birthdate],3,2)) as [Birthdate]
			  ,[Gender]
			  ,[Address1]
			  ,[Address2]
			  ,[Address3]
			  ,[City]
			  ,[State]
			  ,[Postal]
			  ,[County]
			  ,try_convert(date,substring([AddressEffectiveDate],5,4) + substring([AddressEffectiveDate],1,2) + substring([AddressEffectiveDate],3,2)) as [AddressEffectiveDate]
			  ,[PrimaryPhoneNumber]
			  ,[WorkPhone]
			  ,[MobilePhoneNumber]
			  ,[WorkEmailAddress]
			  ,[HomeEmailAddress]
			  ,try_convert(date,substring([OriginalHireDate],5,4) + substring([OriginalHireDate],1,2) + substring([OriginalHireDate],3,2)) as [OriginalHireDate]
			  ,try_convert(date,substring([LatestHireDate],5,4) + substring([LatestHireDate],1,2) + substring([LatestHireDate],3,2)) as [LatestHireDate]
			  ,[EmploymentStatus]
			  ,try_convert(date,substring([EmploymentStatusEffectiveDate],5,4) + substring([EmploymentStatusEffectiveDate],1,2) + substring([EmploymentStatusEffectiveDate],3,2)) as [EmploymentStatusEffectiveDate]
			  ,try_convert(date,substring([DeathDateAttribute],5,4) + substring([DeathDateAttribute],1,2) + substring([DeathDateAttribute],3,2)) as [DeathDateAttribute]
			  ,try_convert(date,substring([TerminationDateAttribute],5,4) + substring([TerminationDateAttribute],1,2) + substring([TerminationDateAttribute],3,2)) as [TerminationDateAttribute]
			  ,try_convert(date,substring([BenefitsEligibilityDate],5,4) + substring([BenefitsEligibilityDate],1,2) + substring([BenefitsEligibilityDate],3,2)) as [BenefitsEligibilityDate]
			  ,[EmployerDepartmentReporting]
			  ,cast([ScheduledHours] as decimal(7,2)) as [ScheduledHours]
			  ,try_convert(date,substring([ScheduledHoursEffectiveDate],5,4) + substring([ScheduledHoursEffectiveDate],1,2) + substring([ScheduledHoursEffectiveDate],3,2)) as [ScheduledHoursEffectiveDate]
			  ,cast([BaseAnnualSalaryAcrFactor] as decimal(30,2)) as [BaseAnnualSalaryAcrFactor]
			  ,cast([AnnualCashHousingAllowanceAcrFactor] as decimal(30,2)) as [AnnualCashHousingAllowanceAcrFactor]
			  ,cast([HomeProvidedAmountAcrFactor] as decimal(30,2)) as [HomeProvidedAmountAcrFactor]
			  ,cast([AnnualCashUtilityAllowanceAcrFactor] as decimal(30,2)) as [AnnualCashUtilityAllowanceAcrFactor]
			  ,cast([TotalAcrSumOfThreeAbove] as decimal(30,2)) as [TotalAcrSumOfThreeAbove]
			  ,try_convert(date,substring([AcrEffectiveDate],5,4) + substring([AcrEffectiveDate],1,2) + substring([AcrEffectiveDate],3,2)) as [AcrEffectiveDate]
			  ,[JobTitleOrClass]
			  ,[JobTitleOrClassDescription]
			  ,[SalariedOrHourlyIndicator]
			  ,try_convert(date,substring([SalariedOrHourlyIndicatorEffectiveDate],5,4) + substring([SalariedOrHourlyIndicatorEffectiveDate],1,2) + substring([SalariedOrHourlyIndicatorEffectiveDate],3,2)) as [SalariedOrHourlyIndicatorEffectiveDate]
			  ,[RosterNonRosterIndicator]
			  ,[RosteredOrCommissionedSocialSecurityIndicator]
			  ,try_convert(date,substring([RosterNonRosterIndicatorEffectiveDate],5,4) + substring([RosterNonRosterIndicatorEffectiveDate],1,2) + substring([RosterNonRosterIndicatorEffectiveDate],3,2)) as [RosterNonRosterIndicatorEffectiveDate]
			  ,[Salutation]
			  ,[MaritalStatus]
			  ,try_convert(date,substring([MaritalStatusEffectiveDate],5,4) + substring([MaritalStatusEffectiveDate],1,2) + substring([MaritalStatusEffectiveDate],3,2)) as [MaritalStatusEffectiveDate]
			  ,cast([LawsonEmployeeId] as integer) as [LawsonEmployeeId]
			  ,[MissionaryTypeIndicator]
			  ,[MissionCountryCode]
			  ,try_convert(date,substring([MissionaryTypeEffectiveDate],5,4) + substring([MissionaryTypeEffectiveDate],1,2) + substring([MissionaryTypeEffectiveDate],3,2)) as [MissionaryTypeEffectiveDate]
			  ,[BilltoEmployerTaip]
			  ,[ChpCostAndBillingOverride]
			  ,[CdspCostAndBillingOverride]
			  ,[VoluntaryBenefitsCostAndBillingOverride]
			  ,try_convert(date,substring([ChpCostAndBillngOverrideEndDate],5,4) + substring([ChpCostAndBillngOverrideEndDate],1,2) + substring([ChpCostAndBillngOverrideEndDate],3,2)) as [ChpCostAndBillngOverrideEndDate]
			  ,try_convert(date,substring([CdspCostAndBillngOverrideEndDate],5,4) + substring([CdspCostAndBillngOverrideEndDate],1,2) + substring([CdspCostAndBillngOverrideEndDate],3,2)) as [CdspCostAndBillngOverrideEndDate]
			  ,[ChpCostAndBillingOverrideEmployerNumber]
			  ,[CdspCostAndBillingOverrideEmployerNumber]
			  ,[VoluntaryBenefitsCostandBillingOverrideEmployerNumber]
			  ,try_convert(date,substring([VoluntaryBenefitsCostandBillngOverrideEndDate],5,4) + substring([VoluntaryBenefitsCostandBillngOverrideEndDate],1,2) + substring([VoluntaryBenefitsCostandBillngOverrideEndDate],3,2)) as [VoluntaryBenefitsCostandBillngOverrideEndDate]
			  ,[CrpTraditionalRegularFullBasisIndicator]
			  ,try_convert(date,substring([CrpTraditionalRegularFullBasisEffectiveDate],5,4) + substring([CrpTraditionalRegularFullBasisEffectiveDate],1,2) + substring([CrpTraditionalRegularFullBasisEffectiveDate],3,2)) as [CrpTraditionalRegularFullBasisEffectiveDate]
			  ,[Extensiontype]
			  ,try_convert(date,substring([ExtensionPaidThruDate],5,4) + substring([ExtensionPaidThruDate],1,2) + substring([ExtensionPaidThruDate],3,2)) as [ExtensionPaidThruDate]
			  ,try_convert(date,substring([ExtensionStartDate],5,4) + substring([ExtensionStartDate],1,2) + substring([ExtensionStartDate],3,2)) as [ExtensionStartDate]
			  ,try_convert(date,substring([ExtensionEndDate],5,4) + substring([ExtensionEndDate],1,2) + substring([ExtensionEndDate],3,2)) as [ExtensionEndDate]
			  ,[CpsPreviousEmployerNumber]
			  ,[MaidenName]
			  ,[NewhireEmailAddress]
			  ,[TerminationRuleIndicator]
			  ,[ConcordiaSalutation]
			  ,try_convert(date,substring([JobClassEffectiveDate],5,4) + substring([JobClassEffectiveDate],1,2) + substring([JobClassEffectiveDate],3,2)) as [JobClassEffectiveDate]
			  ,try_convert(date,substring([JobTitleEffectiveDate],5,4) + substring([JobTitleEffectiveDate],1,2) + substring([JobTitleEffectiveDate],3,2)) as [JobTitleEffectiveDate]
			  ,[TaipEligIndicator]
			  ,try_convert(date,substring([TaipEligIndicatorEffectiveDate],5,4) + substring([TaipEligIndicatorEffectiveDate],1,2) + substring([TaipEligIndicatorEffectiveDate],3,2)) as [TaipEligIndicatorEffectiveDate]
			  ,[TaipDualCoverage]
			  ,try_convert(date,substring([TaipDualCoverageEffectiveDate],5,4) + substring([TaipDualCoverageEffectiveDate],1,2) + substring([TaipDualCoverageEffectiveDate],3,2)) as [TaipDualCoverageEffectiveDate]
			  ,[PayFrequency]
			  ,[CrpPlanEligOverride]
			  ,try_convert(date,substring([CrpPlanEligOverrideEffectiveDate],5,4) + substring([CrpPlanEligOverrideEffectiveDate],1,2) + substring([CrpPlanEligOverrideEffectiveDate],3,2)) as [CrpPlanEligOverrideEffectiveDate]
			  ,[CrpPercentageRate]
			  ,try_convert(date,substring([CrpPercentageRateEffectiveDate],5,4) + substring([CrpPercentageRateEffectiveDate],1,2) + substring([CrpPercentageRateEffectiveDate],3,2)) as [CrpPercentageRateEffectiveDate]
			  ,[EmploymentDesignation]
			  ,try_convert(date,substring([EmploymentDesignationEffectiveDate],5,4) + substring([EmploymentDesignationEffectiveDate],1,2) + substring([EmploymentDesignationEffectiveDate],3,2)) as [EmploymentDesignationEffectiveDate]
			  ,[ChpLastErOverride]
			  ,[ChpYearsofService]
			  ,try_convert(date,substring([ChpYearsofServiceEffectiveDate],5,4) + substring([ChpYearsofServiceEffectiveDate],1,2) + substring([ChpYearsofServiceEffectiveDate],3,2)) as [ChpYearsofServiceEffectiveDate]
			  ,[TobaccoAttribute]
			  ,try_convert(date,substring([TobaccoAttributeEffectiveDate],5,4) + substring([TobaccoAttributeEffectiveDate],1,2) + substring([TobaccoAttributeEffectiveDate],3,2)) as [TobaccoAttributeEffectiveDate]
			  ,[SpouseTobacco]
			  ,try_convert(date,substring([SpouseTobaccoEffectiveDate],5,4) + substring([SpouseTobaccoEffectiveDate],1,2) + substring([SpouseTobaccoEffectiveDate],3,2)) as [SpouseTobaccoEffectiveDate]
			  ,[PremiumPlusEmployeeInd]
			  ,try_convert(date,substring([PremiumPlusEmployeeIndEffectiveDate],5,4) + substring([PremiumPlusEmployeeIndEffectiveDate],1,2) + substring([PremiumPlusEmployeeIndEffectiveDate],3,2)) as [PremiumPlusEmployeeIndEffectiveDate]
			  ,[PremiumPlusSpouseInd]
			  ,try_convert(date,substring([PremiumPlusSpouseIndEffectiveDate],5,4) + substring([PremiumPlusSpouseIndEffectiveDate],1,2) + substring([PremiumPlusSpouseIndEffectiveDate],3,2)) as [PremiumPlusSpouseIndEffectiveDate]
			  ,[MedicareEligibleIndicator]
			  ,try_convert(date,substring([MedicareEligibleIndicatorEffectiveDate],5,4) + substring([MedicareEligibleIndicatorEffectiveDate],1,2) + substring([MedicareEligibleIndicatorEffectiveDate],3,2)) as [MedicareEligibleIndicatorEffectiveDate]
			  ,[DisabilityStatus]
			  ,try_convert(date,substring([DisabilityStatusEffectiveDate],5,4) + substring([DisabilityStatusEffectiveDate],1,2) + substring([DisabilityStatusEffectiveDate],3,2)) as [DisabilityStatusEffectiveDate]
			  ,[CpsDisabilityNoCHP]
			  ,try_convert(date,substring([CpsDisabilityNoCHPEffectiveDate],5,4) + substring([CpsDisabilityNoCHPEffectiveDate],1,2) + substring([CpsDisabilityNoCHPEffectiveDate],3,2)) as [CpsDisabilityNoCHPEffectiveDate]
			  ,try_convert(date,substring([CpsEmployerWaiveDate],5,4) + substring([CpsEmployerWaiveDate],1,2) + substring([CpsEmployerWaiveDate],3,2)) as [CpsEmployerWaiveDate]
			  ,try_convert(date,substring([CpsLastDayWorkPriortoDis],5,4) + substring([CpsLastDayWorkPriortoDis],1,2) + substring([CpsLastDayWorkPriortoDis],3,2)) as [CpsLastDayWorkPriortoDis]
			  ,[CpsDisabWaiverBillToCDSP]
			  ,try_convert(date,substring([CpsDisabWaiverBillToCDSPEffectiveDate],5,4) + substring([CpsDisabWaiverBillToCDSPEffectiveDate],1,2) + substring([CpsDisabWaiverBillToCDSPEffectiveDate],3,2)) as [CpsDisabWaiverBillToCDSPEffectiveDate]
			  ,[ChpPlanAvailabilityOverride]
			  ,try_convert(date,substring([ChpPlanAvailabilityOverrideEffectiveDate],5,4) + substring([ChpPlanAvailabilityOverrideEffectiveDate],1,2) + substring([ChpPlanAvailabilityOverrideEffectiveDate],3,2)) as [ChpPlanAvailabilityOverrideEffectiveDate]
			  ,[3TierOverride]
			  ,try_convert(date,substring([3TierOverrideEffectiveDate],5,4) + substring([3TierOverrideEffectiveDate],1,2) + substring([3TierOverrideEffectiveDate],3,2)) as [3TierOverrideEffectiveDate]
			  ,[ChpGrandfatheredIndicator]
			  ,try_convert(date,substring([ChpGrandfatheredIndicatorEffectiveDate],5,4) + substring([ChpGrandfatheredIndicatorEffectiveDate],1,2) + substring([ChpGrandfatheredIndicatorEffectiveDate],3,2)) as [ChpGrandfatheredIndicatorEffectiveDate]
			  ,[CdspOverride]
			  ,try_convert(date,substring([CdspOverrideEffectiveDate],5,4) + substring([CdspOverrideEffectiveDate],1,2) + substring([CdspOverrideEffectiveDate],3,2)) as [CdspOverrideEffectiveDate]
			  ,[AcaEligibilityOverride]
			  ,try_convert(date,substring([AcaEligibilityOverrideEffectiveDate],5,4) + substring([AcaEligibilityOverrideEffectiveDate],1,2) + substring([AcaEligibilityOverrideEffectiveDate],3,2)) as [AcaEligibilityOverrideEffectiveDate]
			  ,[MnSupplifePrevDeniedFlag]
			  ,try_convert(date,substring([MnSupplifePrevDeniedFlagEffectiveDate],5,4) + substring([MnSupplifePrevDeniedFlagEffectiveDate],1,2) + substring([MnSupplifePrevDeniedFlagEffectiveDate],3,2)) as [MnSupplifePrevDeniedFlagEffectiveDate]
			  ,[MnSpSupplifePrevDeniedFlag]
			  ,try_convert(date,substring([MnSpSupplifePrevDeniedFlagEffectiveDate],5,4) + substring([MnSpSupplifePrevDeniedFlagEffectiveDate],1,2) + substring([MnSpSupplifePrevDeniedFlagEffectiveDate],3,2)) as [MnSpSupplifePrevDeniedFlagEffectiveDate]
			  ,[SecurianDirectBillIndicator]
			  ,try_convert(date,substring([SecurianDirectBillIndicatorEffectiveDate],5,4) + substring([SecurianDirectBillIndicatorEffectiveDate],1,2) + substring([SecurianDirectBillIndicatorEffectiveDate],3,2)) as [SecurianDirectBillIndicatorEffectiveDate]
			  ,[SourceModifiedDate]
			  ,[DwSourceName]
			  ,[DwInsertDate]
			  ,[DwInsertUsername]
			  ,[DwInsertProcessName]
			  ,[DwUpdateDate]
			  ,[DwUpdateUsername]
			  ,[DwUpdateProcessName]
		  FROM CPS_DW_STAGE.[dbo].[BasIncomingEmployeeDemographic]
		  where SourceModifiedDate = @SourceModifiedDate
	) as SRC
	ON (TGT.[EmployeeSsn] = SRC.[EmployeeSsn]) and '1' = TGT.[ETLRowIsCurrent] 
	
	---- Mark deleted rows as not current
	when not matched by source and TGT.[ETLRowIsCurrent] = 1 
	then update
		set TGT.[ETLRowIsCurrent] = 0
		, TGT.[ETLRowEndDate] = @YesterdayDate
		, TGT.[DwUpdateDate] = @RunTime
		, TGT.[DwUpdateUsername] = suser_name()
		, TGT.[DwUpdateProcessName] = @ProcessName
	
	-- Insert new rows
	when not matched 
	then insert values(
       SRC.[EmployerId]
      ,SRC.[EmployeeSsn]
      ,SRC.[ExternalMemberId]
      ,SRC.[LastName]
      ,SRC.[FirstName]
      ,SRC.[MiddleNameOrInitial]
      ,SRC.[Suffix]
      ,SRC.[Birthdate]
      ,SRC.[Gender]
      ,SRC.[Address1]
      ,SRC.[Address2]
      ,SRC.[Address3]
      ,SRC.[City]
      ,SRC.[State]
      ,SRC.[Postal]
      ,SRC.[County]
      ,SRC.[AddressEffectiveDate]
      ,SRC.[PrimaryPhoneNumber]
      ,SRC.[WorkPhone]
      ,SRC.[MobilePhoneNumber]
      ,SRC.[WorkEmailAddress]
      ,SRC.[HomeEmailAddress]
      ,SRC.[OriginalHireDate]
      ,SRC.[LatestHireDate]
      ,SRC.[EmploymentStatus]
      ,SRC.[EmploymentStatusEffectiveDate]
      ,SRC.[DeathDateAttribute]
      ,SRC.[TerminationDateAttribute]
      ,SRC.[BenefitsEligibilityDate]
      ,SRC.[EmployerDepartmentReporting]
      ,SRC.[ScheduledHours]
      ,SRC.[ScheduledHoursEffectiveDate]
      ,SRC.[BaseAnnualSalaryAcrFactor]
      ,SRC.[AnnualCashHousingAllowanceAcrFactor]
      ,SRC.[HomeProvidedAmountAcrFactor]
      ,SRC.[AnnualCashUtilityAllowanceAcrFactor]
      ,SRC.[TotalAcrSumOfThreeAbove]
      ,SRC.[AcrEffectiveDate]
      ,SRC.[JobTitleOrClass]
      ,SRC.[JobTitleOrClassDescription]
      ,SRC.[SalariedOrHourlyIndicator]
      ,SRC.[SalariedOrHourlyIndicatorEffectiveDate]
      ,SRC.[RosterNonRosterIndicator]
      ,SRC.[RosteredOrCommissionedSocialSecurityIndicator]
      ,SRC.[RosterNonRosterIndicatorEffectiveDate]
      ,SRC.[Salutation]
      ,SRC.[MaritalStatus]
      ,SRC.[MaritalStatusEffectiveDate]
      ,SRC.[LawsonEmployeeId]
      ,SRC.[MissionaryTypeIndicator]
      ,SRC.[MissionCountryCode]
      ,SRC.[MissionaryTypeEffectiveDate]
      ,SRC.[BilltoEmployerTaip]
      ,SRC.[ChpCostAndBillingOverride]
      ,SRC.[CdspCostAndBillingOverride]
      ,SRC.[VoluntaryBenefitsCostAndBillingOverride]
      ,SRC.[ChpCostAndBillngOverrideEndDate]
      ,SRC.[CdspCostAndBillngOverrideEndDate]
      ,SRC.[ChpCostAndBillingOverrideEmployerNumber]
      ,SRC.[CdspCostAndBillingOverrideEmployerNumber]
      ,SRC.[VoluntaryBenefitsCostandBillingOverrideEmployerNumber]
      ,SRC.[VoluntaryBenefitsCostandBillngOverrideEndDate]
      ,SRC.[CrpTraditionalRegularFullBasisIndicator]
      ,SRC.[CrpTraditionalRegularFullBasisEffectiveDate]
      ,SRC.[Extensiontype]
      ,SRC.[ExtensionPaidThruDate]
      ,SRC.[ExtensionStartDate]
      ,SRC.[ExtensionEndDate]
      ,SRC.[CpsPreviousEmployerNumber]
      ,SRC.[MaidenName]
      ,SRC.[NewhireEmailAddress]
      ,SRC.[TerminationRuleIndicator]
      ,SRC.[ConcordiaSalutation]
      ,SRC.[JobClassEffectiveDate]
      ,SRC.[JobTitleEffectiveDate]
      ,SRC.[TaipEligIndicator]
      ,SRC.[TaipEligIndicatorEffectiveDate]
      ,SRC.[TaipDualCoverage]
      ,SRC.[TaipDualCoverageEffectiveDate]
      ,SRC.[PayFrequency]
      ,SRC.[CrpPlanEligOverride]
      ,SRC.[CrpPlanEligOverrideEffectiveDate]
      ,SRC.[CrpPercentageRate]
      ,SRC.[CrpPercentageRateEffectiveDate]
      ,SRC.[EmploymentDesignation]
      ,SRC.[EmploymentDesignationEffectiveDate]
      ,SRC.[ChpLastErOverride]
      ,SRC.[ChpYearsofService]
      ,SRC.[ChpYearsofServiceEffectiveDate]
      ,SRC.[TobaccoAttribute]
      ,SRC.[TobaccoAttributeEffectiveDate]
      ,SRC.[SpouseTobacco]
      ,SRC.[SpouseTobaccoEffectiveDate]
      ,SRC.[PremiumPlusEmployeeInd]
      ,SRC.[PremiumPlusEmployeeIndEffectiveDate]
      ,SRC.[PremiumPlusSpouseInd]
      ,SRC.[PremiumPlusSpouseIndEffectiveDate]
      ,SRC.[MedicareEligibleIndicator]
      ,SRC.[MedicareEligibleIndicatorEffectiveDate]
      ,SRC.[DisabilityStatus]
      ,SRC.[DisabilityStatusEffectiveDate]
      ,SRC.[CpsDisabilityNoCHP]
      ,SRC.[CpsDisabilityNoCHPEffectiveDate]
      ,SRC.[CpsEmployerWaiveDate]
      ,SRC.[CpsLastDayWorkPriortoDis]
      ,SRC.[CpsDisabWaiverBillToCDSP]
      ,SRC.[CpsDisabWaiverBillToCDSPEffectiveDate]
      ,SRC.[ChpPlanAvailabilityOverride]
      ,SRC.[ChpPlanAvailabilityOverrideEffectiveDate]
      ,SRC.[3TierOverride]
      ,SRC.[3TierOverrideEffectiveDate]
      ,SRC.[ChpGrandfatheredIndicator]
      ,SRC.[ChpGrandfatheredIndicatorEffectiveDate]
      ,SRC.[CdspOverride]
      ,SRC.[CdspOverrideEffectiveDate]
      ,SRC.[AcaEligibilityOverride]
      ,SRC.[AcaEligibilityOverrideEffectiveDate]
      ,SRC.[MnSupplifePrevDeniedFlag]
      ,SRC.[MnSupplifePrevDeniedFlagEffectiveDate]
      ,SRC.[MnSpSupplifePrevDeniedFlag]
      ,SRC.[MnSpSupplifePrevDeniedFlagEffectiveDate]
      ,SRC.[SecurianDirectBillIndicator]
      ,SRC.[SecurianDirectBillIndicatorEffectiveDate]
      ,@TodayDate -- ETLRowStartDate
      ,@MaxEndDate -- ETLRowEndDate
      ,'1' -- ETLRowIsCurrent
      ,@RunTime -- DwInsertDate
      ,SUSER_NAME() -- DwInsertUsername
      ,@ProcessName -- DwInsertProcessName
      ,@RunTime -- DwUpdateDate
      ,SUSER_NAME() -- DwUpdateUsername
      ,@ProcessName -- DwUpdateProcessName
	)
	WHEN MATCHED and TGT.ETLRowIsCurrent = 1 
	and (
	NULLIF(SRC.[EmployerId], TGT.[EmployerId]) is not null or NULLIF(TGT.[EmployerId], SRC.[EmployerId]) is not null or
--	NULLIF(SRC.[EmployeeSsn], TGT.[EmployeeSsn]) is not null or NULLIF(TGT.[EmployeeSsn], SRC.[EmployeeSsn]) is not null or
	NULLIF(SRC.[ExternalMemberId], TGT.[ExternalMemberId]) is not null or NULLIF(TGT.[ExternalMemberId], SRC.[ExternalMemberId]) is not null or
	NULLIF(SRC.[LastName], TGT.[LastName]) is not null or NULLIF(TGT.[LastName], SRC.[LastName]) is not null or
	NULLIF(SRC.[FirstName], TGT.[FirstName]) is not null or NULLIF(TGT.[FirstName], SRC.[FirstName]) is not null or
	NULLIF(SRC.[MiddleNameOrInitial], TGT.[MiddleNameOrInitial]) is not null or NULLIF(TGT.[MiddleNameOrInitial], SRC.[MiddleNameOrInitial]) is not null or
	NULLIF(SRC.[Suffix], TGT.[Suffix]) is not null or NULLIF(TGT.[Suffix], SRC.[Suffix]) is not null or
	NULLIF(SRC.[Birthdate], TGT.[Birthdate]) is not null or NULLIF(TGT.[Birthdate], SRC.[Birthdate]) is not null or
	NULLIF(SRC.[Gender], TGT.[Gender]) is not null or NULLIF(TGT.[Gender], SRC.[Gender]) is not null or
	NULLIF(SRC.[Address1], TGT.[Address1]) is not null or NULLIF(TGT.[Address1], SRC.[Address1]) is not null or
	NULLIF(SRC.[Address2], TGT.[Address2]) is not null or NULLIF(TGT.[Address2], SRC.[Address2]) is not null or
	NULLIF(SRC.[Address3], TGT.[Address3]) is not null or NULLIF(TGT.[Address3], SRC.[Address3]) is not null or
	NULLIF(SRC.[City], TGT.[City]) is not null or NULLIF(TGT.[City], SRC.[City]) is not null or
	NULLIF(SRC.[State], TGT.[State]) is not null or NULLIF(TGT.[State], SRC.[State]) is not null or
	NULLIF(SRC.[Postal], TGT.[Postal]) is not null or NULLIF(TGT.[Postal], SRC.[Postal]) is not null or
	NULLIF(SRC.[County], TGT.[County]) is not null or NULLIF(TGT.[County], SRC.[County]) is not null or
	NULLIF(SRC.[AddressEffectiveDate], TGT.[AddressEffectiveDate]) is not null or NULLIF(TGT.[AddressEffectiveDate], SRC.[AddressEffectiveDate]) is not null or
	NULLIF(SRC.[PrimaryPhoneNumber], TGT.[PrimaryPhoneNumber]) is not null or NULLIF(TGT.[PrimaryPhoneNumber], SRC.[PrimaryPhoneNumber]) is not null or
	NULLIF(SRC.[WorkPhone], TGT.[WorkPhone]) is not null or NULLIF(TGT.[WorkPhone], SRC.[WorkPhone]) is not null or
	NULLIF(SRC.[MobilePhoneNumber], TGT.[MobilePhoneNumber]) is not null or NULLIF(TGT.[MobilePhoneNumber], SRC.[MobilePhoneNumber]) is not null or
	NULLIF(SRC.[WorkEmailAddress], TGT.[WorkEmailAddress]) is not null or NULLIF(TGT.[WorkEmailAddress], SRC.[WorkEmailAddress]) is not null or
	NULLIF(SRC.[HomeEmailAddress], TGT.[HomeEmailAddress]) is not null or NULLIF(TGT.[HomeEmailAddress], SRC.[HomeEmailAddress]) is not null or
	NULLIF(SRC.[OriginalHireDate], TGT.[OriginalHireDate]) is not null or NULLIF(TGT.[OriginalHireDate], SRC.[OriginalHireDate]) is not null or
	NULLIF(SRC.[LatestHireDate], TGT.[LatestHireDate]) is not null or NULLIF(TGT.[LatestHireDate], SRC.[LatestHireDate]) is not null or
	NULLIF(SRC.[EmploymentStatus], TGT.[EmploymentStatus]) is not null or NULLIF(TGT.[EmploymentStatus], SRC.[EmploymentStatus]) is not null or
	NULLIF(SRC.[EmploymentStatusEffectiveDate], TGT.[EmploymentStatusEffectiveDate]) is not null or NULLIF(TGT.[EmploymentStatusEffectiveDate], SRC.[EmploymentStatusEffectiveDate]) is not null or
	NULLIF(SRC.[DeathDateAttribute], TGT.[DeathDateAttribute]) is not null or NULLIF(TGT.[DeathDateAttribute], SRC.[DeathDateAttribute]) is not null or
	NULLIF(SRC.[TerminationDateAttribute], TGT.[TerminationDateAttribute]) is not null or NULLIF(TGT.[TerminationDateAttribute], SRC.[TerminationDateAttribute]) is not null or
	NULLIF(SRC.[BenefitsEligibilityDate], TGT.[BenefitsEligibilityDate]) is not null or NULLIF(TGT.[BenefitsEligibilityDate], SRC.[BenefitsEligibilityDate]) is not null or
	NULLIF(SRC.[EmployerDepartmentReporting], TGT.[EmployerDepartmentReporting]) is not null or NULLIF(TGT.[EmployerDepartmentReporting], SRC.[EmployerDepartmentReporting]) is not null or
	NULLIF(SRC.[ScheduledHours], TGT.[ScheduledHours]) is not null or NULLIF(TGT.[ScheduledHours], SRC.[ScheduledHours]) is not null or
	NULLIF(SRC.[ScheduledHoursEffectiveDate], TGT.[ScheduledHoursEffectiveDate]) is not null or NULLIF(TGT.[ScheduledHoursEffectiveDate], SRC.[ScheduledHoursEffectiveDate]) is not null or
	NULLIF(SRC.[BaseAnnualSalaryAcrFactor], TGT.[BaseAnnualSalaryAcrFactor]) is not null or NULLIF(TGT.[BaseAnnualSalaryAcrFactor], SRC.[BaseAnnualSalaryAcrFactor]) is not null or
	NULLIF(SRC.[AnnualCashHousingAllowanceAcrFactor], TGT.[AnnualCashHousingAllowanceAcrFactor]) is not null or NULLIF(TGT.[AnnualCashHousingAllowanceAcrFactor], SRC.[AnnualCashHousingAllowanceAcrFactor]) is not null or
	NULLIF(SRC.[HomeProvidedAmountAcrFactor], TGT.[HomeProvidedAmountAcrFactor]) is not null or NULLIF(TGT.[HomeProvidedAmountAcrFactor], SRC.[HomeProvidedAmountAcrFactor]) is not null or
	NULLIF(SRC.[AnnualCashUtilityAllowanceAcrFactor], TGT.[AnnualCashUtilityAllowanceAcrFactor]) is not null or NULLIF(TGT.[AnnualCashUtilityAllowanceAcrFactor], SRC.[AnnualCashUtilityAllowanceAcrFactor]) is not null or
	NULLIF(SRC.[TotalAcrSumOfThreeAbove], TGT.[TotalAcrSumOfThreeAbove]) is not null or NULLIF(TGT.[TotalAcrSumOfThreeAbove], SRC.[TotalAcrSumOfThreeAbove]) is not null or
	NULLIF(SRC.[AcrEffectiveDate], TGT.[AcrEffectiveDate]) is not null or NULLIF(TGT.[AcrEffectiveDate], SRC.[AcrEffectiveDate]) is not null or
	NULLIF(SRC.[JobTitleOrClass], TGT.[JobTitleOrClass]) is not null or NULLIF(TGT.[JobTitleOrClass], SRC.[JobTitleOrClass]) is not null or
	NULLIF(SRC.[JobTitleOrClassDescription], TGT.[JobTitleOrClassDescription]) is not null or NULLIF(TGT.[JobTitleOrClassDescription], SRC.[JobTitleOrClassDescription]) is not null or
	NULLIF(SRC.[SalariedOrHourlyIndicator], TGT.[SalariedOrHourlyIndicator]) is not null or NULLIF(TGT.[SalariedOrHourlyIndicator], SRC.[SalariedOrHourlyIndicator]) is not null or
	NULLIF(SRC.[SalariedOrHourlyIndicatorEffectiveDate], TGT.[SalariedOrHourlyIndicatorEffectiveDate]) is not null or NULLIF(TGT.[SalariedOrHourlyIndicatorEffectiveDate], SRC.[SalariedOrHourlyIndicatorEffectiveDate]) is not null or
	NULLIF(SRC.[RosterNonRosterIndicator], TGT.[RosterNonRosterIndicator]) is not null or NULLIF(TGT.[RosterNonRosterIndicator], SRC.[RosterNonRosterIndicator]) is not null or
	NULLIF(SRC.[RosteredOrCommissionedSocialSecurityIndicator], TGT.[RosteredOrCommissionedSocialSecurityIndicator]) is not null or NULLIF(TGT.[RosteredOrCommissionedSocialSecurityIndicator], SRC.[RosteredOrCommissionedSocialSecurityIndicator]) is not null or
	NULLIF(SRC.[RosterNonRosterIndicatorEffectiveDate], TGT.[RosterNonRosterIndicatorEffectiveDate]) is not null or NULLIF(TGT.[RosterNonRosterIndicatorEffectiveDate], SRC.[RosterNonRosterIndicatorEffectiveDate]) is not null or
	NULLIF(SRC.[Salutation], TGT.[Salutation]) is not null or NULLIF(TGT.[Salutation], SRC.[Salutation]) is not null or
	NULLIF(SRC.[MaritalStatus], TGT.[MaritalStatus]) is not null or NULLIF(TGT.[MaritalStatus], SRC.[MaritalStatus]) is not null or
	NULLIF(SRC.[MaritalStatusEffectiveDate], TGT.[MaritalStatusEffectiveDate]) is not null or NULLIF(TGT.[MaritalStatusEffectiveDate], SRC.[MaritalStatusEffectiveDate]) is not null or
	NULLIF(SRC.[LawsonEmployeeId], TGT.[LawsonEmployeeId]) is not null or NULLIF(TGT.[LawsonEmployeeId], SRC.[LawsonEmployeeId]) is not null or
	NULLIF(SRC.[MissionaryTypeIndicator], TGT.[MissionaryTypeIndicator]) is not null or NULLIF(TGT.[MissionaryTypeIndicator], SRC.[MissionaryTypeIndicator]) is not null or
	NULLIF(SRC.[MissionCountryCode], TGT.[MissionCountryCode]) is not null or NULLIF(TGT.[MissionCountryCode], SRC.[MissionCountryCode]) is not null or
	NULLIF(SRC.[MissionaryTypeEffectiveDate], TGT.[MissionaryTypeEffectiveDate]) is not null or NULLIF(TGT.[MissionaryTypeEffectiveDate], SRC.[MissionaryTypeEffectiveDate]) is not null or
	NULLIF(SRC.[BilltoEmployerTaip], TGT.[BilltoEmployerTaip]) is not null or NULLIF(TGT.[BilltoEmployerTaip], SRC.[BilltoEmployerTaip]) is not null or
	NULLIF(SRC.[ChpCostAndBillingOverride], TGT.[ChpCostAndBillingOverride]) is not null or NULLIF(TGT.[ChpCostAndBillingOverride], SRC.[ChpCostAndBillingOverride]) is not null or
	NULLIF(SRC.[CdspCostAndBillingOverride], TGT.[CdspCostAndBillingOverride]) is not null or NULLIF(TGT.[CdspCostAndBillingOverride], SRC.[CdspCostAndBillingOverride]) is not null or
	NULLIF(SRC.[VoluntaryBenefitsCostAndBillingOverride], TGT.[VoluntaryBenefitsCostAndBillingOverride]) is not null or NULLIF(TGT.[VoluntaryBenefitsCostAndBillingOverride], SRC.[VoluntaryBenefitsCostAndBillingOverride]) is not null or
	NULLIF(SRC.[ChpCostAndBillngOverrideEndDate], TGT.[ChpCostAndBillngOverrideEndDate]) is not null or NULLIF(TGT.[ChpCostAndBillngOverrideEndDate], SRC.[ChpCostAndBillngOverrideEndDate]) is not null or
	NULLIF(SRC.[CdspCostAndBillngOverrideEndDate], TGT.[CdspCostAndBillngOverrideEndDate]) is not null or NULLIF(TGT.[CdspCostAndBillngOverrideEndDate], SRC.[CdspCostAndBillngOverrideEndDate]) is not null or
	NULLIF(SRC.[ChpCostAndBillingOverrideEmployerNumber], TGT.[ChpCostAndBillingOverrideEmployerNumber]) is not null or NULLIF(TGT.[ChpCostAndBillingOverrideEmployerNumber], SRC.[ChpCostAndBillingOverrideEmployerNumber]) is not null or
	NULLIF(SRC.[CdspCostAndBillingOverrideEmployerNumber], TGT.[CdspCostAndBillingOverrideEmployerNumber]) is not null or NULLIF(TGT.[CdspCostAndBillingOverrideEmployerNumber], SRC.[CdspCostAndBillingOverrideEmployerNumber]) is not null or
	NULLIF(SRC.[VoluntaryBenefitsCostandBillingOverrideEmployerNumber], TGT.[VoluntaryBenefitsCostandBillingOverrideEmployerNumber]) is not null or NULLIF(TGT.[VoluntaryBenefitsCostandBillingOverrideEmployerNumber], SRC.[VoluntaryBenefitsCostandBillingOverrideEmployerNumber]) is not null or
	NULLIF(SRC.[VoluntaryBenefitsCostandBillngOverrideEndDate], TGT.[VoluntaryBenefitsCostandBillngOverrideEndDate]) is not null or NULLIF(TGT.[VoluntaryBenefitsCostandBillngOverrideEndDate], SRC.[VoluntaryBenefitsCostandBillngOverrideEndDate]) is not null or
	NULLIF(SRC.[CrpTraditionalRegularFullBasisIndicator], TGT.[CrpTraditionalRegularFullBasisIndicator]) is not null or NULLIF(TGT.[CrpTraditionalRegularFullBasisIndicator], SRC.[CrpTraditionalRegularFullBasisIndicator]) is not null or
	NULLIF(SRC.[CrpTraditionalRegularFullBasisEffectiveDate], TGT.[CrpTraditionalRegularFullBasisEffectiveDate]) is not null or NULLIF(TGT.[CrpTraditionalRegularFullBasisEffectiveDate], SRC.[CrpTraditionalRegularFullBasisEffectiveDate]) is not null or
	NULLIF(SRC.[Extensiontype], TGT.[Extensiontype]) is not null or NULLIF(TGT.[Extensiontype], SRC.[Extensiontype]) is not null or
	NULLIF(SRC.[ExtensionPaidThruDate], TGT.[ExtensionPaidThruDate]) is not null or NULLIF(TGT.[ExtensionPaidThruDate], SRC.[ExtensionPaidThruDate]) is not null or
	NULLIF(SRC.[ExtensionStartDate], TGT.[ExtensionStartDate]) is not null or NULLIF(TGT.[ExtensionStartDate], SRC.[ExtensionStartDate]) is not null or
	NULLIF(SRC.[ExtensionEndDate], TGT.[ExtensionEndDate]) is not null or NULLIF(TGT.[ExtensionEndDate], SRC.[ExtensionEndDate]) is not null or
	NULLIF(SRC.[CpsPreviousEmployerNumber], TGT.[CpsPreviousEmployerNumber]) is not null or NULLIF(TGT.[CpsPreviousEmployerNumber], SRC.[CpsPreviousEmployerNumber]) is not null or
	NULLIF(SRC.[MaidenName], TGT.[MaidenName]) is not null or NULLIF(TGT.[MaidenName], SRC.[MaidenName]) is not null or
	NULLIF(SRC.[NewhireEmailAddress], TGT.[NewhireEmailAddress]) is not null or NULLIF(TGT.[NewhireEmailAddress], SRC.[NewhireEmailAddress]) is not null or
	NULLIF(SRC.[TerminationRuleIndicator], TGT.[TerminationRuleIndicator]) is not null or NULLIF(TGT.[TerminationRuleIndicator], SRC.[TerminationRuleIndicator]) is not null or
	NULLIF(SRC.[ConcordiaSalutation], TGT.[ConcordiaSalutation]) is not null or NULLIF(TGT.[ConcordiaSalutation], SRC.[ConcordiaSalutation]) is not null or
	NULLIF(SRC.[JobClassEffectiveDate], TGT.[JobClassEffectiveDate]) is not null or NULLIF(TGT.[JobClassEffectiveDate], SRC.[JobClassEffectiveDate]) is not null or
	NULLIF(SRC.[JobTitleEffectiveDate], TGT.[JobTitleEffectiveDate]) is not null or NULLIF(TGT.[JobTitleEffectiveDate], SRC.[JobTitleEffectiveDate]) is not null or
	NULLIF(SRC.[TaipEligIndicator], TGT.[TaipEligIndicator]) is not null or NULLIF(TGT.[TaipEligIndicator], SRC.[TaipEligIndicator]) is not null or
	NULLIF(SRC.[TaipEligIndicatorEffectiveDate], TGT.[TaipEligIndicatorEffectiveDate]) is not null or NULLIF(TGT.[TaipEligIndicatorEffectiveDate], SRC.[TaipEligIndicatorEffectiveDate]) is not null or
	NULLIF(SRC.[TaipDualCoverage], TGT.[TaipDualCoverage]) is not null or NULLIF(TGT.[TaipDualCoverage], SRC.[TaipDualCoverage]) is not null or
	NULLIF(SRC.[TaipDualCoverageEffectiveDate], TGT.[TaipDualCoverageEffectiveDate]) is not null or NULLIF(TGT.[TaipDualCoverageEffectiveDate], SRC.[TaipDualCoverageEffectiveDate]) is not null or
	NULLIF(SRC.[PayFrequency], TGT.[PayFrequency]) is not null or NULLIF(TGT.[PayFrequency], SRC.[PayFrequency]) is not null or
	NULLIF(SRC.[CrpPlanEligOverride], TGT.[CrpPlanEligOverride]) is not null or NULLIF(TGT.[CrpPlanEligOverride], SRC.[CrpPlanEligOverride]) is not null or
	NULLIF(SRC.[CrpPlanEligOverrideEffectiveDate], TGT.[CrpPlanEligOverrideEffectiveDate]) is not null or NULLIF(TGT.[CrpPlanEligOverrideEffectiveDate], SRC.[CrpPlanEligOverrideEffectiveDate]) is not null or
	NULLIF(SRC.[CrpPercentageRate], TGT.[CrpPercentageRate]) is not null or NULLIF(TGT.[CrpPercentageRate], SRC.[CrpPercentageRate]) is not null or
	NULLIF(SRC.[CrpPercentageRateEffectiveDate], TGT.[CrpPercentageRateEffectiveDate]) is not null or NULLIF(TGT.[CrpPercentageRateEffectiveDate], SRC.[CrpPercentageRateEffectiveDate]) is not null or
	NULLIF(SRC.[EmploymentDesignation], TGT.[EmploymentDesignation]) is not null or NULLIF(TGT.[EmploymentDesignation], SRC.[EmploymentDesignation]) is not null or
	NULLIF(SRC.[EmploymentDesignationEffectiveDate], TGT.[EmploymentDesignationEffectiveDate]) is not null or NULLIF(TGT.[EmploymentDesignationEffectiveDate], SRC.[EmploymentDesignationEffectiveDate]) is not null or
	NULLIF(SRC.[ChpLastErOverride], TGT.[ChpLastErOverride]) is not null or NULLIF(TGT.[ChpLastErOverride], SRC.[ChpLastErOverride]) is not null or
	NULLIF(SRC.[ChpYearsofService], TGT.[ChpYearsofService]) is not null or NULLIF(TGT.[ChpYearsofService], SRC.[ChpYearsofService]) is not null or
	NULLIF(SRC.[ChpYearsofServiceEffectiveDate], TGT.[ChpYearsofServiceEffectiveDate]) is not null or NULLIF(TGT.[ChpYearsofServiceEffectiveDate], SRC.[ChpYearsofServiceEffectiveDate]) is not null or
	NULLIF(SRC.[TobaccoAttribute], TGT.[TobaccoAttribute]) is not null or NULLIF(TGT.[TobaccoAttribute], SRC.[TobaccoAttribute]) is not null or
	NULLIF(SRC.[TobaccoAttributeEffectiveDate], TGT.[TobaccoAttributeEffectiveDate]) is not null or NULLIF(TGT.[TobaccoAttributeEffectiveDate], SRC.[TobaccoAttributeEffectiveDate]) is not null or
	NULLIF(SRC.[SpouseTobacco], TGT.[SpouseTobacco]) is not null or NULLIF(TGT.[SpouseTobacco], SRC.[SpouseTobacco]) is not null or
	NULLIF(SRC.[SpouseTobaccoEffectiveDate], TGT.[SpouseTobaccoEffectiveDate]) is not null or NULLIF(TGT.[SpouseTobaccoEffectiveDate], SRC.[SpouseTobaccoEffectiveDate]) is not null or
	NULLIF(SRC.[PremiumPlusEmployeeInd], TGT.[PremiumPlusEmployeeInd]) is not null or NULLIF(TGT.[PremiumPlusEmployeeInd], SRC.[PremiumPlusEmployeeInd]) is not null or
	NULLIF(SRC.[PremiumPlusEmployeeIndEffectiveDate], TGT.[PremiumPlusEmployeeIndEffectiveDate]) is not null or NULLIF(TGT.[PremiumPlusEmployeeIndEffectiveDate], SRC.[PremiumPlusEmployeeIndEffectiveDate]) is not null or
	NULLIF(SRC.[PremiumPlusSpouseInd], TGT.[PremiumPlusSpouseInd]) is not null or NULLIF(TGT.[PremiumPlusSpouseInd], SRC.[PremiumPlusSpouseInd]) is not null or
	NULLIF(SRC.[PremiumPlusSpouseIndEffectiveDate], TGT.[PremiumPlusSpouseIndEffectiveDate]) is not null or NULLIF(TGT.[PremiumPlusSpouseIndEffectiveDate], SRC.[PremiumPlusSpouseIndEffectiveDate]) is not null or
	NULLIF(SRC.[MedicareEligibleIndicator], TGT.[MedicareEligibleIndicator]) is not null or NULLIF(TGT.[MedicareEligibleIndicator], SRC.[MedicareEligibleIndicator]) is not null or
	NULLIF(SRC.[MedicareEligibleIndicatorEffectiveDate], TGT.[MedicareEligibleIndicatorEffectiveDate]) is not null or NULLIF(TGT.[MedicareEligibleIndicatorEffectiveDate], SRC.[MedicareEligibleIndicatorEffectiveDate]) is not null or
	NULLIF(SRC.[DisabilityStatus], TGT.[DisabilityStatus]) is not null or NULLIF(TGT.[DisabilityStatus], SRC.[DisabilityStatus]) is not null or
	NULLIF(SRC.[DisabilityStatusEffectiveDate], TGT.[DisabilityStatusEffectiveDate]) is not null or NULLIF(TGT.[DisabilityStatusEffectiveDate], SRC.[DisabilityStatusEffectiveDate]) is not null or
	NULLIF(SRC.[CpsDisabilityNoCHP], TGT.[CpsDisabilityNoCHP]) is not null or NULLIF(TGT.[CpsDisabilityNoCHP], SRC.[CpsDisabilityNoCHP]) is not null or
	NULLIF(SRC.[CpsDisabilityNoCHPEffectiveDate], TGT.[CpsDisabilityNoCHPEffectiveDate]) is not null or NULLIF(TGT.[CpsDisabilityNoCHPEffectiveDate], SRC.[CpsDisabilityNoCHPEffectiveDate]) is not null or
	NULLIF(SRC.[CpsEmployerWaiveDate], TGT.[CpsEmployerWaiveDate]) is not null or NULLIF(TGT.[CpsEmployerWaiveDate], SRC.[CpsEmployerWaiveDate]) is not null or
	NULLIF(SRC.[CpsLastDayWorkPriortoDis], TGT.[CpsLastDayWorkPriortoDis]) is not null or NULLIF(TGT.[CpsLastDayWorkPriortoDis], SRC.[CpsLastDayWorkPriortoDis]) is not null or
	NULLIF(SRC.[CpsDisabWaiverBillToCDSP], TGT.[CpsDisabWaiverBillToCDSP]) is not null or NULLIF(TGT.[CpsDisabWaiverBillToCDSP], SRC.[CpsDisabWaiverBillToCDSP]) is not null or
	NULLIF(SRC.[CpsDisabWaiverBillToCDSPEffectiveDate], TGT.[CpsDisabWaiverBillToCDSPEffectiveDate]) is not null or NULLIF(TGT.[CpsDisabWaiverBillToCDSPEffectiveDate], SRC.[CpsDisabWaiverBillToCDSPEffectiveDate]) is not null or
	NULLIF(SRC.[ChpPlanAvailabilityOverride], TGT.[ChpPlanAvailabilityOverride]) is not null or NULLIF(TGT.[ChpPlanAvailabilityOverride], SRC.[ChpPlanAvailabilityOverride]) is not null or
	NULLIF(SRC.[ChpPlanAvailabilityOverrideEffectiveDate], TGT.[ChpPlanAvailabilityOverrideEffectiveDate]) is not null or NULLIF(TGT.[ChpPlanAvailabilityOverrideEffectiveDate], SRC.[ChpPlanAvailabilityOverrideEffectiveDate]) is not null or
	NULLIF(SRC.[3TierOverride], TGT.[3TierOverride]) is not null or NULLIF(TGT.[3TierOverride], SRC.[3TierOverride]) is not null or
	NULLIF(SRC.[3TierOverrideEffectiveDate], TGT.[3TierOverrideEffectiveDate]) is not null or NULLIF(TGT.[3TierOverrideEffectiveDate], SRC.[3TierOverrideEffectiveDate]) is not null or
	NULLIF(SRC.[ChpGrandfatheredIndicator], TGT.[ChpGrandfatheredIndicator]) is not null or NULLIF(TGT.[ChpGrandfatheredIndicator], SRC.[ChpGrandfatheredIndicator]) is not null or
	NULLIF(SRC.[ChpGrandfatheredIndicatorEffectiveDate], TGT.[ChpGrandfatheredIndicatorEffectiveDate]) is not null or NULLIF(TGT.[ChpGrandfatheredIndicatorEffectiveDate], SRC.[ChpGrandfatheredIndicatorEffectiveDate]) is not null or
	NULLIF(SRC.[CdspOverride], TGT.[CdspOverride]) is not null or NULLIF(TGT.[CdspOverride], SRC.[CdspOverride]) is not null or
	NULLIF(SRC.[CdspOverrideEffectiveDate], TGT.[CdspOverrideEffectiveDate]) is not null or NULLIF(TGT.[CdspOverrideEffectiveDate], SRC.[CdspOverrideEffectiveDate]) is not null or
	NULLIF(SRC.[AcaEligibilityOverride], TGT.[AcaEligibilityOverride]) is not null or NULLIF(TGT.[AcaEligibilityOverride], SRC.[AcaEligibilityOverride]) is not null or
	NULLIF(SRC.[AcaEligibilityOverrideEffectiveDate], TGT.[AcaEligibilityOverrideEffectiveDate]) is not null or NULLIF(TGT.[AcaEligibilityOverrideEffectiveDate], SRC.[AcaEligibilityOverrideEffectiveDate]) is not null or
	NULLIF(SRC.[MnSupplifePrevDeniedFlag], TGT.[MnSupplifePrevDeniedFlag]) is not null or NULLIF(TGT.[MnSupplifePrevDeniedFlag], SRC.[MnSupplifePrevDeniedFlag]) is not null or
	NULLIF(SRC.[MnSupplifePrevDeniedFlagEffectiveDate], TGT.[MnSupplifePrevDeniedFlagEffectiveDate]) is not null or NULLIF(TGT.[MnSupplifePrevDeniedFlagEffectiveDate], SRC.[MnSupplifePrevDeniedFlagEffectiveDate]) is not null or
	NULLIF(SRC.[MnSpSupplifePrevDeniedFlag], TGT.[MnSpSupplifePrevDeniedFlag]) is not null or NULLIF(TGT.[MnSpSupplifePrevDeniedFlag], SRC.[MnSpSupplifePrevDeniedFlag]) is not null or
	NULLIF(SRC.[MnSpSupplifePrevDeniedFlagEffectiveDate], TGT.[MnSpSupplifePrevDeniedFlagEffectiveDate]) is not null or NULLIF(TGT.[MnSpSupplifePrevDeniedFlagEffectiveDate], SRC.[MnSpSupplifePrevDeniedFlagEffectiveDate]) is not null or
	NULLIF(SRC.[SecurianDirectBillIndicator], TGT.[SecurianDirectBillIndicator]) is not null or NULLIF(TGT.[SecurianDirectBillIndicator], SRC.[SecurianDirectBillIndicator]) is not null or
	NULLIF(SRC.[SecurianDirectBillIndicatorEffectiveDate], TGT.[SecurianDirectBillIndicatorEffectiveDate]) is not null or NULLIF(TGT.[SecurianDirectBillIndicatorEffectiveDate], SRC.[SecurianDirectBillIndicatorEffectiveDate]) is not null
	) THEN 
	UPDATE -- Expire records that have a new updated record
		SET TGT.[ETLRowIsCurrent] = '0'
		, TGT.[ETLRowEndDate] = @YesterdayDate
		, TGT.[DwUpdateDate] = @RunTime
		, TGT.[DwUpdateUsername] = SUSER_NAME()
		, TGT.[DwUpdateProcessName] = @ProcessName
	 OUTPUT -- Prepare insert of the new updated records
		$Action Action_out 
      ,SRC.[EmployerId]
      ,SRC.[EmployeeSsn]
      ,SRC.[ExternalMemberId]
      ,SRC.[LastName]
      ,SRC.[FirstName]
      ,SRC.[MiddleNameOrInitial]
      ,SRC.[Suffix]
      ,SRC.[Birthdate]
      ,SRC.[Gender]
      ,SRC.[Address1]
      ,SRC.[Address2]
      ,SRC.[Address3]
      ,SRC.[City]
      ,SRC.[State]
      ,SRC.[Postal]
      ,SRC.[County]
      ,SRC.[AddressEffectiveDate]
      ,SRC.[PrimaryPhoneNumber]
      ,SRC.[WorkPhone]
      ,SRC.[MobilePhoneNumber]
      ,SRC.[WorkEmailAddress]
      ,SRC.[HomeEmailAddress]
      ,SRC.[OriginalHireDate]
      ,SRC.[LatestHireDate]
      ,SRC.[EmploymentStatus]
      ,SRC.[EmploymentStatusEffectiveDate]
      ,SRC.[DeathDateAttribute]
      ,SRC.[TerminationDateAttribute]
      ,SRC.[BenefitsEligibilityDate]
      ,SRC.[EmployerDepartmentReporting]
      ,SRC.[ScheduledHours]
      ,SRC.[ScheduledHoursEffectiveDate]
      ,SRC.[BaseAnnualSalaryAcrFactor]
      ,SRC.[AnnualCashHousingAllowanceAcrFactor]
      ,SRC.[HomeProvidedAmountAcrFactor]
      ,SRC.[AnnualCashUtilityAllowanceAcrFactor]
      ,SRC.[TotalAcrSumOfThreeAbove]
      ,SRC.[AcrEffectiveDate]
      ,SRC.[JobTitleOrClass]
      ,SRC.[JobTitleOrClassDescription]
      ,SRC.[SalariedOrHourlyIndicator]
      ,SRC.[SalariedOrHourlyIndicatorEffectiveDate]
      ,SRC.[RosterNonRosterIndicator]
      ,SRC.[RosteredOrCommissionedSocialSecurityIndicator]
      ,SRC.[RosterNonRosterIndicatorEffectiveDate]
      ,SRC.[Salutation]
      ,SRC.[MaritalStatus]
      ,SRC.[MaritalStatusEffectiveDate]
      ,SRC.[LawsonEmployeeId]
      ,SRC.[MissionaryTypeIndicator]
      ,SRC.[MissionCountryCode]
      ,SRC.[MissionaryTypeEffectiveDate]
      ,SRC.[BilltoEmployerTaip]
      ,SRC.[ChpCostAndBillingOverride]
      ,SRC.[CdspCostAndBillingOverride]
      ,SRC.[VoluntaryBenefitsCostAndBillingOverride]
      ,SRC.[ChpCostAndBillngOverrideEndDate]
      ,SRC.[CdspCostAndBillngOverrideEndDate]
      ,SRC.[ChpCostAndBillingOverrideEmployerNumber]
      ,SRC.[CdspCostAndBillingOverrideEmployerNumber]
      ,SRC.[VoluntaryBenefitsCostandBillingOverrideEmployerNumber]
      ,SRC.[VoluntaryBenefitsCostandBillngOverrideEndDate]
      ,SRC.[CrpTraditionalRegularFullBasisIndicator]
      ,SRC.[CrpTraditionalRegularFullBasisEffectiveDate]
      ,SRC.[Extensiontype]
      ,SRC.[ExtensionPaidThruDate]
      ,SRC.[ExtensionStartDate]
      ,SRC.[ExtensionEndDate]
      ,SRC.[CpsPreviousEmployerNumber]
      ,SRC.[MaidenName]
      ,SRC.[NewhireEmailAddress]
      ,SRC.[TerminationRuleIndicator]
      ,SRC.[ConcordiaSalutation]
      ,SRC.[JobClassEffectiveDate]
      ,SRC.[JobTitleEffectiveDate]
      ,SRC.[TaipEligIndicator]
      ,SRC.[TaipEligIndicatorEffectiveDate]
      ,SRC.[TaipDualCoverage]
      ,SRC.[TaipDualCoverageEffectiveDate]
      ,SRC.[PayFrequency]
      ,SRC.[CrpPlanEligOverride]
      ,SRC.[CrpPlanEligOverrideEffectiveDate]
      ,SRC.[CrpPercentageRate]
      ,SRC.[CrpPercentageRateEffectiveDate]
      ,SRC.[EmploymentDesignation]
      ,SRC.[EmploymentDesignationEffectiveDate]
      ,SRC.[ChpLastErOverride]
      ,SRC.[ChpYearsofService]
      ,SRC.[ChpYearsofServiceEffectiveDate]
      ,SRC.[TobaccoAttribute]
      ,SRC.[TobaccoAttributeEffectiveDate]
      ,SRC.[SpouseTobacco]
      ,SRC.[SpouseTobaccoEffectiveDate]
      ,SRC.[PremiumPlusEmployeeInd]
      ,SRC.[PremiumPlusEmployeeIndEffectiveDate]
      ,SRC.[PremiumPlusSpouseInd]
      ,SRC.[PremiumPlusSpouseIndEffectiveDate]
      ,SRC.[MedicareEligibleIndicator]
      ,SRC.[MedicareEligibleIndicatorEffectiveDate]
      ,SRC.[DisabilityStatus]
      ,SRC.[DisabilityStatusEffectiveDate]
      ,SRC.[CpsDisabilityNoCHP]
      ,SRC.[CpsDisabilityNoCHPEffectiveDate]
      ,SRC.[CpsEmployerWaiveDate]
      ,SRC.[CpsLastDayWorkPriortoDis]
      ,SRC.[CpsDisabWaiverBillToCDSP]
      ,SRC.[CpsDisabWaiverBillToCDSPEffectiveDate]
      ,SRC.[ChpPlanAvailabilityOverride]
      ,SRC.[ChpPlanAvailabilityOverrideEffectiveDate]
      ,SRC.[3TierOverride]
      ,SRC.[3TierOverrideEffectiveDate]
      ,SRC.[ChpGrandfatheredIndicator]
      ,SRC.[ChpGrandfatheredIndicatorEffectiveDate]
      ,SRC.[CdspOverride]
      ,SRC.[CdspOverrideEffectiveDate]
      ,SRC.[AcaEligibilityOverride]
      ,SRC.[AcaEligibilityOverrideEffectiveDate]
      ,SRC.[MnSupplifePrevDeniedFlag]
      ,SRC.[MnSupplifePrevDeniedFlagEffectiveDate]
      ,SRC.[MnSpSupplifePrevDeniedFlag]
      ,SRC.[MnSpSupplifePrevDeniedFlagEffectiveDate]
      ,SRC.[SecurianDirectBillIndicator]
      ,SRC.[SecurianDirectBillIndicatorEffectiveDate]
      ,@TodayDate as [ETLRowStartDate]
      ,@MaxEndDate as ETLRowEndDate
      ,'1' as [ETLRowIsCurrent]
      ,@RunTime as [DwInsertDate]
      ,SUSER_NAME() as [DwInsertUsername]
      ,@ProcessName as [DwInsertProcessName]
      ,@RunTime as [DwUpdateDate]
      ,SUSER_NAME() as [DwUpdateUsername]
      ,@ProcessName as [DwUpdateProcessName]
	) as MERGE_OUT
	where MERGE_OUT.Action_Out = 'UPDATE' 
	and MERGE_OUT.EmployeeSsn is not null
	; 

end


GO
