CREATE TABLE [dbo].[CrmSalesforceAccount_old]
(
[CrmSalesforceAccountId] [int] NOT NULL IDENTITY(1, 1),
[Accident_Insurance_Eligible__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Manager__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Account_Manager_Email_MKTO__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountNumber] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountSource] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Acct_Sync_to_MKTO__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACR_Report__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACRDateComplete__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ADD_Eligible__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AddressCounty__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Annual_Contribution__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AnnualRevenue] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AO_Class__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AO_Last_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AO_Original_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Assoc_Parish__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Auto_Enroll_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Auto_Escalate_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Auto_Escalation_Election__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoEnroll_Percentage__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoEnroll_Plan_Option__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoEscalate_Maximum__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoEscalate_Percentage__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoSave_Annual_Escalation_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Autosave_Election__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoSave_Eligibility_Rule__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoSave_New_Hire_Waiting_Period__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoSave_Opt_Out_Rule__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AutoSave_Participation_Rule__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Billing_Status__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Billing_Unit__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingCity] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingCountry] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingGeocodeAccuracy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingLatitude] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingLongitude] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingPostalCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingState] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingStreet] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingStreet2__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[BillingStreet3__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Broker_Managed__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Category__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Category_of_Actual_Participation__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CDSP__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CDSP_Count__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CDSP_Count_Legacy__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CDSP_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CDSP_End_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_Appointment_Made__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_Carrier_Eligibility__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_Count__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_Count_Legacy__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_DEN_Hours__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_End_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_Establishment_Unit__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_Hours__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_MED_Hours__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_Next_Elected_Options__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_Participation__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_Premium_Share__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_Rating_Type__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CHP_VIS_Hours__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Consultant_Is_Primary__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedById] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Critical_Illness_Eligible__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP_Acctount_Option_Eligibility_Factor__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP_Count__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP_Count_Legacy__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP_End_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP_Waiting_Period__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRSP__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRSP_Count__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRSP_Count_Legacy__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRSP_Current_Remits__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRSP_Eligibile__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRSP_Match_Notes__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRSP_PT__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRSP_Type_of_Match__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Current_Balance__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Days_Outstanding__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[District__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EBSO_Setup__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EDF__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EDF_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Education_Team_Notes__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Effective_Date_Match_Election__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Election_Change_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Election_Change_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Election_Change_Reason__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Eligible_for_CRSP__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Eligible_for_CRSP_Legacy__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Eligible_Opt_Out__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Eligible_Waiting_Period__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employer_Allows_CPS_Access_to_Paychex_Da__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employer_CHP_Election__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employer_Match_Amount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employer_Match_Percent__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Employer_Registered_in_Hub__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Enrolled_In_Paychex__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Family__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Family_Infor__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Federal_EIN__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FTE_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Growth_Team_Private_Note__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Health_Plan_Options__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Id] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Industry] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ineligible_Opt_Out__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jigsaw] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JigsawCompanyId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Payment_Amount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Last_Payment_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastActivityDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedById] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastReferencedDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastViewedDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson_ER_Type__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson_ER_Type_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson_ID__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Level__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Limited_Adoption_Indicator__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Main_Parish__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Marketing_Team_Private_Note__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MasterRecordId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Multi_Parish__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Next_Elected_Dental_Unbundled__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Next_Elected_Vision_Unbundled__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Non_Exempt__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__FirstDonationDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__LastDonationDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__LifetimeDonationHistory_Amount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__LifetimeDonationHistory_Number__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__One2OneContact__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__SYSTEM_AccountType__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__SYSTEMIsIndividual__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__AverageAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Best_Gift_Year__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Best_Gift_Year_Total__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__FirstCloseDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Formal_Greeting__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__HouseholdPhone__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Informal_Greeting__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LargestAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastCloseDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastMembershipAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastMembershipDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastMembershipLevel__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastMembershipOrigin__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastOppAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__MembershipEndDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__MembershipJoinDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__NumberOfClosedOpps__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__NumberOfMembershipOpps__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppAmount2YearsAgo__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppAmountLastNDays__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppAmountLastYear__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppAmountThisYear__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppsClosed2YearsAgo__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppsClosedLastNDays__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppsClosedLastYear__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppsClosedThisYear__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__SmallestAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__SYSTEM_CUSTOM_NAMING__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__TotalMembershipOppAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__TotalOppAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Batch__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Funding_Focus__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Grantmaker__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Matching_Gift_Administrator_Name__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Matching_Gift_Amount_Max__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Matching_Gift_Amount_Min__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Matching_Gift_Annual_Employee_Max__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Matching_Gift_Comments__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Matching_Gift_Company__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Matching_Gift_Email__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Matching_Gift_Info_Updated__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Matching_Gift_Percent__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Matching_Gift_Phone__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Matching_Gift_Request_Deadline__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Membership_Span__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Membership_Status__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Number_of_Household_Members__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NumberOfEmployees] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Operations_Team_Private_Note__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Options__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Owner_Full_Name__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Ownership] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Package__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ParentId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Past_Due_Balance__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Paychex_Account_Number__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Paychex_Alternate_Account_Number__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Paychex_Participant__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Paychex_Reporting_CRSP_to_EBSO__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Paychex_Reporting_CRSP_to_EBSO_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Payment_Plan__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Payroll_Cycle__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Pending_Status__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Percent_in_CHP__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Percent_in_CRSP__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhotoUrl] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Plan_Year__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Potential_Competitors__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Previous_Level__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Primary_R_S_Number__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Probationary_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Probationary_Period__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA_DEP__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA_FSA__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA_Group_Number__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA_HRA__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA_HSA__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA_Other__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA_Special__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA_Start_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA_WRAP__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[QCCO_Indicator__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[R_S_Employer_Type__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rating] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Reason_will_not_use_portal__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[RecordTypeId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Regional_Manager__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Risk_Level__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[School_Grade_Range__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Secondary_R_S_Number__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SEE_Eligible__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SEE_Reason__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[See_Status__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Self__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Self_Child__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Self_Child_Infor__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Self_Infor__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Self_Spouse__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Self_Spouse_Infor__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingCity] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingCountry] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingGeocodeAccuracy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingLatitude] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingLongitude] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingPostalCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingState] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ShippingStreet] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sic] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SicDesc] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Site] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Size__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SLXAccountID__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Specialist_Is_Primary__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Status_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Supp_Life_Billing__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Supplemental_Life_Eligible__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemModstamp] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[TickerSymbol] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Toll_Free__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Travel__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Type] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unsubscribed__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Up_to_Max_Amount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Up_to_Max_Percent__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Website] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Wellness_Employer__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Wellness_Incentive_Taxation__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SourceModifiedDate] [date] NULL,
[DwSourceName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertDate] [datetime] NOT NULL,
[DwInsertUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwInsertProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateDate] [datetime] NOT NULL,
[DwUpdateUsername] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DwUpdateProcessName] [varchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Employer_Election_Period__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HR__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Member_Portal_Experience__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Open_Enrollment_Period__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Payroll_Provider__c] [nvarchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
GO