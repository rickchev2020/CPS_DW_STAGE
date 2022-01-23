SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

-- exec [dbo].[SpEEDEMO_COMPARE_PREV]

CREATE procedure [dbo].[SpEEDEMO_COMPARE_PREV]
as 
begin

truncate table cps_dw_stage.dbo.EEDemoComparePREV_Demographics;

	WITH RECTMP2 AS 
	(
	SELECT [EmployerId]
		  ,[EmployeeSsn]
		  ,[EmployeeId]
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
	from [CPS_DW_STAGE].dbo.[BasIncomingEmployeeDemographic]
	WHERE SOURCEMODIFIEDDATE > GETDATE() -1

	EXCEPT

	(SELECT [EmployerId]
		  ,[EmployeeSsn]
		  ,[EmployeeId]
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
	from [CPS_DW_STAGE].dbo.[BasIncomingEmployeeDemographic]
	WHERE  SOURCEMODIFIEDDATE < GETDATE() -1
		AND SOURCEMODIFIEDDATE > ( CASE 
		WHEN  DATEPART("dw", GETDATE()) = 2 THEN GETDATE() - 4
		ELSE  GETDATE() - 2
		END )
	))

	INSERT INTO cps_dw_stage.dbo.EEDemoComparePREV_Demographics
		([FINDICATOR]
      ,[BasIncomingEmployeeDemographicId]
      ,[EmployerId]
      ,[EmployeeSsn]
      ,[EmployeeId]
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
      ,[SourceModifiedDate]
      ,[DwSourceName]
      ,[DwInsertDate]
      ,[DwInsertUsername]
      ,[DwInsertProcessName]
      ,[DwUpdateDate]
      ,[DwUpdateUsername]
      ,[DwUpdateProcessName])
	SELECT 
		'PREV' AS FINDICATOR
		,A.[BasIncomingEmployeeDemographicId]
		,A.[EmployerId]
		,A.[EmployeeSsn]
		,A.[EmployeeId]
		,A.[LastName]
		,A.[FirstName]
		,A.[MiddleNameOrInitial]
		,A.[Suffix]
		,A.[Birthdate]
		,A.[Gender]
		,A.[Address1]
		,A.[Address2]
		,A.[Address3]
		,A.[City]
		,A.[State]
		,A.[Postal]
		,A.[County]
		,A.[AddressEffectiveDate]
		,A.[PrimaryPhoneNumber]
		,A.[WorkPhone]
		,A.[MobilePhoneNumber]
		,A.[WorkEmailAddress]
		,A.[HomeEmailAddress]
		,A.[OriginalHireDate]
		,A.[LatestHireDate]
		,A.[EmploymentStatus]
		,A.[EmploymentStatusEffectiveDate]
		,A.[DeathDateAttribute]
		,A.[TerminationDateAttribute]
		,A.[BenefitsEligibilityDate]
		,A.[EmployerDepartmentReporting]
		,A.[ScheduledHours]
		,A.[ScheduledHoursEffectiveDate]
		,A.[BaseAnnualSalaryAcrFactor]
		,A.[AnnualCashHousingAllowanceAcrFactor]
		,A.[HomeProvidedAmountAcrFactor]
		,A.[AnnualCashUtilityAllowanceAcrFactor]
		,A.[TotalAcrSumOfThreeAbove]
		,A.[AcrEffectiveDate]
		,A.[JobTitleOrClass]
		,A.[JobTitleOrClassDescription]
		,A.[SalariedOrHourlyIndicator]
		,A.[SalariedOrHourlyIndicatorEffectiveDate]
		,A.[RosterNonRosterIndicator]
		,A.[RosteredOrCommissionedSocialSecurityIndicator]
		,A.[RosterNonRosterIndicatorEffectiveDate]
		,A.[Salutation]
		,A.[MaritalStatus]
		,A.[MaritalStatusEffectiveDate]
		,A.[LawsonEmployeeId]
		,A.[MissionaryTypeIndicator]
		,A.[MissionCountryCode]
		,A.[MissionaryTypeEffectiveDate]
		,A.[BilltoEmployerTaip]
		,A.[ChpCostAndBillingOverride]
		,A.[CdspCostAndBillingOverride]
		,A.[VoluntaryBenefitsCostAndBillingOverride]
		,A.[ChpCostAndBillngOverrideEndDate]
		,A.[CdspCostAndBillngOverrideEndDate]
		,A.[ChpCostAndBillingOverrideEmployerNumber]
		,A.[CdspCostAndBillingOverrideEmployerNumber]
		,A.[VoluntaryBenefitsCostandBillingOverrideEmployerNumber]
		,A.[VoluntaryBenefitsCostandBillngOverrideEndDate]
		,A.[CrpTraditionalRegularFullBasisIndicator]
		,A.[CrpTraditionalRegularFullBasisEffectiveDate]
		,A.[Extensiontype]
		,A.[ExtensionPaidThruDate]
		,A.[ExtensionStartDate]
		,A.[ExtensionEndDate]
		,A.[CpsPreviousEmployerNumber]
		,A.[SourceModifiedDate]
		,A.[DwSourceName]
		,A.[DwInsertDate]
		,A.[DwInsertUsername]
		,A.[DwInsertProcessName]
		,A.[DwUpdateDate]
		,A.[DwUpdateUsername]
		,A.[DwUpdateProcessName] 
	FROM [CPS_DW_STAGE].dbo.[BasIncomingEmployeeDemographic] A
	JOIN RECTMP2 B
	ON  A.[EmployeeSsn] = B.[EmployeeSsn]
		 WHERE SOURCEMODIFIEDDATE < GETDATE() -1
					AND SOURCEMODIFIEDDATE > ( CASE 
							WHEN  DATEPART("dw", GETDATE()) = 2 THEN GETDATE() - 4
							ELSE  GETDATE() - 2
							END )
		  and A.[EmployeeSsn] in (SELECT d.[EmployeeSsn]
					from [CPS_DW_STAGE].dbo.[BasIncomingEmployeeDemographic] d
					where SOURCEMODIFIEDDATE > GETDATE() -1
							)
		ORDER BY A.[EmployeeSsn]
	;

	WITH RECTMP AS 
	(
	SELECT [EmployerId]
		  ,[EmployeeSsn]
		  ,[EmployeeId]
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
	from [CPS_DW_STAGE].dbo.[BasIncomingEmployeeDemographic]
	WHERE SOURCEMODIFIEDDATE > GETDATE() -1

	EXCEPT

	(SELECT [EmployerId]
		  ,[EmployeeSsn]
		  ,[EmployeeId]
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
	from [CPS_DW_STAGE].dbo.[BasIncomingEmployeeDemographic]
	WHERE  SOURCEMODIFIEDDATE < GETDATE() - 1
		AND SOURCEMODIFIEDDATE > ( CASE 
		WHEN  DATEPART("dw", GETDATE()) = 2 THEN GETDATE() - 4
		ELSE  GETDATE() - 2
		END )
	))
	INSERT INTO  cps_dw_stage.dbo.EEDemoComparePREV_Demographics
		([FINDICATOR]
		,[BasIncomingEmployeeDemographicId]
		,[EmployerId]
		,[EmployeeSsn]
		,[EmployeeId]
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
		,[SourceModifiedDate]
		,[DwSourceName]
		,[DwInsertDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwUpdateDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName])
	SELECT 
		'CURR' AS FINDICATOR
		,A.[BasIncomingEmployeeDemographicId]
		,A.[EmployerId]
		,A.[EmployeeSsn]
		,A.[EmployeeId]
		,A.[LastName]
		,A.[FirstName]
		,A.[MiddleNameOrInitial]
		,A.[Suffix]
		,A.[Birthdate]
		,A.[Gender]
		,A.[Address1]
		,A.[Address2]
		,A.[Address3]
		,A.[City]
		,A.[State]
		,A.[Postal]
		,A.[County]
		,A.[AddressEffectiveDate]
		,A.[PrimaryPhoneNumber]
		,A.[WorkPhone]
		,A.[MobilePhoneNumber]
		,A.[WorkEmailAddress]
		,A.[HomeEmailAddress]
		,A.[OriginalHireDate]
		,A.[LatestHireDate]
		,A.[EmploymentStatus]
		,A.[EmploymentStatusEffectiveDate]
		,A.[DeathDateAttribute]
		,A.[TerminationDateAttribute]
		,A.[BenefitsEligibilityDate]
		,A.[EmployerDepartmentReporting]
		,A.[ScheduledHours]
		,A.[ScheduledHoursEffectiveDate]
		,A.[BaseAnnualSalaryAcrFactor]
		,A.[AnnualCashHousingAllowanceAcrFactor]
		,A.[HomeProvidedAmountAcrFactor]
		,A.[AnnualCashUtilityAllowanceAcrFactor]
		,A.[TotalAcrSumOfThreeAbove]
		,A.[AcrEffectiveDate]
		,A.[JobTitleOrClass]
		,A.[JobTitleOrClassDescription]
		,A.[SalariedOrHourlyIndicator]
		,A.[SalariedOrHourlyIndicatorEffectiveDate]
		,A.[RosterNonRosterIndicator]
		,A.[RosteredOrCommissionedSocialSecurityIndicator]
		,A.[RosterNonRosterIndicatorEffectiveDate]
		,A.[Salutation]
		,A.[MaritalStatus]
		,A.[MaritalStatusEffectiveDate]
		,A.[LawsonEmployeeId]
		,A.[MissionaryTypeIndicator]
		,A.[MissionCountryCode]
		,A.[MissionaryTypeEffectiveDate]
		,A.[BilltoEmployerTaip]
		,A.[ChpCostAndBillingOverride]
		,A.[CdspCostAndBillingOverride]
		,A.[VoluntaryBenefitsCostAndBillingOverride]
		,A.[ChpCostAndBillngOverrideEndDate]
		,A.[CdspCostAndBillngOverrideEndDate]
		,A.[ChpCostAndBillingOverrideEmployerNumber]
		,A.[CdspCostAndBillingOverrideEmployerNumber]
		,A.[VoluntaryBenefitsCostandBillingOverrideEmployerNumber]
		,A.[VoluntaryBenefitsCostandBillngOverrideEndDate]
		,A.[CrpTraditionalRegularFullBasisIndicator]
		,A.[CrpTraditionalRegularFullBasisEffectiveDate]
		,A.[Extensiontype]
		,A.[ExtensionPaidThruDate]
		,A.[ExtensionStartDate]
		,A.[ExtensionEndDate]
		,A.[CpsPreviousEmployerNumber]
		,A.[SourceModifiedDate]
		,A.[DwSourceName]
		,A.[DwInsertDate]
		,A.[DwInsertUsername]
		,A.[DwInsertProcessName]
		,A.[DwUpdateDate]
		,A.[DwUpdateUsername]
		,A.[DwUpdateProcessName]
	FROM [CPS_DW_STAGE].dbo.[BasIncomingEmployeeDemographic] A
	JOIN RECTMP B
	ON  A.[EmployeeSsn] = B.[EmployeeSsn]
		  WHERE SOURCEMODIFIEDDATE > GETDATE() -1
		  and A.[EmployeeSsn] in (SELECT d.[EmployeeSsn]
					from [CPS_DW_STAGE].dbo.[BasIncomingEmployeeDemographic] d
					where SOURCEMODIFIEDDATE < GETDATE() -1
					AND SOURCEMODIFIEDDATE > ( CASE 
							WHEN  DATEPART("dw", GETDATE()) = 2 THEN GETDATE() - 4
							ELSE  GETDATE() - 2
							END )
							) 
			ORDER by A.[EmployeeSsn]

