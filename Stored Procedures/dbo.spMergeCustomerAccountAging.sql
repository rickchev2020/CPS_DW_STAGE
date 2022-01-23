SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
create procedure [dbo].[spMergeCustomerAccountAging] as BEGIN

	declare @RunTime datetime = GETDATE();
	declare @ProcessName varchar(100) = 'spMergeCustomerAccountAging';
	declare @ExecutingUser varchar(100) = SUSER_NAME();
	declare @SourceName varchar(100) = '[CPS_DW_STAGE].[dbo].[CustomerAccountAging]';
	
	
WITH CustomerAccountAgingTemp AS
     (
     SELECT 
     CustomerAccountAgingID,
     SUBSTRING(Customer2,3,5) AS EmployerNumber,
     AsOfDate,
     OpenAmt,
     CollectDays2,
     pd1OpenAmt4,
     pd3OpenAmt4,
     pd5OpenAmt4,
     pd7OpenAmt4,
     pd2OpenAmt4,
     pd4OpenAmt4,
     pd6OpenAmt4,
     DwSourceName,
     DwInsertDate,
     DwInsertUsername,
     DwInsertProcessName,
     DwUpdateDate,
     DwUpdateUsername,
     DwUpdateProcessName
     FROM       [CPS_DW_STAGE].[dbo].[CustomerAccountAging] src
     WHERE 
     LEFT(Customer2,2) = 'ER'
     )

MERGE [CPS_DW].[dbo].[CustomerAccountAging] tgt USING
      CustomerAccountAgingTemp src
ON tgt.[CustomerAccountAgingId] = src.[CustomerAccountAgingId]
WHEN MATCHED
AND  (
	   (tgt.[AsOfDate] <> 	src.[AsOfDate])
	OR (tgt.[EmployerNumber] <>	src.[EmployerNumber]) 
	OR (tgt.[OpenAmt] <> src.[OpenAmt])
	OR (tgt.[CollectDaysAvg] <> 	src.[CollectDays2])
	OR (tgt.[FutureBalance] <>	src.[pd1OpenAmt4])
	OR (tgt.[BalancePastDueLt30Days] <> src.[pd3OpenAmt4])
	OR (tgt.[BalancePastDue61to90Days] <> src.[pd5OpenAmt4]) 
	OR (tgt.[BalancePastDueGt120Days] <>	src.[pd7OpenAmt4])
	OR (tgt.[CurrentBalance] <> src.[pd2OpenAmt4])
	OR (tgt.[BalancePastDue31to60Days] <> src.[pd4OpenAmt4])
	OR (tgt.[BalancePastDue91to120Days] <>	src.[pd6OpenAmt4])
      )
THEN UPDATE 
  SET
	tgt.[AsOfDate] = 	src.[AsOfDate],
	tgt.[EmployerNumber] = 	src.[EmployerNumber], 
	tgt.[OpenAmt] = 	src.[OpenAmt], 
	tgt.[CollectDaysAvg] = 	src.[CollectDays2],
	tgt.[FutureBalance] = 	src.[pd1OpenAmt4],
	tgt.[BalancePastDueLt30Days] = 	src.[pd3OpenAmt4],
	tgt.[BalancePastDue61to90Days] = 	src.[pd5OpenAmt4], 
	tgt.[BalancePastDueGt120Days] = 	src.[pd7OpenAmt4], 
	tgt.[CurrentBalance] = 	src.[pd2OpenAmt4], 
	tgt.[BalancePastDue31to60Days] = 	src.[pd4OpenAmt4], 
	tgt.[BalancePastDue91to120Days] = 	src.[pd6OpenAmt4]
WHEN NOT MATCHED
THEN INSERT (
  [CustomerAccountAgingID],
	[EmployerNumber],
	[AsOfDate],
	[OpenAmt],
	[CollectDaysAvg],
	[FutureBalance],
	[BalancePastDueLt30Days],
	[BalancePastDue61to90Days],
	[BalancePastDueGt120Days],
	[CurrentBalance],
	[BalancePastDue31to60Days],
	[BalancePastDue91to120Days],
	[DwSourceName],
	[DwInsertDate],
	[DwInsertUsername],
	[DwInsertProcessName],
	[DwUpdateDate],
	[DwUpdateUsername],
	[DwUpdateProcessName]
             )
      VALUES (
             src.[CustomerAccountAgingID]
             ,src.[EmployerNumber]
             ,src.[AsOfDate]
             ,src.[OpenAmt]
             ,src.[CollectDays2]
             ,src.[pd1OpenAmt4]
             ,src.[pd3OpenAmt4]
             ,src.[pd5OpenAmt4]
             ,src.[pd7OpenAmt4]
             ,src.[pd2OpenAmt4]
             ,src.[pd4OpenAmt4]
             ,src.[pd6OpenAmt4]
             ,@SourceName -- DwSourceName
             ,@RunTime -- DwInsertDate
             ,@ExecutingUser -- DwInsertUsername
             ,@ProcessName -- DwInsertProcessName
             ,@RunTime -- DwUpdateDate
             ,@ExecutingUser -- DwUpdateUsername
             ,@ProcessName -- DwUpdateProcessName
              );
END
GO
