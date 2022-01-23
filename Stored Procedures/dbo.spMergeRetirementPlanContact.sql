SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO




CREATE procedure [dbo].[spMergeRetirementPlanContact] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()));
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())));
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime);
	declare @RunTime datetime = GETDATE();
	declare @ProcessName varchar(100) = 'spMergeRetirementPlanContact';
	declare @ExecutingUser varchar(100) = SUSER_NAME();
	
	with CrspContact as (
			SELECT 
				acc.[Lawson_ID__c] as EmployerNumber
				, con.[FirstName]
				, con.[LastName]
				, 'CRSP Contact' as [ContactRole]
				, case
					when con.[npe01__PreferredPhone__c] = 'Home'
						and con.[HomePhone] <> ''
						and con.[HomePhone] is not null
					then con.[HomePhone]
					when con.[npe01__PreferredPhone__c] = 'Work'
						and con.[npe01__WorkPhone__c] <> ''
						and con.[npe01__WorkPhone__c] is not null
					then con.[npe01__WorkPhone__c]
					when con.[npe01__PreferredPhone__c] = 'Mobile'
						and con.[MobilePhone] <> ''
						and con.[MobilePhone] is not null
					then con.[OtherPhone]
					when con.[npe01__PreferredPhone__c] = 'Other'
						and con.[OtherPhone] <> ''
						and con.[OtherPhone] is not null
					then con.[OtherPhone]
					else null
					end as [PhoneNumber]
				, case
					when con.[npe01__Preferred_Email__c] = 'Personal'
						and con.[npe01__HomeEmail__c] <> ''
						and con.[npe01__HomeEmail__c] is not null
					then con.[npe01__HomeEmail__c]
					when con.[npe01__Preferred_Email__c] = 'Work'
						and con.[npe01__WorkEmail__c] <> ''
						and con.[npe01__WorkEmail__c] is not null
					then con.[npe01__WorkEmail__c]
					when con.[npe01__Preferred_Email__c] = 'Home'
						and con.[npe01__HomeEmail__c] <> ''
						and con.[npe01__HomeEmail__c] is not null
					then con.[npe01__HomeEmail__c]
					when con.[npe01__Preferred_Email__c] = 'Alternate'
						and con.[npe01__AlternateEmail__c] <> ''
						and con.[npe01__AlternateEmail__c] is not null
					then con.[npe01__AlternateEmail__c]
					else null
					end as [Email]
			FROM [CPS_DW_STAGE].[dbo].[CrmSalesforceContact] con
			join [CPS_DW_STAGE].[dbo].[CrmSalesforceAffiliation] aff
				on aff.[npe5__Contact__c] = con.id
					and aff.[IsDeleted] = 'False'
					and aff.[npe5__Status__c] = 'Current'
			join [CPS_DW_STAGE].[dbo].[CrmSalesforceAccount] acc
				on acc.[Id] = aff.[npe5__Organization__c]
					and acc.[Lawson_ID__c] is not null
					and acc.[Lawson_ID__c] <> ''
			
			where aff.[Persona__c] like '%CRSP Contact%'
		), PlanAdmin as (
			SELECT 
				acc.[Lawson_ID__c] as EmployerNumber
				, con.[FirstName]
				, con.[LastName]
				, 'Plan Administrator' as [ContactRole]
				, case
					when con.[npe01__PreferredPhone__c] = 'Home'
						and con.[HomePhone] <> ''
						and con.[HomePhone] is not null
					then con.[HomePhone]
					when con.[npe01__PreferredPhone__c] = 'Work'
						and con.[npe01__WorkPhone__c] <> ''
						and con.[npe01__WorkPhone__c] is not null
					then con.[npe01__WorkPhone__c]
					when con.[npe01__PreferredPhone__c] = 'Mobile'
						and con.[MobilePhone] <> ''
						and con.[MobilePhone] is not null
					then con.[OtherPhone]
					when con.[npe01__PreferredPhone__c] = 'Other'
						and con.[OtherPhone] <> ''
						and con.[OtherPhone] is not null
					then con.[OtherPhone]
					else null
					end as [PhoneNumber]
				, case
					when con.[npe01__Preferred_Email__c] = 'Personal'
						and con.[npe01__HomeEmail__c] <> ''
						and con.[npe01__HomeEmail__c] is not null
					then con.[npe01__HomeEmail__c]
					when con.[npe01__Preferred_Email__c] = 'Work'
						and con.[npe01__WorkEmail__c] <> ''
						and con.[npe01__WorkEmail__c] is not null
					then con.[npe01__WorkEmail__c]
					when con.[npe01__Preferred_Email__c] = 'Home'
						and con.[npe01__HomeEmail__c] <> ''
						and con.[npe01__HomeEmail__c] is not null
					then con.[npe01__HomeEmail__c]
					when con.[npe01__Preferred_Email__c] = 'Alternate'
						and con.[npe01__AlternateEmail__c] <> ''
						and con.[npe01__AlternateEmail__c] is not null
					then con.[npe01__AlternateEmail__c]
					else null
					end as [Email]
			FROM [CPS_DW_STAGE].[dbo].[CrmSalesforceContact] con
			join [CPS_DW_STAGE].[dbo].[CrmSalesforceAffiliation] aff
				on aff.[npe5__Contact__c] = con.id
					and aff.[IsDeleted] = 'False'
					and aff.[npe5__Status__c] = 'Current'
			join [CPS_DW_STAGE].[dbo].[CrmSalesforceAccount] acc
				on acc.[Id] = aff.[npe5__Organization__c]
					and acc.[Lawson_ID__c] is not null
					and acc.[Lawson_ID__c] <> ''
			where aff.[Portal_Role__c] like '%Plan Administrator%'
				--and acc.[Lawson_ID__c] not in(select EmployerNumber from CrspContact)
		), PrimaryContact as (
			SELECT 
				acc.[Lawson_ID__c] as EmployerNumber
				, con.[FirstName]
				, con.[LastName]
				, 'Primary Contact' as [ContactRole]
				, case
					when con.[npe01__PreferredPhone__c] = 'Home'
						and con.[HomePhone] <> ''
						and con.[HomePhone] is not null
					then con.[HomePhone]
					when con.[npe01__PreferredPhone__c] = 'Work'
						and con.[npe01__WorkPhone__c] <> ''
						and con.[npe01__WorkPhone__c] is not null
					then con.[npe01__WorkPhone__c]
					when con.[npe01__PreferredPhone__c] = 'Mobile'
						and con.[MobilePhone] <> ''
						and con.[MobilePhone] is not null
					then con.[OtherPhone]
					when con.[npe01__PreferredPhone__c] = 'Other'
						and con.[OtherPhone] <> ''
						and con.[OtherPhone] is not null
					then con.[OtherPhone]
					else null
					end as [PhoneNumber]
				, case
					when con.[npe01__Preferred_Email__c] = 'Personal'
						and con.[npe01__HomeEmail__c] <> ''
						and con.[npe01__HomeEmail__c] is not null
					then con.[npe01__HomeEmail__c]
					when con.[npe01__Preferred_Email__c] = 'Work'
						and con.[npe01__WorkEmail__c] <> ''
						and con.[npe01__WorkEmail__c] is not null
					then con.[npe01__WorkEmail__c]
					when con.[npe01__Preferred_Email__c] = 'Home'
						and con.[npe01__HomeEmail__c] <> ''
						and con.[npe01__HomeEmail__c] is not null
					then con.[npe01__HomeEmail__c]
					when con.[npe01__Preferred_Email__c] = 'Alternate'
						and con.[npe01__AlternateEmail__c] <> ''
						and con.[npe01__AlternateEmail__c] is not null
					then con.[npe01__AlternateEmail__c]
					else null
					end as [Email]
			FROM [CPS_DW_STAGE].[dbo].[CrmSalesforceContact] con
			join [CPS_DW_STAGE].[dbo].[CrmSalesforceAffiliation] aff
				on aff.[npe5__Contact__c] = con.id
					and aff.[IsDeleted] = 'False'
					and aff.[npe5__Status__c] = 'Current'
			join [CPS_DW_STAGE].[dbo].[CrmSalesforceAccount] acc
				on acc.[Id] = aff.[npe5__Organization__c]
					and acc.[Lawson_ID__c] is not null
					and acc.[Lawson_ID__c] <> ''
			where aff.npe5__Primary__c = 'True'
				--and acc.[Lawson_ID__c] not in(select EmployerNumber from CrspContact)
				--and acc.[Lawson_ID__c] not in(select EmployerNumber from PlanAdmin)
	)
	merge into [CPS_DW].[dbo].[RetirementPlanContact] as tgt -- target table
	using (
		select
			cast([EmployerNumber] as varchar(5)) as [EmployerNumber]
			,cast([FirstName] as varchar(50)) as [FirstName]
			,cast([LastName] as varchar(50)) as [LastName]
			,cast(max([ContactRole]) as varchar(100)) as [ContactRole]
			,cast(max([PhoneNumber]) as varchar(25)) as [PhoneNumber]
			,cast(max([Email]) as varchar(100)) as [Email]
		from CrspContact
		group by cast([EmployerNumber] as varchar(5))
			,cast([FirstName] as varchar(50))
			,cast([LastName] as varchar(50))

		--union

		--select
		--	cast([EmployerNumber] as varchar(5)) as [EmployerNumber]
		--	,cast([FirstName] as varchar(50)) as [FirstName]
		--	,cast([LastName] as varchar(50)) as [LastName]
		--	,cast(max([ContactRole]) as varchar(100)) as [ContactRole]
		--	,cast(max([PhoneNumber]) as varchar(25)) as [PhoneNumber]
		--	,cast(max([Email]) as varchar(100)) as [Email]
		--from PlanAdmin
		--group by cast([EmployerNumber] as varchar(5))
		--	,cast([FirstName] as varchar(50))
		--	,cast([LastName] as varchar(50))

		--union

		--select
		--	cast([EmployerNumber] as varchar(5)) as [EmployerNumber]
		--	,cast([FirstName] as varchar(50)) as [FirstName]
		--	,cast([LastName] as varchar(50)) as [LastName]
		--	,cast(max([ContactRole]) as varchar(100)) as [ContactRole]
		--	,cast(max([PhoneNumber]) as varchar(25)) as [PhoneNumber]
		--	,cast(max([Email]) as varchar(100)) as [Email]
		--from PrimaryContact
		--group by cast([EmployerNumber] as varchar(5))
		--	,cast([FirstName] as varchar(50))
		--	,cast([LastName] as varchar(50))
	) as src
	on tgt.[EmployerNumber] = src.[EmployerNumber]
		and tgt.[ContactRole] = src.[ContactRole]
		and tgt.[FirstName] = src.[FirstName]
		and tgt.[LastName] = src.[LastName]
	-- Mark deleted rows as not current
	when not matched by source
	then delete

	-- Insert new rows
	when not matched 
	then insert (
		[EmployerNumber]
		,[FirstName]
		,[LastName]
		,[ContactRole]
		,[PhoneNumber]
		,[Email]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwInsertDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
		,[DwUpdateDate]
	) values(
		src.[EmployerNumber]
		,src.[FirstName]
		,src.[LastName]
		,src.[ContactRole]
		,src.[PhoneNumber]
		,src.[Email]
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
		--isnull(src.[ContactRole], '') <> isnull(tgt.[ContactRole],'')
		--or 
		isnull(src.[PhoneNumber], '') <> isnull(tgt.[PhoneNumber],'')
		or isnull(src.[Email], '') <> isnull(tgt.[Email],'')
	)
	then
	update -- Update records that have a new updated record
		set --tgt.[ContactRole] = src.[ContactRole]
		--, 
		tgt.[PhoneNumber] = src.[PhoneNumber]
		, tgt.[Email] = src.[Email]
		, tgt.DwUpdateUsername = @ExecutingUser
		, tgt.DwUpdateProcessName = @ProcessName
		, tgt.DwUpdateDate = @RunTime
	;
end
GO