TRUNCATE TABLE [dbo].[EEDemoComparePREVresults_Demographics];

--[BenefitsEligibilityDate]
insert into cps_dw_stage.dbo.EEDemoComparePREVresults_Demographics
select 1 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
, cast('BenefitsEligibilityDate' as varchar(100)) as columnName
, cast(b.BenefitsEligibilityDate as varchar(100)) as 'CURR'
, cast(d.BenefitsEligibilityDate as varchar(100)) as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.BenefitsEligibilityDate != d.BenefitsEligibilityDate
	or d.BenefitsEligibilityDate is NULL
	or b.BenefitsEligibilityDate is NULL)
and (d.BenefitsEligibilityDate is not NULL
	or b.BenefitsEligibilityDate is not NULL);

--[EmployerDepartmentReporting]
insert into cps_dw_stage.dbo.EEDemoComparePREVresults_Demographics
select 2 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('EmployerDepartmentReporting' as varchar(100)) as columnName
, cast(b.EmployerDepartmentReporting as varchar(100))  as 'CURR'
, cast(d.EmployerDepartmentReporting as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.EmployerDepartmentReporting != d.EmployerDepartmentReporting
	or d.EmployerDepartmentReporting is NULL
	or b.EmployerDepartmentReporting is NULL)
and (b.EmployerDepartmentReporting is not NULL
	or d.EmployerDepartmentReporting is not NULL) ;

