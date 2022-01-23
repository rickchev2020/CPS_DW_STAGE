SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[spCreateAnnualCompensationReport]
AS
/*** 9.0   Script Date: 02/10/2011***/



SELECT 
	distinct(ate.[EmployerNumber]) 'PROCESS_LEVEL',
	ate.[CrpAdoptionDate] 'CRP_EFF',
	ate.[ChpAdoptionDate] 'CHP_EFF',
	ate.[ChpMinHours] 'CHPHRS',
	atm.[MemberNumber] 'EMPLOYEE',
	atm.[FirstName] 'FIRST_NAME',
	atm.[LastName] 'LAST_NAME',
	atm.[TotalSalary] 'PAY_RATE',
	atm.[ScheduledHours] 'STAND_HOURS',
	(CASE WHEN atm.HomeProvidedAmount > .01
			THEN 'Y'
			ELSE 'N'
	 END) 'HP',
	ate.PortalRegisteredInd,
	ate.ChpElectionInd,
	atm.AcrYear
into #t2
FROM [CPS_DW_STAGE].[dbo].[AcrToolEmployer] ate
	inner join [CPS_DW_STAGE].[dbo].[AcrToolMember] atm
		on ate.EmployerNumber = atm.EmployerNumber 
where atm.EmploymentStatus in ('A','P')
and atm.[ScheduledHours] > 20
order by ate.EmployerNumber


select #t2.*
into #final
from #t2
	inner join (
				select PROCESS_LEVEL,
					EMPLOYEE,
					MAX(AcrYear) 'MaxAcrYear'
				from #t2
				group by PROCESS_LEVEL,EMPLOYEE,LAST_NAME,FIRST_NAME
				) yy
		on #t2.PROCESS_LEVEL = yy.PROCESS_LEVEL AND
			#t2.EMPLOYEE = yy.EMPLOYEE AND
			#t2.AcrYear  = yy.MaxAcrYear
order by LAST_NAME,FIRST_NAME


SELECT 
	ate.PROCESS_LEVEL,
	prs.NAME,
	prs.ADDR1,
	prs.ADDR2,
	prs.ADDR3,
	prs.CITY,
	prs.STATE,
	prs.ZIP,
	ate.CRP_EFF,
	ate.CHP_EFF,
	ate.CHPHRS,
	ate.EMPLOYEE,
	ate.FIRST_NAME,
	ate.LAST_NAME,
	ate.PAY_RATE,
	ate.STAND_HOURS,
	ate.HP,
	ate.PortalRegisteredInd,
	ate.ChpElectionInd,
	ate.AcrYear 'MaxAcrYear'
FROM #final ate
	INNER JOIN [INFORBCDB01].[LSLMDB].[ls_apps].[PRSYSTEM] prs
		on	ate.PROCESS_LEVEL = prs.PROCESS_LEVEL COLLATE DATABASE_DEFAULT
WHERE NOT EXISTS (	SELECT EmployerNumber
					FROM [CPS_DW].[dbo].[EmployerAcrExclusion] ear
					WHERE ate.[PROCESS_LEVEL] = ear.[EmployerNumber]
						and (
								(ear.IcInd = 'Y')
									 or
								(ear.AcrCode in ('EDF','DOWNLOAD','NONE'))
							)
				)
order by ate.PROCESS_LEVEL

