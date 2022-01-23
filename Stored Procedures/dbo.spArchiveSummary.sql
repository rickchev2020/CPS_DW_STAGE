SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE procedure [dbo].[spArchiveSummary] @SchemaName varchar(100), @TableName varchar(100), @NumberOfDays integer
as 
begin

	declare @DatabaseName varchar(100) = 'CPS_DW_STAGE'
	declare @ProcessName varchar(100) = 'spArchiveSummary'
	declare @SqlString nvarchar(max)
	declare @FullyQualifiedTableName varchar(100) = @DatabaseName + '.' + @SchemaName + '.' + @TableName
	declare @TableNameValidated varchar(100) = OBJECT_NAME(OBJECT_ID(@FullyQualifiedTableName), DB_ID(@DatabaseName))

	if @TableNameValidated is not null
	begin

		set @SqlString = 
		'insert into [CPS_DW_STAGE].[dbo].[ArchiveSummary] ' +
		'select ' +
		'	@SchemaName as SchemaName ' +
		'	, @TableName as TableName ' +
		'	, [SourceModifiedDate] ' +
		'	, [DwSourceName] ' +
		'	, count(*) as ArchiveRowCount ' +
		'	, getdate() as [DwInsertDate]  ' +
		'	, SUSER_NAME() as [DwInsertUsername]  ' +
		'	, @ProcessName as [DwInsertProcessName]  ' +
		'	, getdate() as [DwUpdateDate]  ' +
		'	, SUSER_NAME() as [DwUpdateUsername]  ' +
		'	, @ProcessName [DwUpdateProcessName]  ' +
		'from ' + @FullyQualifiedTableName + ' ' +
		'where DwUpdateDate < DATEADD(day, -@NumberOfDays, getdate()) ' +
		'group by [SourceModifiedDate] ' +
		'	, [DwSourceName] ' +
		'order by SourceModifiedDate desc ';

		--select @SqlString

		execute sp_executesql @SqlString
			, N'@DatabaseName varchar(100), @SchemaName varchar(100), @TableName varchar(100), @ProcessName varchar(100), @NumberOfDays integer'
			, @DatabaseName, @SchemaName, @TableName, @ProcessName, @NumberOfDays;

		set @SqlString = 
		'delete from ' + @FullyQualifiedTableName + ' ' +
		'where DwUpdateDate < DATEADD(day, -@NumberOfDays, getdate())';

		--select @SqlString

		execute sp_executesql @SqlString
			, N'@NumberOfDays integer'
			, @NumberOfDays;

	end

end
GO