--[SalariedOrHourlyIndicator]
insert into cps_dw_stage.dbo.EEDemoComparePREVresults_Demographics
select 3 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('SalariedOrHourlyIndicator' as varchar(100)) as columnName
, cast(b.SalariedOrHourlyIndicator as varchar(100))  as 'CURR'
, cast(d.SalariedOrHourlyIndicator as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.SalariedOrHourlyIndicator != d.SalariedOrHourlyIndicator
or d.SalariedOrHourlyIndicator is NULL
or b.SalariedOrHourlyIndicator is NULL)
and (d.SalariedOrHourlyIndicator is not NULL
	or b.SalariedOrHourlyIndicator is not NULL);

--[MissionaryTypeIndicator]
insert into cps_dw_stage.dbo.EEDemoComparePREVresults_Demographics
select 4 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('MissionaryTypeIndicator' as varchar(100)) as columnName
, cast(b.MissionaryTypeIndicator as varchar(100))  as 'CURR'
, cast(d.MissionaryTypeIndicator as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.MissionaryTypeIndicator != d.MissionaryTypeIndicator
	or d.MissionaryTypeIndicator is NULL
	or b.MissionaryTypeIndicator is NULL)
and (d.MissionaryTypeIndicator is not NULL
	or b.MissionaryTypeIndicator is not NULL);