/*
--drop table #t2
SELECT 
	distinct(ate.[EmployerNumber]),
	ate.[CrpAdoptionDate],
	ate.[ChpAdoptionDate],
	ate.[ChpMinHours],
	ate.PortalRegisteredInd,
	ate.ChpElectionInd
into #t2
  FROM [CPS_DW_STAGE].[dbo].[AcrToolEmployer] ate
	inner join [CPS_DW_STAGE].[dbo].[AcrToolMember] atm
		on ate.EmployerNumber = atm.EmployerNumber
  --where (ate.PortalRegisteredInd = 'Y')
	and (atm.annualcashhousingallowance  > 0 or atm.homeprovidedamount > 0 or atm.AnnualCashUtilityAllowance > 0)
where atm.EmploymentStatus in ('A','P')
order by ate.EmployerNumber
--select * from #t2 where employernumber = '00007'

--drop table #temp
SELECT 
	ate.[EmployerNumber] 'PROCESS_LEVEL',
	--ate.[EmployerName] 'NAME',
	--ate.[City] 'CITY',
	--ate.[StateCode] 'STATE',
	--ate.[ZipCode] 'ZIP',
	--ate.[Address1] 'ADDR1',
	--ate.[Address2] 'ADDR2',
	--ate.[Address3] 'ADDR3',
	ate.[CrpAdoptionDate] 'CRP_EFF',
	ate.[ChpAdoptionDate] 'CHP_EFF',
	ate.[ChpMinHours] 'CHPHRS',
	atm.[MemberNumber] 'EMPLOYEE',
	atm.[FirstName] 'FIRST_NAME',
	atm.[LastName] 'LAST_NAME',
	atm.[TotalSalary] 'PAY_RATE',
	atm.[ScheduledHours] 'STAND_HOURS',
	(CASE WHEN atm.HomeProvidedAmount > .01
			THEN 'Y'
			ELSE 'N'
	 END) 'HP',
	 ate.PortalRegisteredInd,
	 ate.ChpElectionInd
INTO #temp
FROM #t2 ate
--FROM [CPS_DW_STAGE].[dbo].[AcrToolEmployer] ate
	INNER JOIN [CPS_DW_STAGE].[dbo].[AcrToolMember] atm
		ON ate.EmployerNumber = atm.EmployerNumber
			and atm.EmploymentStatus in ('A','P')
WHERE NOT EXISTS (	SELECT EmployerNumber
					FROM [CPS_DW].[dbo].[EmployerAcrExclusion] ear
					WHERE ate.[EmployerNumber] = ear.[EmployerNumber]
						and (
								(ear.IcInd = 'Y')
									 or
								(ear.AcrCode in ('EDF','DOWNLOAD','NONE'))
							)
				)
order by ate.[EmployerNumber]
--select * from #temp where process_level = '00038'

SELECT
	tp.PROCESS_LEVEL,
	NAME,
	ADDR1,
	ADDR2,
	ADDR3,
	CITY,
	STATE,
	ZIP,
	CRP_EFF,
	CHP_EFF,
	CHPHRS,
	EMPLOYEE,
	FIRST_NAME,
	LAST_NAME,
	tp.PAY_RATE,
	STAND_HOURS,
	HP,
	PortalRegisteredInd,
	ChpElectionInd
FROM #temp tp
	INNER JOIN [INFORBCDB01].[LSLMDB].[ls_apps].[PRSYSTEM] prs
		on	tp.PROCESS_LEVEL = prs.PROCESS_LEVEL COLLATE DATABASE_DEFAULT
WHERE STAND_HOURS > 20
*/



-- Current production
/*

--drop table #temp
SELECT 
	ate.[EmployerNumber] 'PROCESS_LEVEL',
	--ate.[EmployerName] 'NAME',
	--ate.[City] 'CITY',
	--ate.[StateCode] 'STATE',
	--ate.[ZipCode] 'ZIP',
	--ate.[Address1] 'ADDR1',
	--ate.[Address2] 'ADDR2',
	--ate.[Address3] 'ADDR3',
	ate.[CrpAdoptionDate] 'CRP_EFF',
	ate.[ChpAdoptionDate] 'CHP_EFF',
	ate.[ChpMinHours] 'CHPHRS',
	atm.[MemberNumber] 'EMPLOYEE',
	atm.[FirstName] 'FIRST_NAME',
	atm.[LastName] 'LAST_NAME',
	atm.[TotalSalary] 'PAY_RATE',
	atm.[ScheduledHours] 'STAND_HOURS',
	(CASE WHEN atm.HomeProvidedAmount > .01
			THEN 'Y'
			ELSE 'N'
	 END) 'HP',
	 ate.PortalRegisteredInd,
	 ate.ChpElectionInd
INTO #temp
FROM [CPS_DW_STAGE].[dbo].[AcrToolEmployer] ate
	INNER JOIN [CPS_DW_STAGE].[dbo].[AcrToolMember] atm
		ON ate.EmployerNumber = atm.EmployerNumber
WHERE NOT EXISTS (	SELECT EmployerNumber
					FROM [CPS_DW].[dbo].[EmployerAcrExclusion] ear
					WHERE ate.[EmployerNumber] = ear.[EmployerNumber]
						and (
								(ear.IcInd = 'Y')
									 or
								(ear.AcrCode in ('EDF','DOWNLOAD','NONE'))
							)
				)
	

SELECT 
	tp.PROCESS_LEVEL,
	NAME,
	ADDR1,
	ADDR2,
	ADDR3,
	CITY,
	STATE,
	ZIP,
	CRP_EFF,
	CHP_EFF,
	CHPHRS,
	EMPLOYEE,
	FIRST_NAME,
	LAST_NAME,
	tp.PAY_RATE,
	STAND_HOURS,
	HP,
	PortalRegisteredInd,
	ChpElectionInd
FROM #temp tp
	INNER JOIN [INFORBCDB01].[LSLMDB].[ls_apps].[PRSYSTEM] prs
		on	tp.PROCESS_LEVEL = prs.PROCESS_LEVEL COLLATE DATABASE_DEFAULT
*/













