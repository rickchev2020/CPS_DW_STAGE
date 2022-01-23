CREATE TABLE [dbo].[CrmSalesforceContact]
(
[CrmSalesforceContactId] [int] NOT NULL IDENTITY(1, 1),
[Accident_Insurance__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Accidental_Death_Dismemberment__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AccountId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ACR_Salary_Band__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Age__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Age_mkto__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssistantName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[AssistantPhone] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Associated_ER_ID__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Basic_Life__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Best_Time_to_Contact__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Birthdate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CDSP_Enrolled_Plans__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Change_in_Enrollment__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Change_in_Enrollment_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Child_Life__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Contact_Type__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedById] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CreatedDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Critical_Illness__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRP_Enrollment__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[CRSP_Participant__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Dental_Option_Enrolled__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Department] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Description] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Disability_Claim__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Disability_Claim_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[DoNotCall] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Education_Team_Notes__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Email] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailBouncedDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[EmailBouncedReason] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Fax] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[FirstName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Full_Name__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Gender__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Growth_Team_Notes__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__First_Volunteer_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Last_Volunteer_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Unique_Volunteer_Count__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Auto_Reminder_Email_Opt_Out__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Availability__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Hours__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Last_Web_Signup_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Manager_Notes__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Notes__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Organization__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Skills__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[GW_Volunteers__Volunteer_Status__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HasOptedOutOfEmail] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HasOptedOutOfFax] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Health_Claim__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Health_Claim_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Health_Plan_Code__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[HomePhone] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Id] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Initiate_Retirement_on_RC__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Initiate_Retirement_on_RC_Effective_D__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsDeleted] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[IsEmailBounced] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Jigsaw] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[JigsawContactId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Job_Code__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Job_Code_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastActivityDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastCURequestDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastCUUpdateDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedById] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastModifiedDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastReferencedDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LastViewedDate] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson_ID__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Lawson_Status__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[LeadSource] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Legacy_Contact_ID__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingCity] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingCountry] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingGeocodeAccuracy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingLatitude] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingLongitude] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingPostalCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingState] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MailingStreet] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Marital_Status__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Marketing_ID__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Marketing_Team_Private_Notes__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MasterRecordId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Medical_Enrollment__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MiddleName] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Add_to_Marketo_Campaign__c] [varchar] (max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__HideDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Last_Interesting_Moment__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Last_Interesting_Moment_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Last_Interesting_Moment_Desc__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Last_Interesting_Moment_Source__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Last_Interesting_Moment_Type__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Mkto_Lead_Score__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Priority__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Relative_Score__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Relative_Score_Value__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Sales_Insight__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Urgency__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__Urgency_Value__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto_si__View_in_Marketo__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Acquisition_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Acquisition_Program__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Acquisition_Program_Id__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Behavior_Score__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Demographic_Score__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Form_Comments__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Inferred_City__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Inferred_Company__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Inferred_Country__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Inferred_Metropolitan_Area__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Inferred_Phone_Area_Code__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Inferred_Postal_Code__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Inferred_State_Region__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Lead_Score__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Original_Referrer__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Original_Search_Engine__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Original_Search_Phrase__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Original_Source_Info__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[mkto71_Original_Source_Type__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[MobilePhone] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Name] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__AlternateEmail__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Home_Address__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__HomeEmail__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Last_Donation_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Lifetime_Giving_History_Amount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Organization_Type__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Other_Address__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Preferred_Email__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__PreferredPhone__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Primary_Address_Type__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Private__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Secondary_Address_Type__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__SystemAccountProcessor__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__SystemIsIndividual__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Type_of_Account__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__Work_Address__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__WorkEmail__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npe01__WorkPhone__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__AverageAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Best_Gift_Year__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Best_Gift_Year_Total__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__FirstCloseDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Formula_HouseholdMailingAddress__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Formula_HouseholdPhone__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Household__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Household_Naming_Order__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LargestAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastCloseDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastCloseDateHH__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastMembershipAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastMembershipDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastMembershipLevel__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastMembershipOrigin__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__LastOppAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__MembershipEndDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__MembershipJoinDate__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Naming_Exclusions__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__NumberOfClosedOpps__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__NumberOfMembershipOpps__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppAmount2YearsAgo__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppAmountLastNDays__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppAmountLastYear__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppAmountLastYearHH__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppAmountThisYear__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppAmountThisYearHH__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppsClosed2YearsAgo__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppsClosedLastNDays__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppsClosedLastYear__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__OppsClosedThisYear__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__SmallestAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Soft_Credit_Last_Year__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Soft_Credit_This_Year__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Soft_Credit_Total__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Soft_Credit_Two_Years_Ago__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__SystemHouseholdProcessor__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__Total_Household_Gifts__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__TotalMembershipOppAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npo02__TotalOppAmount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[NPS_score__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Address_Verification_Status__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Batch__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Current_Address__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Deceased__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Do_Not_Contact__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Exclude_from_Household_Formal_Greeting__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Exclude_from_Household_Informal_Greeting__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Exclude_from_Household_Name__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__First_Soft_Credit_Amount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__First_Soft_Credit_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__HHId__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__is_Address_Override__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Largest_Soft_Credit_Amount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Largest_Soft_Credit_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Last_Soft_Credit_Amount__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Last_Soft_Credit_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Number_of_Soft_Credits__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Number_of_Soft_Credits_Last_N_Days__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Number_of_Soft_Credits_Last_Year__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Number_of_Soft_Credits_This_Year__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Number_of_Soft_Credits_Two_Years_Ago__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Primary_Affiliation__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Primary_Contact__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[npsp__Soft_Credit_Last_N_Days__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Operations_Team_Notes__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherCity] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherCountry] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherGeocodeAccuracy] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherLatitude] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherLongitude] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherPhone] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherPostalCode] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherState] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OtherStreet] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[OwnerId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Persona__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Phone] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PhotoUrl] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Portal_Registered__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Portal_Registered_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Portal_Role__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Preferred_Name__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Prescription__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Product_Interested_In__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[PSA__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rate_Request_Notes__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[ReportsToId] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Rostered_Status__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Sales_Status__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Salutation] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SLXContactId__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Spouse_Life__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Suffix] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Supplemental_Life__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survivor_Claim__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Survivor_Claim_Effective_Date__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[SystemModstamp] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Title] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Travel_Insurance__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Unsubscribed__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Vision_Option_Enrolled__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Wellness_Champion__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X403b_Details__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X403b_Level__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[X403b_Participant__c] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
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
ALTER TABLE [dbo].[CrmSalesforceContact] ADD CONSTRAINT [PK__CrmSales__ABDB776CB096DBB8] PRIMARY KEY CLUSTERED ([CrmSalesforceContactId]) WITH (FILLFACTOR=90) ON [PRIMARY]
GO