--[MissionCountryCode]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 5 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('MissionCountryCode' as varchar(100)) as columnName
, cast(b.MissionCountryCode as varchar(100))  as 'CURR'
, cast(d.MissionCountryCode as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.MissionCountryCode != d.MissionCountryCode
	or d.MissionCountryCode is NULL
	or b.MissionCountryCode is NULL)
and (d.MissionCountryCode is not NULL
	or b.MissionCountryCode is not NULL);

--[MissionaryTypeEffectiveDate]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 6 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('MissionaryTypeEffectiveDate' as varchar(100)) as columnName
, cast(b.MissionaryTypeEffectiveDate as varchar(100))  as 'CURR'
, cast(d.MissionaryTypeEffectiveDate as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.MissionaryTypeEffectiveDate != d.MissionaryTypeEffectiveDate
	or d.MissionaryTypeEffectiveDate is NULL
	or b.MissionaryTypeEffectiveDate is NULL)
and (d.MissionaryTypeEffectiveDate is not NULL
	or b.MissionaryTypeEffectiveDate is not NULL);

--[BilltoEmployerTaip]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 7 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('BilltoEmployerTaip' as varchar(100)) as columnName
, cast(b.BilltoEmployerTaip as varchar(100))  as 'CURR'
, cast(d.BilltoEmployerTaip as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.BilltoEmployerTaip != d.BilltoEmployerTaip
	or d.BilltoEmployerTaip is NULL
	or b.BilltoEmployerTaip is NULL)
