SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE procedure [dbo].[spMergeCpsToBasLawsonMiscFile] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'spMergeCpsToBasLawsonMiscFile'
	declare @ExecutingUser varchar(100) = SUSER_NAME()
	
	merge into [CPS_DW_STAGE].[dbo].[CpsToBasLawsonMiscFile] as tgt -- target table
	using (
		SELECT
			[LINE ID]
			,[EMPLOYER ID]
			,[EMPLOYEE SSN]
			,[EMPLOYEE ID]
			,[LAST NAME]
			,[FIRST NAME]
			,[MIDDLE NAME / INITIAL]
			,[SUFFIX]
			,[ADDRESS1]
			,[ADDRESS2]
			,[ADDRESS3]
			,[CITY]
			,[STATE]
			,[POSTAL]
			,[COUNTRY]
			,[ADDRESS EFFECTIVE DATE]
			,[CRP Adj Service Date]
			,[Original Hire Date]
			,[Lawson ID]
			,[Lawson EMS_EMP_STATUS]
			,[Lawson EMS_EMP_STATUS Effective Date]
			,[Lawson EMS_Description]
			,[Okta Email Address]
			,[CHP Continuous Service]
		FROM [CPS_DW].[bas].[vBasMiscDataFile]
		where [Lawson ID] not in(
			SELECT
			[Lawson ID]
			FROM [CPS_DW].[bas].[vBasMiscDataFile]
			group by [Lawson ID]
			having count(*) > 1)
	) as src
	on tgt.[Lawson ID] = src.[Lawson ID]
	-- Mark deleted rows as not current
	when not matched by source
	then delete

	-- Insert new rows
	when not matched 
	then insert (
		[LINE ID]
		,[EMPLOYER ID]
		,[EMPLOYEE SSN]
		,[EMPLOYEE ID]
		,[LAST NAME]
		,[FIRST NAME]
		,[MIDDLE NAME / INITIAL]
		,[SUFFIX]
		,[ADDRESS1]
		,[ADDRESS2]
		,[ADDRESS3]
		,[CITY]
		,[STATE]
		,[POSTAL]
		,[COUNTRY]
		,[ADDRESS EFFECTIVE DATE]
		,[CRP Adj Service Date]
		,[Original Hire Date]
		,[Lawson ID]
		,[Lawson EMS_EMP_STATUS]
		,[Lawson EMS_EMP_STATUS Effective Date]
		,[Lawson EMS_Description]
		,[Okta Email Address]
		,[CHP Continuous Service]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwInsertDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
		,[DwUpdateDate]
	) values(
		src.[LINE ID]
		,src.[EMPLOYER ID]
		,src.[EMPLOYEE SSN]
		,src.[EMPLOYEE ID]
		,src.[LAST NAME]
		,src.[FIRST NAME]
		,src.[MIDDLE NAME / INITIAL]
		,src.[SUFFIX]
		,src.[ADDRESS1]
		,src.[ADDRESS2]
		,src.[ADDRESS3]
		,src.[CITY]
		,src.[STATE]
		,src.[POSTAL]
		,src.[COUNTRY]
		,src.[ADDRESS EFFECTIVE DATE]
		,src.[CRP Adj Service Date]
		,src.[Original Hire Date]
		,src.[Lawson ID]
		,src.[Lawson EMS_EMP_STATUS]
		,src.[Lawson EMS_EMP_STATUS Effective Date]
		,src.[Lawson EMS_Description]
		,src.[Okta Email Address]
		,src.[CHP Continuous Service]
		,@ExecutingUser -- DwInsertUsername
		,@ProcessName -- DwInsertProcessName
		,@RunTime -- DwInsertDate
		,@ExecutingUser -- DwUpdateUsername
		,@ProcessName -- DwUpdateProcessName
		,@RunTime -- DwUpdateDate
	)

	when matched
	AND ( 
		-- Find matched records to update
		-- Dont include the keys or the created date
		isnull(src.[LINE ID], '') <> isnull(tgt.[LINE ID],'')
		or isnull(src.[EMPLOYER ID], '') <> isnull(tgt.[EMPLOYER ID],'')
		or isnull(src.[EMPLOYEE SSN], '') <> isnull(tgt.[EMPLOYEE SSN],'')
		or isnull(src.[EMPLOYEE ID], '') <> isnull(tgt.[EMPLOYEE ID],'')
		or isnull(src.[LAST NAME], '') <> isnull(tgt.[LAST NAME],'')
		or isnull(src.[FIRST NAME], '') <> isnull(tgt.[FIRST NAME],'')
		or isnull(src.[MIDDLE NAME / INITIAL], '') <> isnull(tgt.[MIDDLE NAME / INITIAL],'')
		or isnull(src.[SUFFIX], '') <> isnull(tgt.[SUFFIX],'')
		or isnull(src.[ADDRESS1], '') <> isnull(tgt.[ADDRESS1],'')
		or isnull(src.[ADDRESS2], '') <> isnull(tgt.[ADDRESS2],'')
		or isnull(src.[ADDRESS3], '') <> isnull(tgt.[ADDRESS3],'')
		or isnull(src.[CITY], '') <> isnull(tgt.[CITY],'')
		or isnull(src.[STATE], '') <> isnull(tgt.[STATE],'')
		or isnull(src.[POSTAL], '') <> isnull(tgt.[POSTAL],'')
		or isnull(src.[COUNTRY], '') <> isnull(tgt.[COUNTRY],'')
		--or isnull(src.[ADDRESS EFFECTIVE DATE], '') <> isnull(tgt.[ADDRESS EFFECTIVE DATE],'')
		or isnull(src.[CRP Adj Service Date], '') <> isnull(tgt.[CRP Adj Service Date],'')
		or isnull(src.[Original Hire Date], '') <> isnull(tgt.[Original Hire Date],'')
		--or isnull(src.[Lawson ID], '') <> isnull(tgt.[Lawson ID],'')
		or isnull(src.[Lawson EMS_EMP_STATUS], '') <> isnull(tgt.[Lawson EMS_EMP_STATUS],'')
		--or isnull(src.[Lawson EMS_EMP_STATUS Effective Date], '') <> isnull(tgt.[Lawson EMS_EMP_STATUS Effective Date],'')
		or isnull(src.[Lawson EMS_Description], '') <> isnull(tgt.[Lawson EMS_Description],'')
		or isnull(src.[Okta Email Address], '') <> isnull(tgt.[Okta Email Address],'')
		or isnull(src.[CHP Continuous Service], '') <> isnull(tgt.[CHP Continuous Service],'')
	)
	then
	update -- Update records that have a new updated record
		set tgt.[LINE ID] = src.[LINE ID]
		, tgt.[EMPLOYER ID] = src.[EMPLOYER ID]
		, tgt.[EMPLOYEE SSN] = src.[EMPLOYEE SSN]
		, tgt.[EMPLOYEE ID] = src.[EMPLOYEE ID]
		, tgt.[LAST NAME] = src.[LAST NAME]
		, tgt.[FIRST NAME] = src.[FIRST NAME]
		, tgt.[MIDDLE NAME / INITIAL] = src.[MIDDLE NAME / INITIAL]
		, tgt.[SUFFIX] = src.[SUFFIX]
		, tgt.[ADDRESS1] = src.[ADDRESS1]
		, tgt.[ADDRESS2] = src.[ADDRESS2]
		, tgt.[ADDRESS3] = src.[ADDRESS3]
		, tgt.[CITY] = src.[CITY]
		, tgt.[STATE] = src.[STATE]
		, tgt.[POSTAL] = src.[POSTAL]
		, tgt.[COUNTRY] = src.[COUNTRY]
		, tgt.[ADDRESS EFFECTIVE DATE] = src.[ADDRESS EFFECTIVE DATE]
		, tgt.[CRP Adj Service Date] = src.[CRP Adj Service Date]
		, tgt.[Original Hire Date] = src.[Original Hire Date]
		--, src.[Lawson ID] = tgt.CoverageLevel
		, tgt.[Lawson EMS_EMP_STATUS] = src.[Lawson EMS_EMP_STATUS]
		, tgt.[Lawson EMS_EMP_STATUS Effective Date] = src.[Lawson EMS_EMP_STATUS Effective Date]
		, tgt.[Lawson EMS_Description] = src.[Lawson EMS_Description]
		, tgt.[Okta Email Address] = src.[Okta Email Address]
		, tgt.[CHP Continuous Service] = src.[CHP Continuous Service]
		, tgt.DwUpdateUsername = @ExecutingUser
		, tgt.DwUpdateProcessName = @ProcessName
		, tgt.DwUpdateDate = @RunTime
	;
end
GO
