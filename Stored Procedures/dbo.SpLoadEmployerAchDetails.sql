SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



-- =============================================
-- Author:		Mike Franke
-- Create date: 8/29/2019
-- Description:	Load EmployerAchDetails table from stage
-- =============================================
CREATE PROCEDURE [dbo].[SpLoadEmployerAchDetails] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

TRUNCATE TABLE [CPS_DW].[dbo].EmployerAchDetails;

WITH temp1 AS
(
SELECT GrpNumber, AcctType, DwInsertDate, DwInsertUsername, 'SpLoadEmployerAchDetails' AS DwSourceName, 
DwUpdateDate, DwUpdateUsername, 'SpLoadEmployerAchDetails' AS DwInsertProcessName
FROM [CPS_DW_STAGE].[dbo].EbsoAchListFile
WHERE SUBSTRING(GrpNumber,1,1) BETWEEN '0' AND '9'
),
temp2 AS
(
SELECT '0' + SUBSTRING(GrpNumber,2,4) AS GrpNumber, AcctType, DwInsertDate, DwInsertUsername, 
'SpLoadEmployerAchDetails' AS DwSourceName, 
DwUpdateDate, DwUpdateUsername, 'SpLoadEmployerAchDetails' AS DwInsertProcessName
FROM [CPS_DW_STAGE].[dbo].EbsoAchListFile
WHERE SUBSTRING(GrpNumber,1,1) NOT BETWEEN '0' AND '9'
),
temp3 AS
(SELECT GrpNumber, AcctType, DwInsertDate, DwInsertUsername, DwSourceName, 
DwUpdateDate, DwUpdateUsername, DwInsertProcessName, 'temp1' AS tmpTableName
FROM temp1
UNION
SELECT GrpNumber, AcctType, DwInsertDate, DwInsertUsername, DwSourceName, 
DwUpdateDate, DwUpdateUsername, DwInsertProcessName, 'temp2' AS tmpTableName
FROM temp2
)
INSERT INTO [CPS_DW].[dbo].EmployerAchDetails
SELECT GrpNumber, AcctType, DwInsertDate, DwInsertUsername, DwSourceName, 
DwUpdateDate, DwUpdateUsername, DwInsertProcessName FROM 
(SELECT GrpNumber, AcctType, DwInsertDate, DwInsertUsername, DwSourceName, 
DwUpdateDate, DwUpdateUsername, DwInsertProcessName, ROW_NUMBER()
OVER (PARTITION BY GrpNumber ORDER BY tmpTableName) AS rn
FROM temp3) AS temp4
WHERE rn=1

END
GO