and (d.BilltoEmployerTaip is not NULL
	or b.BilltoEmployerTaip is not NULL);

--[ChpCostAndBillingOverride]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 8 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('ChpCostAndBillingOverride' as varchar(100)) as columnName
, cast(b.ChpCostAndBillingOverride as varchar(100))  as 'CURR'
, cast(d.ChpCostAndBillingOverride as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.ChpCostAndBillingOverride != d.ChpCostAndBillingOverride
	or d.ChpCostAndBillingOverride is NULL
	or b.ChpCostAndBillingOverride is NULL)
and (d.ChpCostAndBillingOverride is not NULL
	or b.ChpCostAndBillingOverride is not NULL);

--[CdspCostAndBillingOverride]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 9 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('CdspCostAndBillingOverride' as varchar(100)) as columnName
, cast(b.CdspCostAndBillingOverride as varchar(100))  as 'CURR'
, cast(d.CdspCostAndBillingOverride as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.CdspCostAndBillingOverride != d.CdspCostAndBillingOverride
	or d.CdspCostAndBillingOverride is NULL
	or b.ChpCostAndBillingOverride is NULL)
and (d.CdspCostAndBillingOverride is not NULL
	or b.CdspCostAndBillingOverride is not NULL);

--[VoluntaryBenefitsCostAndBillingOverride]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 10 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('VoluntaryBenefitsCostAndBillingOverride' as varchar(100)) as columnName
, cast(b.VoluntaryBenefitsCostAndBillingOverride as varchar(100))  as 'CURR'
, cast(d.VoluntaryBenefitsCostAndBillingOverride as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.VoluntaryBenefitsCostAndBillingOverride != d.VoluntaryBenefitsCostAndBillingOverride
	or d.VoluntaryBenefitsCostAndBillingOverride is NULL
	or b.VoluntaryBenefitsCostAndBillingOverride is NULL)
and (d.VoluntaryBenefitsCostAndBillingOverride is not NULL
	or b.VoluntaryBenefitsCostAndBillingOverride is not NULL);

--[ChpCostAndBillngOverrideEndDate]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 11 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('ChpCostAndBillngOverrideEndDate' as varchar(100)) as columnName
, cast(b.ChpCostAndBillngOverrideEndDate as varchar(100))  as 'CURR'
, cast(d.ChpCostAndBillngOverrideEndDate as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.ChpCostAndBillngOverrideEndDate != d.ChpCostAndBillngOverrideEndDate
	or d.ChpCostAndBillngOverrideEndDate is NULL
	or b.ChpCostAndBillngOverrideEndDate is NULL)
and (d.ChpCostAndBillngOverrideEndDate is not NULL
	or b.ChpCostAndBillngOverrideEndDate is not NULL);

--[CdspCostAndBillngOverrideEndDate]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 12 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('CdspCostAndBillngOverrideEndDate' as varchar(100)) as columnName
, cast(b.CdspCostAndBillngOverrideEndDate as varchar(100))  as 'CURR'
, cast(d.CdspCostAndBillngOverrideEndDate as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.CdspCostAndBillngOverrideEndDate != d.CdspCostAndBillngOverrideEndDate
	or d.CdspCostAndBillngOverrideEndDate is NULL
	or b.CdspCostAndBillngOverrideEndDate is NULL)
and (d.CdspCostAndBillngOverrideEndDate is not NULL
	or b.CdspCostAndBillngOverrideEndDate is not NULL);

