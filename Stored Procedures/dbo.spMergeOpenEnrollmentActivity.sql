SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO







CREATE procedure [dbo].[spMergeOpenEnrollmentActivity] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()))
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())))
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime)
	declare @RunTime datetime = GETDATE()
	declare @ProcessName varchar(100) = 'spMergeOpenEnrollmentActivity'
	declare @ExecutingUser varchar(100) = SUSER_NAME()
	
	merge into [CPS_DW].[dbo].[OpenEnrollmentActivity] as tgt -- target table
	using (
		SELECT distinct
			left([Employer ID], 5) as [EmployerNumber]
			,[CPS Member ID] as [MemberNumber]
			,[Action Taken] as [ActionDesc]
			,[ROLE] as [ActionRole]
			,[Requested By] as [Username]
			,[Confirmed On] as [ConfirmedDate]
		FROM [CPS_DW_STAGE].[dbo].[OpenEnrollmentActivity]
		where [Employer ID] is not null
			and [CPS Member ID] is not null
	) as src
	on tgt.[EmployerNumber] = src.[EmployerNumber]
		and tgt.[MemberNumber] = src.[MemberNumber]
		and tgt.[ActionDesc] = src.[ActionDesc]
		and tgt.[ActionRole] = src.[ActionRole]

	-- Mark deleted rows as not current
	when not matched by source
	then delete

	-- Insert new rows
	when not matched 
	then insert (
		[EmployerNumber]
		,[MemberNumber]
		,[ActionDesc]
		,[ActionRole]
		,[Username]
		,[ConfirmedDate]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwInsertDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
		,[DwUpdateDate]
	) values(
		src.[EmployerNumber]
		,src.[MemberNumber]
		,src.[ActionDesc]
		,src.[ActionRole]
		,src.[Username]
		,src.[ConfirmedDate]
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
		--isnull(src.[ActionDesc], '') <> isnull(tgt.[ActionDesc],'')
		--or isnull(src.[ActionRole], '') <> isnull(tgt.[ActionRole],'')
		isnull(src.[Username], '') <> isnull(tgt.[Username],'')
		or isnull(src.[ConfirmedDate], '') <> isnull(tgt.[ConfirmedDate],'')
	)
	then
	update -- Update records that have a new updated record
		--set tgt.[ActionDesc] = src.[ActionDesc]
		--, tgt.[ActionRole] = src.[ActionRole]
		set tgt.[Username] = src.[Username]
		, tgt.[ConfirmedDate] = src.[ConfirmedDate]
		, tgt.DwUpdateUsername = @ExecutingUser
		, tgt.DwUpdateProcessName = @ProcessName
		, tgt.DwUpdateDate = @RunTime
	;
end
GO
