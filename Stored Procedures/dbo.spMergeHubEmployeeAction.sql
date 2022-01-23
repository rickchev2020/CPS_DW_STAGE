SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[spMergeHubEmployeeAction] AS BEGIN

	DECLARE @TodayDate DATETIME = DATEADD(dd, 1, DATEDIFF(dd, 1, GETDATE()))
	DECLARE @YesterdayDate DATETIME = DATEADD(ms, -3, DATEADD(dd, 1, DATEDIFF(dd, 1, GETDATE())))
	DECLARE @MaxEndDate DATETIME = CAST('9999-12-31 23:59:59.997' AS DATETIME)
	DECLARE @RunTime DATETIME = GETDATE()
	DECLARE @ProcessName VARCHAR(100) = 'spMergeHubEmployeeAction'
	DECLARE @ExecutingUser VARCHAR(100) = SUSER_NAME()
	
	MERGE INTO [CPS_DW].[Hub].[EmployeeAction] AS tgt -- target table
	USING (
				SELECT [EmployeeActionId]
				  ,[EmployeeId]
				  ,[ActionId]
				  ,[CompletedDate]
				  ,[Completable]
			  FROM [CPS_DW_STAGE].[dbo].[HubEmployeeAction]
				) AS src
	ON tgt.[EmployeeActionId] = src.[EmployeeActionId]

	WHEN MATCHED
	AND ( 
		-- Find matched records to update
		-- Dont include the keys or the created date
		ISNULL(src.[CompletedDate], '') <> ISNULL(tgt.[CompletedDate],'')
		OR ISNULL(src.[Completable], '') <> ISNULL(tgt.[Completable],'')
	)
	THEN
	UPDATE -- Update records that have a new updated record
		SET
		tgt.[CompletedDate] = src.[CompletedDate]
		, tgt.[Completable] = src.[Completable]
	;

END
GO
