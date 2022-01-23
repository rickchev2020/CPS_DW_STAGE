SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO






CREATE procedure [dbo].[SpLoadVitalityRewardFile] as 
BEGIN
	DECLARE @RunTime DATETIME = GETDATE()
	--TRUNCATE TABLE [CPS_DW].[dbo].[VitalityReward]
	INSERT INTO [CPS_DW].[dbo].[VitalityReward]
           ([EntityNumber]
           ,[MemberNumber]
           ,[FirstName]
           ,[LastName]
           ,[RewardType]
           ,[OrderNumber]
           ,[BillableItemId]
           ,[BillableItemDescription]
           ,[Quantity]
           ,[PurchaseDate]
           ,[SubTotal]
           ,[CouponValue]
           ,[SalesTax]
           ,[TotalDue]
           ,[BillDate]
           ,[Branch]
           ,[BranchName]
           ,[GroupName]
           ,[EmployerNumber]
           ,[Attribute2]
           ,[Attribute3]
           ,[Attribute4]
           ,[Attribute5]
           ,[SecondaryMemberNumber]
           ,[Role]
           ,[EmailAddress]
           ,[EntryBillInvoiceDateId]
           ,[MemNumber]
           ,[InvoiceStatus]
           ,[SystemDate]
           ,[SourceModifiedDate]
           ,[DwSourceName]
           ,[DwInsertDate]
           ,[DwInsertUsername]
           ,[DwInsertProcessName]
           ,[DwUpdateDate]
           ,[DwUpdateUsername]
           ,[DwUpdateProcessName])
	SELECT 
            [EntityNumber]
           ,[MemberNumber]
           ,[FirstName]
           ,[LastName]
           ,[RewardType]
           ,[OrderNumber]
           ,[BillableItemId]
           ,[BillableItemDescription]
           ,[Quantity]
           ,[PurchaseDate]
           ,[SubTotal]
           ,[CouponValue]
           ,[SalesTax]
           ,[TotalDue]
           ,[BillDate]
           ,[Branch]
           ,[BranchName]
           ,[GroupName]
           ,[EmployerNumber]
           ,[Attribute2]
           ,[Attribute3]
           ,[Attribute4]
           ,[Attribute5]
           ,[SecondaryMemberNumber]
           ,[Role]
           ,[EmailAddress]
           ,[EntryBillInvoiceDateId]
           ,[MemNumber]
           ,[InvoiceStatus]
           ,[SystemDate]
           ,[SourceModifiedDate]
           ,[DwSourceName]
           ,[DwInsertDate]
           ,[DwInsertUsername]
           ,[DwInsertProcessName]
           ,[DwUpdateDate]
           ,[DwUpdateUsername]
           ,[DwUpdateProcessName]
		--,@RunTime as [DwInsertDate]
		--,SYSTEM_USER as [DwInsertUsername]
		--,'SpLoadVitalityRewardFile' as [DwInsertProcessName]
		--,@RunTime as [DwUpdateDate]
		--,SYSTEM_USER as [DwUpdateUsername]
		--,'SpLoadVitalityRewardFile' as [DwUpdateProcessName]
	FROM [CPS_DW_STAGE].[dbo].[VitalityReward]

	END;


GO
