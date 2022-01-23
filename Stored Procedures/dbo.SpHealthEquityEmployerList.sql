SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE PROCEDURE [dbo].[SpHealthEquityEmployerList] AS 
BEGIN
WITH PsaContact AS (
SELECT DISTINCT
			ROW_NUMBER() OVER (PARTITION BY acc.[Lawson_ID__c] 
				ORDER BY CASE WHEN aff.[Persona__c] LIKE '%PSA%' THEN 0 ELSE 1 END
			        , CASE WHEN AFF.[Portal_Role__c] = 'Plan Administrator' THEN 0 ELSE 1 END  
					, CASE WHEN aff.[npe5__Primary__c] = 'True' THEN 0 ELSE 1 END
					, aff.LastModifiedDate DESC
					, con.LastModifiedDate DESC
					) AS ContactRank,
			-- using row_number instead of rank so that there is never more than one
			-- contact selected per employer
			 acc.[Lawson_ID__c] AS EmployerNumber,
			 con.[FirstName],
			 con.[LastName],
       IIF(aff.[Persona__c] <> '', aff.[Persona__c], NULL) AS Persona,
       IIF(aff.[Portal_Role__c] <> '', aff.[Portal_Role__c], NULL) AS PortalRole,
       IIF(aff.[Persona__c] LIKE '%PSA%', -- special PSA logic	Will find 1st Non-Null phone number in the order shown	
	                                      --  ISNumeric and Stuff statements verify legitimate Phone Numbers in Proper Format
           COALESCE(                    
					IIF(
					     ISNUMERIC(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[OtherPhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10)) = 1,
					     STUFF(STUFF(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[OtherPhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10), 4, 0, '-'), 8, 0, '-'),
				         NULL
					    ),	
					IIF( 
					     ISNUMERIC(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[Phone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10)) = 1,
					     STUFF(STUFF(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[Phone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10), 4, 0, '-'), 8, 0, '-'),
					     NULL
					    ),  					
					IIF( 
					     ISNUMERIC(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[npe01__WorkPhone__c])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10)) = 1,
					     STUFF(STUFF(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[npe01__WorkPhone__c])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10), 4, 0, '-'), 8, 0, '-'),
					     NULL
					    ),   
					IIF(
					     ISNUMERIC(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[HomePhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10)) = 1,
					     STUFF(STUFF(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[HomePhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10), 4, 0, '-'), 8, 0, '-'),
					     NULL
					    ),   
					IIF(
					     ISNUMERIC(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[MobilePhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10)) = 1,
					     STUFF(STUFF(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[MobilePhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10), 4, 0, '-'), 8, 0, '-'),
					     NULL
					    ),  						
                    '555-555-5555'
					),
           CASE    --  Case Statement used when no PSA Contact Noted
               WHEN con.[npe01__PreferredPhone__c] = 'Home'
                    AND con.[HomePhone] <> ''
                    AND con.[HomePhone] IS NOT NULL
					AND ISNUMERIC(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[HomePhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10)) = 1
					THEN
					STUFF(STUFF(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[HomePhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10), 4, 0, '-'), 8, 0, '-')				                      
               WHEN con.[npe01__PreferredPhone__c] = 'Work'
                    AND con.[npe01__WorkPhone__c] <> ''
                    AND con.[npe01__WorkPhone__c] IS NOT NULL
					AND ISNUMERIC(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[npe01__WorkPhone__c])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10)) = 1
					THEN
					STUFF(STUFF(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[npe01__WorkPhone__c])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10), 4, 0, '-'), 8, 0, '-')
               WHEN con.[npe01__PreferredPhone__c] = 'Mobile'
                    AND con.[MobilePhone] <> ''
                    AND con.[MobilePhone] IS NOT NULL 
					AND ISNUMERIC(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[MobilePhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10)) = 1
					THEN
					STUFF(STUFF(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[MobilePhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10), 4, 0, '-'), 8, 0, '-')
               WHEN con.[npe01__PreferredPhone__c] = 'Other'
                    AND con.[OtherPhone] <> ''
                    AND con.[OtherPhone] IS NOT NULL 
					AND ISNUMERIC(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[OtherPhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10)) = 1
					THEN
					STUFF(STUFF(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(con.[OtherPhone])), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10), 4, 0, '-'), 8, 0, '-')
               ELSE
                   '555-555-5555'

               END) AS [PhoneNumber],

       CASE
           WHEN aff.[Persona__c] LIKE '%PSA%' -- special PSA logic
                AND con.[npe01__AlternateEmail__c] <> ''
                AND con.[npe01__AlternateEmail__c] IS NOT NULL THEN
               con.[npe01__AlternateEmail__c]
           WHEN con.[npe01__Preferred_Email__c] = 'Personal'
                AND con.[npe01__HomeEmail__c] <> ''
                AND con.[npe01__HomeEmail__c] IS NOT NULL THEN
               con.[npe01__HomeEmail__c]
           WHEN con.[npe01__Preferred_Email__c] = 'Work'
                AND con.[npe01__WorkEmail__c] <> ''
                AND con.[npe01__WorkEmail__c] IS NOT NULL THEN
               con.[npe01__WorkEmail__c]
           WHEN con.[npe01__Preferred_Email__c] = 'Home'
                AND con.[npe01__HomeEmail__c] <> ''
                AND con.[npe01__HomeEmail__c] IS NOT NULL THEN
               con.[npe01__HomeEmail__c]
           WHEN con.[npe01__Preferred_Email__c] = 'Alternate'
                AND con.[npe01__AlternateEmail__c] <> ''
                AND con.[npe01__AlternateEmail__c] IS NOT NULL THEN
               con.[npe01__AlternateEmail__c]
           ELSE
               NULL
       END AS [Email],
       con.Title,
       aff.[npe5__Primary__c]
		FROM [CPS_DW_STAGE].[dbo].[CrmSalesforceContact] con
		JOIN [CPS_DW_STAGE].[dbo].[CrmSalesforceAffiliation] aff
			ON aff.[npe5__Contact__c] = con.id
				AND aff.[IsDeleted] = 'False'
				AND aff.[npe5__Status__c] = 'Current'
		JOIN [CPS_DW_STAGE].[dbo].[CrmSalesforceAccount] acc
			ON aff.[npe5__Organization__c] = acc.[id]
				AND acc.[Lawson_ID__c] IS NOT NULL
				AND acc.[Lawson_ID__c] <> ''
				AND (aff.[Persona__c] LIKE '%PSA%'
				    OR aff.[Portal_Role__c] = 'Plan Administrator'
					OR aff.[npe5__Primary__c] = 'True')
		WHERE con.IsDeleted = 'False'  
)
SELECT
	'E' AS RecordType
	--,bae.PSA
	, LTRIM(RTRIM(prs.PROCESS_LEVEL)) AS EmployerExternalObjectId
	, NULL AS EmployerConsortiumId 
	, LTRIM(RTRIM(bae.FederalEIN)) AS TaxId
	, LTRIM(RTRIM(prs.[NAME])) AS EmployerName
	, LTRIM(RTRIM(prs.ADDR1)) AS Street1
	, LTRIM(RTRIM(prs.ADDR2)) AS Street2
	, LTRIM(RTRIM(prs.CITY)) AS City
	, LTRIM(RTRIM(prs.[STATE])) AS STATE
	, LTRIM(RTRIM(prs.ZIP)) AS Zip
	, CASE
		WHEN ISNUMERIC(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(psa.PhoneNumber)), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10)) = 1
		THEN STUFF(STUFF(LEFT(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(LTRIM(RTRIM(psa.PhoneNumber)), '-', ''), '(', ''), ')', ''), ' ', ''), '.', ''), 10), 4, 0, '-'), 8, 0, '-')
		ELSE NULL
		END AS PhoneNumber
	, NULL AS Fax
	, LTRIM(RTRIM(psa.Email)) AS Email
	, LTRIM(RTRIM(psa.FirstName + ' ' + psa.LastName)) AS ContactName
	, NULL AS ContactTitle
	--, LTRIM(RTRIM(psa.Title)) AS ContactTitle
--INTO ##PsaTest
FROM [CPS_DW].dbo.DIM_PRSYSTEM prs
JOIN [CPS_DW].dbo.BasEmployerElection bae
	ON bae.ERNumber = prs.PROCESS_LEVEL
	    --AND bae.PSA IS NOT NULL  -- Edited by next line for dbo#2897 on 11/4/2021 by M.D.
		AND bae.PSA LIKE '%H-%' -- Edited to only include employers with HealthEquity PSAs
INNER JOIN PsaContact psa --Changed from LEFT JOIN PsaContact psa to remove employers without a PSA Contact
	ON psa.EmployerNumber = prs.PROCESS_LEVEL
		AND psa.ContactRank = 1
WHERE prs.ETLRowIsCurrent = 1 
ORDER BY prs.PROCESS_LEVEL

END;
GO