/*
------------------------------------------- Employer -------------------------------
-----------------------------
-- PRSYSTEM
-----------------------------
--DROP TABLE #t_pl
select DISTINCT PROCESS_LEVEL
INTO #t_pl
FROM [dbo].[DIM_PRSYSTEM]
WHERE ISNUMERIC(PROCESS_LEVEL) = 1


--drop table #t2
select distinct
	prs.PROCESS_LEVEL,
	prs.NAME,
	prs.ADDR1,
	prs.ADDR2,
	prs.ADDR3,
	prs.CITY,
	prs.STATE,
	prs.ZIP,
	'Y' CRP_PART,
	CASE WHEN LEFT(pap.USER_LEVEL,3) = 'NON'
			THEN 'N'
			ELSE 'Y'
	END as CHP_PART,
	pap.OBJ_ID,
	pap.END_DATE
into #t2
from #t_pl t
	inner join [dbo].[DIM_PRSYSTEM] prs
		on  t.PROCESS_LEVEL = prs.PROCESS_LEVEL
	inner join [dbo].[DIM_PAPOSITION] pap
		on	prs.COMPANY		  = pap.COMPANY	AND
			prs.PROCESS_LEVEL = pap.R_POSITION
where (pap.SHIFT IN ('1','3'))
   and (year(pap.END_DATE) = 1753)
order by prs.PROCESS_LEVEL


--DROP TABLE #TKEY
select
 COMPANY,
 TYPE,
 OBJ_ID,
 FIELD_KEY,
 MAX(EFFECT_DATE) AS EFFECT_DATE,
 END_DATE,
 A_FIELD,
 D_FIELD
into #tkey
from [dbo].[DIM_HRPOSUSD] hr
where (hr.FIELD_KEY IN ('84','85','95'))
  and (year(hr.END_DATE) = 1753)
  and (A_FIELD <> 'NOCHP')
GROUP BY COMPANY,TYPE,OBJ_ID,FIELD_KEY,END_DATE,A_FIELD,D_FIELD


--SELECT * FROM #tkey
--  SELECT * FROM #tkey where obj_id = 1815
  --select obj_Id, count(obj_id)
  --from #tkey 
  --group by obj_id
  --having count(obj_id) > 3
  --order by obj_id

 
--drop table #t_employer
select 
 	pap.PROCESS_LEVEL,
	pap.NAME,
	pap.ADDR1,
	pap.ADDR2,
	pap.ADDR3,
	pap.CITY,
	pap.STATE,
	pap.ZIP,
	pap.CRP_PART,
	pap.CHP_PART,
	CRP_EFF = (select tk.D_FIELD
				FROM #T2 t2
					inner join #tkey tk
						on t2.OBJ_ID     = tk.OBJ_ID   and
							t2.END_DATE  = tk.END_DATE and
							tk.FIELD_KEY = '84' and
							t2.PROCESS_LEVEL = pap.PROCESS_LEVEL),
	CHP_EFF = (select tk.D_FIELD
				FROM #T2 t2
					inner join #tkey tk
						on t2.OBJ_ID     = tk.OBJ_ID   and
							t2.END_DATE  = tk.END_DATE and
							tk.FIELD_KEY = '85' and
							t2.PROCESS_LEVEL = pap.PROCESS_LEVEL),
	CHPHRS = (select tk.A_FIELD
				FROM #T2 t2
					inner join #tkey tk
						on t2.OBJ_ID     = tk.OBJ_ID   and
							t2.END_DATE  = tk.END_DATE and
							tk.FIELD_KEY = '95' and
							t2.PROCESS_LEVEL = pap.PROCESS_LEVEL)

into #t_employer
from #t2 pap



------------------------------------------- Employee -------------------------------
-----------------------------
-- EMPLOYEE
-----------------------------
select
	empr.*,
	empe.EMPLOYEE,
	empe.FIRST_NAME,
	empe.LAST_NAME,
	empe.PAY_RATE,
	empe.STAND_HOURS,
	case when pae.BEN_SALARY_2 > 1
			THEN 'Y'
			ELSE 'N'
	end as HP
into #t4
from #t_employer empr
	inner join [dbo].[DIM_EMPLOYEE] empe
		on empr.PROCESS_LEVEL = empe.PROCESS_LEVEL
	inner join [dbo].[DIM_PAEMPLOYEE] pae
		on empe.EMPLOYEE = pae.EMPLOYEE


--SELECT * FROM #t4 ORDER BY PROCESS_LEVEL


-- omit records that are marked not to receive ACR
--DROP TABLE #t5
select #t4.*
into #t5
from #t4
WHERE NOT EXISTS (select acr.PROCESS_LEVEL
				  from [dbo].[ACR_ProcessLevel] acr
				  where #t4.PROCESS_LEVEL = acr.PROCESS_LEVEL)


--select * from #t5 where process_level = '00016'

--drop table #t6
select 
	t.process_level,
	count(t.Employee) as EEcnt
into #t6
from #t5 t
--where process_level = '00016'
group by t.process_level
order by t.process_level


select 
	#t5.*,
	#t6.EEcnt
from #t5
	inner join #t6 
		on #t5.PROCESS_LEVEL = #t6.PROCESS_LEVEL
order by #t5.PROCESS_LEVEL
*/


GO
