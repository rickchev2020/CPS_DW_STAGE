SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[spMergeEmployerContact] AS BEGIN

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()));
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())));
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime);
	declare @RunTime datetime = GETDATE();
	declare @ProcessName varchar(100) = 'spMergeEmployerContact';
	declare @ExecutingUser varchar(100) = SUSER_NAME();
	
	MERGE INTO [CPS_DW].[dbo].[EmployerContact] AS tgt -- target table
	USING (
		SELECT DISTINCT
			acc.[Lawson_ID__c] AS EmployerNumber
			--, dem.LawsonEmployeeId as MemberNumber
			, con.[FirstName]
			, con.[LastName]
			, IIF(aff.[Persona__c] <> '', aff.[Persona__c], NULL) AS Persona
			, IIF(aff.[Portal_Role__c] <> '', aff.[Portal_Role__c], NULL) AS PortalRole
			, IIF(aff.[npe5__Primary__c] = 'True', 'Y', 'N') AS PrimaryContactInd
			, CASE
				WHEN con.[npe01__PreferredPhone__c] = 'Home'
					AND con.[HomePhone] <> ''
					AND con.[HomePhone] IS NOT NULL
				THEN con.[HomePhone]
				WHEN con.[npe01__PreferredPhone__c] = 'Work'
					AND con.[npe01__WorkPhone__c] <> ''
					AND con.[npe01__WorkPhone__c] IS NOT NULL
				THEN con.[npe01__WorkPhone__c]
				WHEN con.[npe01__PreferredPhone__c] = 'Mobile'
					AND con.[MobilePhone] <> ''
					AND con.[MobilePhone] IS NOT NULL
				THEN con.[OtherPhone]
				WHEN con.[npe01__PreferredPhone__c] = 'Other'
					AND con.[OtherPhone] <> ''
					AND con.[OtherPhone] IS NOT NULL
				THEN con.[OtherPhone]
				ELSE NULL
				END AS [PhoneNumber]
			, CASE
				WHEN con.[npe01__Preferred_Email__c] = 'Personal'
					AND con.[npe01__HomeEmail__c] <> ''
					AND con.[npe01__HomeEmail__c] IS NOT NULL
				THEN con.[npe01__HomeEmail__c]
				WHEN con.[npe01__Preferred_Email__c] = 'Work'
					AND con.[npe01__WorkEmail__c] <> ''
					AND con.[npe01__WorkEmail__c] IS NOT NULL
				THEN con.[npe01__WorkEmail__c]
				WHEN con.[npe01__Preferred_Email__c] = 'Home'
					AND con.[npe01__HomeEmail__c] <> ''
					AND con.[npe01__HomeEmail__c] IS NOT NULL
				THEN con.[npe01__HomeEmail__c]
				WHEN con.[npe01__Preferred_Email__c] = 'Alternate'
					AND con.[npe01__AlternateEmail__c] <> ''
					AND con.[npe01__AlternateEmail__c] IS NOT NULL
				THEN con.[npe01__AlternateEmail__c]
				ELSE NULL
				END AS [Email]
		FROM [CPS_DW_STAGE].[dbo].[CrmSalesforceContact] con
		JOIN [CPS_DW_STAGE].[dbo].[CrmSalesforceAffiliation] aff
			ON aff.[npe5__Contact__c] = con.id
				AND aff.[IsDeleted] = 'False'
				AND aff.[npe5__Status__c] = 'Current'
		JOIN [CPS_DW_STAGE].[dbo].[CrmSalesforceAccount] acc
			ON aff.[npe5__Organization__c] = acc.[id]
				AND acc.[Lawson_ID__c] IS NOT NULL
				AND acc.[Lawson_ID__c] <> ''
	) AS src
	ON ISNULL(src.[EmployerNumber], '') = ISNULL(tgt.[EmployerNumber],'')
		AND ISNULL(src.[FirstName], '') = ISNULL(tgt.[FirstName],'')
		AND ISNULL(src.[LastName], '') = ISNULL(tgt.[LastName],'')
		AND ISNULL(src.[Persona], '') = ISNULL(tgt.[Persona],'')
		AND ISNULL(src.[PortalRole], '') = ISNULL(tgt.[PortalRole],'')
		AND ISNULL(src.[PrimaryContactInd], '') = ISNULL(tgt.[PrimaryContactInd],'')
		AND ISNULL(src.[PhoneNumber], '') = ISNULL(tgt.[PhoneNumber],'')
		AND ISNULL(src.[Email], '') = ISNULL(tgt.[Email],'')
		
	-- Mark deleted rows as not current
	WHEN NOT MATCHED BY SOURCE
	THEN DELETE

	-- Insert new rows
	WHEN NOT MATCHED 
	THEN INSERT (
		[EmployerNumber]
		,[FirstName]
		,[LastName]
		,[Persona]
		,[PortalRole]
		,[PrimaryContactInd]
		,[PhoneNumber]
		,[Email]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwInsertDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
		,[DwUpdateDate]
	) VALUES(
		src.[EmployerNumber]
		,src.[FirstName]
		,src.[LastName]
		,src.[Persona]
		,src.[PortalRole]
		,src.[PrimaryContactInd]
		,src.[PhoneNumber]
		,src.[Email]
		,@ExecutingUser -- DwInsertUsername
		,@ProcessName -- DwInsertProcessName
		,@RunTime -- DwInsertDate
		,@ExecutingUser -- DwUpdateUsername
		,@ProcessName -- DwUpdateProcessName
		,@RunTime -- DwUpdateDate
	)

	-- Salesforce data is awful so everything is a key
	--when matched
	--AND ( 
	--	-- Find matched records to update
	--	-- Dont include the keys or the created date
	--	isnull(src.[PortalRole], '') <> isnull(tgt.[PortalRole],'')
	--)
	--then
	--update -- Update records that have a new updated record
	--	set tgt.[PortalRole] = src.[PortalRole]
	--	, tgt.DwUpdateUsername = @ExecutingUser
	--	, tgt.DwUpdateProcessName = @ProcessName
	--	, tgt.DwUpdateDate = @RunTime
	;
END
GO