--[ChpCostAndBillingOverrideEmployerNumber]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 13 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('ChpCostAndBillingOverrideEmployerNumber' as varchar(100)) as columnName
, cast(b.ChpCostAndBillingOverrideEmployerNumber as varchar(100))  as 'CURR'
, cast(d.ChpCostAndBillingOverrideEmployerNumber as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.ChpCostAndBillingOverrideEmployerNumber != d.ChpCostAndBillingOverrideEmployerNumber
	or d.ChpCostAndBillingOverrideEmployerNumber is NULL
	or b.ChpCostAndBillingOverrideEmployerNumber is NULL)
and (d.ChpCostAndBillingOverrideEmployerNumber is not NULL
	or b.ChpCostAndBillingOverrideEmployerNumber is not NULL);

--[CdspCostAndBillingOverrideEmployerNumber] 
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 14 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('CdspCostAndBillingOverrideEmployerNumber' as varchar(100)) as columnName
, cast(b.CdspCostAndBillingOverrideEmployerNumber as varchar(100))  as 'CURR'
, cast(d.CdspCostAndBillingOverrideEmployerNumber as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.CdspCostAndBillingOverrideEmployerNumber != d.CdspCostAndBillingOverrideEmployerNumber
	or d.CdspCostAndBillingOverrideEmployerNumber is NULL
	or b.CdspCostAndBillingOverrideEmployerNumber is NULL)
and (d.CdspCostAndBillingOverrideEmployerNumber is not NULL
	or b.CdspCostAndBillingOverrideEmployerNumber is not NULL);

--[VoluntaryBenefitsCostandBillingOverrideEmployerNumber] 
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 15 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('VoluntaryBenefitsCostandBillingOverrideEmployerNumber' as varchar(100)) as columnName
, cast(b.VoluntaryBenefitsCostandBillingOverrideEmployerNumber as varchar(100))  as 'CURR'
, cast(d.VoluntaryBenefitsCostandBillingOverrideEmployerNumber as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.VoluntaryBenefitsCostandBillingOverrideEmployerNumber != d.VoluntaryBenefitsCostandBillingOverrideEmployerNumber
	or d.VoluntaryBenefitsCostandBillingOverrideEmployerNumber is NULL
	or b.VoluntaryBenefitsCostandBillingOverrideEmployerNumber is NULL)
and (d.VoluntaryBenefitsCostandBillingOverrideEmployerNumber is not NULL
	or b.VoluntaryBenefitsCostandBillingOverrideEmployerNumber is not NULL);

--[VoluntaryBenefitsCostandBillngOverrideEndDate]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 16 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('VoluntaryBenefitsCostandBillngOverrideEndDate' as varchar(100)) as columnName
, cast(b.VoluntaryBenefitsCostandBillngOverrideEndDate as varchar(100))  as 'CURR'
, cast(d.VoluntaryBenefitsCostandBillngOverrideEndDate as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.VoluntaryBenefitsCostandBillngOverrideEndDate != d.VoluntaryBenefitsCostandBillngOverrideEndDate
	or d.VoluntaryBenefitsCostandBillngOverrideEndDate is NULL
	or b.VoluntaryBenefitsCostandBillngOverrideEndDate is NULL)
and (d.VoluntaryBenefitsCostandBillngOverrideEndDate is not NULL
	or b.VoluntaryBenefitsCostandBillngOverrideEndDate is not NULL);
	
--[CrpTraditionalRegularFullBasisIndicator]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 17 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('CrpTraditionalRegularFullBasisIndicator' as varchar(100)) as columnName
, cast(b.CrpTraditionalRegularFullBasisIndicator as varchar(100))  as 'CURR'
, cast(d.CrpTraditionalRegularFullBasisIndicator as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.CrpTraditionalRegularFullBasisIndicator != d.CrpTraditionalRegularFullBasisIndicator
	or d.CrpTraditionalRegularFullBasisIndicator is NULL
	or b.CrpTraditionalRegularFullBasisIndicator is NULL)
and (d.CrpTraditionalRegularFullBasisIndicator is not NULL
	or b.CrpTraditionalRegularFullBasisIndicator is not NULL);
	
