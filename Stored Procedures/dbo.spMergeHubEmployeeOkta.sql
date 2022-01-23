SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[spMergeHubEmployeeOkta] AS BEGIN

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'spMergeBasCrpEligibilityFeed'
	declare @ExecutingUser varchar(100) = SUSER_NAME()
	
	-- merge on LastName, SSN, DOB
	MERGE INTO [CPS_DW].[Hub].[Employee] AS tgt -- target table
	USING (
		SELECT [EmployeeOktaId]
			  ,[EmployeeNumber]
			  ,[LastName]
			  ,[Last4Ssn]
			  ,[Birthdate]
			  ,[OktaEmail]
			  ,[OktaRegisteredDate]
			  ,[DwSourceName]
			  ,[DwInsertDate]
			  ,[DwInsertUsername]
			  ,[DwInsertProcessName]
			  ,[DwUpdateDate]
			  ,[DwUpdateUsername]
			  ,[DwUpdateProcessName]
		  FROM CPS_DW_STAGE.[hub].[EmployeeOkta]
	) AS src
	ON tgt.[LastName] = src.[LastName]
		AND tgt.[Last4Ssn] = src.[Last4Ssn]
		AND tgt.[Birthdate] = src.[Birthdate]

	WHEN MATCHED
	AND ( 
		-- Find matched records to update
		-- Dont include the keys or the created date
		ISNULL(src.[OktaEmail], '') <> ISNULL(tgt.[OktaEmail],'')
		OR ISNULL(src.[OktaRegisteredDate], '') <> ISNULL(tgt.[OktaRegisteredDate],'')
	)
	THEN
	UPDATE -- Update records that have a new updated record
		SET tgt.[OktaEmail] = src.[OktaEmail]
		, tgt.[OktaRegisteredDate] = src.[OktaRegisteredDate]
	;

	-- merge on EmployeeNumber
	MERGE INTO [CPS_DW].[Hub].[Employee] AS tgt -- target table
	USING (
		SELECT [EmployeeOktaId]
			  ,[EmployeeNumber]
			  ,[LastName]
			  ,[Last4Ssn]
			  ,[Birthdate]
			  ,[OktaEmail]
			  ,[OktaRegisteredDate]
			  ,[DwSourceName]
			  ,[DwInsertDate]
			  ,[DwInsertUsername]
			  ,[DwInsertProcessName]
			  ,[DwUpdateDate]
			  ,[DwUpdateUsername]
			  ,[DwUpdateProcessName]
		  FROM CPS_DW_STAGE.[hub].[EmployeeOkta]
	) AS src
	ON tgt.[EmployeeNumber] = src.[EmployeeNumber]

	WHEN MATCHED
	AND ( 
		-- Find matched records to update
		-- Dont include the keys or the created date
		ISNULL(src.[OktaEmail], '') <> ISNULL(tgt.[OktaEmail],'')
		OR ISNULL(src.[OktaRegisteredDate], '') <> ISNULL(tgt.[OktaRegisteredDate],'')
	)
	THEN
	UPDATE -- Update records that have a new updated record
		SET tgt.[OktaEmail] = src.[OktaEmail]
		, tgt.[OktaRegisteredDate] = src.[OktaRegisteredDate]
	;

END
GO
