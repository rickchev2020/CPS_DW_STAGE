SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



create procedure [dbo].[spMergePricingCostArea] as begin

	declare @TodayDate datetime = dateadd(dd, 1, datediff(dd, 1, getdate()));
	declare @YesterdayDate datetime = dateadd(ms, -3, dateadd(dd, 1, datediff(dd, 1, getdate())));
	declare @MaxEndDate datetime = cast('9999-12-31 23:59:59.997' as datetime);
	declare @RunTime datetime = GETDATE();
	declare @ProcessName varchar(100) = 'spMergePricingCostArea';
	declare @ExecutingUser varchar(100) = SUSER_NAME();
	
	merge into [CPS_DW].[dbo].[PricingCostArea] as tgt -- target table
	using (
		SELECT
			[Year] as [PricingYear]
			,[ZipCode] as [PricingZipCode]
			, bpc.[BenefitPlanCarrierId]
			,[Value] as [CostAreaValue]
		FROM [CPS_DW_STAGE].[dbo].[PricingCostAreas] pca
		join [CPS_DW].[dbo].[BenefitPlanCarrier] bpc
			on replace(bpc.BenefitPlanCarrierCode, '-', '') = pca.[Provider]
	) as src
	on tgt.[PricingYear] = src.[PricingYear]
		and tgt.[PricingZipCode] = src.[PricingZipCode]
		and tgt.[BenefitPlanCarrierId] = src.[BenefitPlanCarrierId]
	-- Mark deleted rows as not current
	when not matched by source
	then delete

	-- Insert new rows
	when not matched 
	then insert (
		[PricingYear]
		,[PricingZipCode]
		,[BenefitPlanCarrierId]
		,[CostAreaValue]
		,[DwInsertUsername]
		,[DwInsertProcessName]
		,[DwInsertDate]
		,[DwUpdateUsername]
		,[DwUpdateProcessName]
		,[DwUpdateDate]
	) values(
		src.[PricingYear]
		,src.[PricingZipCode]
		,src.[BenefitPlanCarrierId]
		,src.[CostAreaValue]
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
		isnull(src.[CostAreaValue], '') <> isnull(tgt.[CostAreaValue],'')
	)
	then
	update -- Update records that have a new updated record
		set tgt.[CostAreaValue] = src.[CostAreaValue]
		, tgt.DwUpdateUsername = @ExecutingUser
		, tgt.DwUpdateProcessName = @ProcessName
		, tgt.DwUpdateDate = @RunTime
	;
end
GO