--[CrpTraditionalRegularFullBasisEffectiveDate]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 18 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('CrpTraditionalRegularFullBasisEffectiveDate' as varchar(100)) as columnName
, cast(b.CrpTraditionalRegularFullBasisEffectiveDate as varchar(100))  as 'CURR'
, cast(d.CrpTraditionalRegularFullBasisEffectiveDate as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.CrpTraditionalRegularFullBasisEffectiveDate != d.CrpTraditionalRegularFullBasisEffectiveDate
	or d.CrpTraditionalRegularFullBasisEffectiveDate is NULL
	or b.CrpTraditionalRegularFullBasisEffectiveDate is NULL)
and (d.CrpTraditionalRegularFullBasisEffectiveDate is not NULL
	or b.CrpTraditionalRegularFullBasisEffectiveDate is not NULL);
	
--[Extensiontype]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 19 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('Extensiontype' as varchar(100)) as columnName
, cast(b.Extensiontype as varchar(100))  as 'CURR'
, cast(d.Extensiontype as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.Extensiontype != d.Extensiontype
	or b.Extensiontype is NULL
	or d.Extensiontype is NULL)
and (d.Extensiontype is not NULL
	or b.Extensiontype is not NULL);

--[ExtensionPaidThruDate]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 20 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('ExtensionPaidThruDate' as varchar(100)) as columnName
, cast(b.ExtensionPaidThruDate as varchar(100))  as 'CURR'
, cast(d.ExtensionPaidThruDate as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.ExtensionPaidThruDate != d.ExtensionPaidThruDate
or b.ExtensionPaidThruDate is NULL
	or d.ExtensionPaidThruDate is NULL)
and (d.ExtensionPaidThruDate is not NULL
	or b.ExtensionPaidThruDate is not NULL);

--[ExtensionStartDate]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 21 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('ExtensionStartDate' as varchar(100)) as columnName
, cast(b.ExtensionStartDate as varchar(100))  as 'CURR'
, cast(d.ExtensionStartDate as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.ExtensionStartDate != d.ExtensionStartDate
	or b.ExtensionStartDate is NULL
	or d.ExtensionStartDate is NULL)
and (d.ExtensionStartDate is not NULL
	or b.ExtensionStartDate is not NULL);

--[ExtensionEndDate]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 22 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('ExtensionEndDate' as varchar(100)) as columnName
, cast(b.ExtensionEndDate as varchar(100))  as 'CURR'
, cast(d.ExtensionEndDate as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.ExtensionEndDate != d.ExtensionStartDate
	or b.ExtensionEndDate is NULL
	or d.ExtensionEndDate is NULL)
and (d.ExtensionEndDate is not NULL
	or b.ExtensionEndDate is not NULL);
	
--[CpsPreviousEmployerNumber]
insert into cps_dw_stage.dbo.EEDemoComparePREVRESULTS_Demographics
select 23 as column_seq, b.EmployerID
, b.employeessn , d.employeeid, (b.LastName)
,cast('CpsPreviousEmployerNumber' as varchar(100)) as columnName
, cast(b.CpsPreviousEmployerNumber as varchar(100))  as 'CURR'
, cast(d.CpsPreviousEmployerNumber as varchar(100))  as 'PREV'
, b.[DwUpdateDate]
from cps_dw_stage.dbo.EEDemoComparePREV_Demographics b
join cps_dw_stage.dbo.EEDemoComparePREV_Demographics d 
	on b.employeessn = d.employeessn
where b.findicator = 'CURR'
and b.FINDICATOR != d.FINDICATOR
and (b.CpsPreviousEmployerNumber != d.CpsPreviousEmployerNumber
	or b.CpsPreviousEmployerNumber is NULL
	or d.CpsPreviousEmployerNumber is NULL)
and (d.CpsPreviousEmployerNumber is not NULL
	or b.CpsPreviousEmployerNumber is not NULL);


SELECT  *
  FROM [CPS_DW_STAGE].[dbo].[EEDemoComparePREVRESULTS_Demographics]
    order by [employeessn],[columnName]

end


GO
