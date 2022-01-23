SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE procedure [dbo].[spArchiveSummaryRun]
as 
begin

	DECLARE @RC int
	DECLARE @SchemaName varchar(100)
	DECLARE @TableName varchar(100)
	DECLARE @NumberOfDays int

	-- [BasIncomingDependentCoverage]
	set @SchemaName = '[dbo]'
	set @TableName = '[BasIncomingDependentCoverage]'
	set @NumberOfDays = 45

	EXECUTE @RC = [dbo].[spArchiveSummary] 
	   @SchemaName
	  ,@TableName
	  ,@NumberOfDays

	-- [BasIncomingDependentDemographic]
	set @SchemaName = '[dbo]'
	set @TableName = '[BasIncomingDependentDemographic]'
	set @NumberOfDays = 45

	EXECUTE @RC = [dbo].[spArchiveSummary] 
	   @SchemaName
	  ,@TableName
	  ,@NumberOfDays

	-- [BasIncomingEmployeeCoverage]
	set @SchemaName = '[dbo]'
	set @TableName = '[BasIncomingEmployeeCoverage]'
	set @NumberOfDays = 45

	EXECUTE @RC = [dbo].[spArchiveSummary] 
	   @SchemaName
	  ,@TableName
	  ,@NumberOfDays

	-- [BasIncomingEmployeeDemographic]
	set @SchemaName = '[dbo]'
	set @TableName = '[BasIncomingEmployeeDemographic]'
	set @NumberOfDays = 45

	EXECUTE @RC = [dbo].[spArchiveSummary] 
	   @SchemaName
	  ,@TableName
	  ,@NumberOfDays

	-- [FidelityCrspDailyAccountBalanceReport]
	set @SchemaName = '[dbo]'
	set @TableName = '[FidelityCrspDailyAccountBalanceReport]'
	set @NumberOfDays = 45

	EXECUTE @RC = [dbo].[spArchiveSummary] 
	   @SchemaName
	  ,@TableName
	  ,@NumberOfDays

	-- [WtwPensionEstimateFile]
	set @SchemaName = '[dbo]'
	set @TableName = '[WtwPensionEstimateFile]'
	set @NumberOfDays = 45

	EXECUTE @RC = [dbo].[spArchiveSummary] 
	   @SchemaName
	  ,@TableName
	  ,@NumberOfDays

end
GO
