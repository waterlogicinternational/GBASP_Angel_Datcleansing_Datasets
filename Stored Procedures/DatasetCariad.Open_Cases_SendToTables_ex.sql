SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


--NEED TO MAKE THE TABLES FOR THE NEXT ITEM IN THE PROCESS--

/*=============================================
  Author:      RYFE
  Description: Retrieve cases from CARIAD
--			   RYFE 05-07-2022
=============================================*/
CREATE PROCEDURE [DatasetCariad].[Open_Cases_SendToTables_ex]
AS
BEGIN
SET NOCOUNT ON;

	DECLARE @MIG_SITENAME varchar(5) = 'GBCA1';
	DECLARE @CASELOCALID INT         = 2130930  --NEED TO CHECK THIS EACH TIME FROM THE MAX CASE ID IN THE TARGET ENVIRONMENT
	--DECLARE @CUTDATE varchar (10)    = '2022-03-25'
	--DECLARE @CUTOFFDATE VARCHAR(10)  = '2020-11-15'
	--DECLARE @FilterMode int = Dataset.Filter_Mode('dc','Customer');

	---------------- Delete records already in the loading table for this site -----------------------------------------------
	BEGIN TRANSACTION
		DELETE FROM [Dataset].[Open_Cases_ex] 
		WHERE MIG_SITE_NAME = @MIG_SITENAME
		DELETE FROM [Dataset].[Open_Cases_Object_ex]
		WHERE MIG_SITE_NAME = @MIG_SITENAME

		COMMIT TRANSACTION
	---------------- Add records to the loading table ---------------------------------------------------------
	INSERT into	[Dataset].[Open_Cases_ex]
	( [MIG_SITE_NAME],
	  [CASE_LOCAL_ID],
	  [TITLE],
	  [CONTACT_DATE],
	  [ORGANIZATION_ID],
	  [SHOW_EXTERNALLY],
	  [DESCRIPTION],
	  [CASE_CATEGORY_ID_DB],
	  [TYPE_ID_DB],
	  [OUR_SEVERITY_DB],
	  [OUR_PRIORITY],
	  [CUSTOMER_SEVERITY_DB],
	  [OWNER],
	  [CUSTOMER_ID],
	  [CUSTOMER_SUPPORT_ORG],
	  [CALLER_EMAIL],
	  [LANG_CODE_DB],
	  [SECOND_CATEGORY],
	  [CONTACT_NAME],
	  [NX_CASE_STATUS],
	  [NX_LEGACY_CASE_ID]
	)

	---TAB 10 QUIT TAB SECTION---
	SELECT
DISTINCT
--THIS IS CURRENT CASE MIGRATION JOB LOAD TEMPLATE--
'GBCA1'					AS MIG_SITE_NAME,
 @CASELOCALID	        AS CASE_LOCAL_ID,

				
trim(TITLE)		        AS TITLE,

						
CONTACT_DATE			AS CONTACT_DATE,      --if error change to sysdate -- RYFE 31/03/2022Changed to Next date defect IFSDEF0017330
'UKWL'					AS ORGANIZATION_ID,
ISNULL(SHOW_EXTERNALLY,'TRUE')			AS SHOW_EXTERNALLY,   --tick box do we want true or false--
ISNULL([DESCRIPTION],'') + ' ' + CASE_LOCAL_ID		AS DESCRIPTION,
						
ISNULL(CASE_CATEGORY_ID_DB,'')		AS CASE_CATEGORY_ID_DB,   -- is this to be hardcoded, are we only ever loading retention requests in 323 Resolution 110 Invoice Dispute 
TYPE_ID_DB				AS TYPE_ID_DB,            -- is this to be hardcoded as global/local etc - changed to global
OUR_SEVERITY_DB			AS OUR_SEVERITY_DB,       -- is this to be hardcoded as 3 day sla
OUR_PRIORITY_DB			AS OUR_PRIORITY,          -- is this to be hardcoded as 3 normal
ISNULL(CUSTOMER_SEVERITY_DB,'103')	AS CUSTOMER_SEVERITY_DB,  -- is this the same value as our severity
[OWNER]                   AS OWNER,  --SCREENSHOT 8 OF 11
CUSTOMER_ID				AS CUSTOMER_ID,																																					--SCREENSHOT 1 OF 11
'UKWL'					AS CUSTOMER_SUPPORT_ORG,  --is this UKWL as per ORGANIZATION_ID
ISNULL(CALLER_EMAIL,'')		AS CALLER_EMAIL,          -- IS THIS REQUIRED TO BE POPULATED
'en'					AS LANG_CODE_DB,

CASE ISNULL(SECOND_CATEGORY,'') 
WHEN 'Slow Dispense' THEN 'Irregular Dispensing'
WHEN 'Tripping Electrics' THEN 'Power / Electricial Failure Issue'
WHEN 'Leaking from the pipework' THEN 'Leak: External / Pipework'
WHEN 'Not Dispensing' THEN 'Irregular Dispensing'
WHEN 'Leaking from the unit' THEN 'Leak: From the Unit'
WHEN 'Not Chilling' THEN 'Not Cooling'
WHEN 'Missing Part' THEN 'Faulty / Broken Part'
WHEN 'Broken Part' THEN 'Faulty / Broken Part'
ELSE ISNULL(SECOND_CATEGORY,'') 
END                     AS SECOND_CATEGORY,  -- screenshot 3 of 11 (dropwdown in ifs doesnt seem to have any values- how does this work)

ISNULL(CONTACT_NAME,'')    AS CONTACT_NAME ,      -- 6 of 11

CASE
 WHEN UPPER(NX_CASE_STATUS) IN ('CANCELLED', 'CLOSED', 'COMPLETED')
      THEN  'CLOSED'
 
      ELSE UPPER(NX_CASE_STATUS)
	  END	
	  AS NX_CASE_STATUS,
						

CASE_LOCAL_ID 			AS NX_LEGACY_CASE_ID

FROM OPENQUERY (CARIAD, 'SELECT 
       CASE_LOCAL_ID,
       TITLE,
       CONTACT_DATE,
       ORGANIZATION_ID,      --IS CCW A THING IN MLIV (UKWL?)
       SHOW_EXTERNALLY,      --WHERE IS THIS IN CARIAD OR DO WE JUST DEFAULT TO FALSE?
       DESCRIPTION,
       CASE_CATEGORY_ID_DB,  --ARE THESE CATEGORY ID DB VALUES IN SYNC WITH MLIV BASE DATA?
	   CASE_CATEGORY_ID,
       TYPE_ID_DB,
       OUR_SEVERITY_DB,
       OUR_PRIORITY_DB,
       CUSTOMER_SEVERITY_DB,
       OWNER,                --THESE USERS SHOULD BE SET UP IN MLIV?
       CUSTOMER_ID,          --SHOULD BE CATERED FOR WITH CUSTOMER MAPPING IN ETL
       CUSTOMER_SUPPORT_ORG, --IS CCW A THING IN MLIV (UKWL?)
       CALLER_EMAIL,
       ''en'' as LANG_CODE_DB,
       CF$_SECOND_CATEGORY AS SECOND_CATEGORY,
       --CN.full_name AS CONTACT_NAME, --WHERE IS THIS HELD
	   (SELECT full_name from CC_CASE_CONTACT CN WHERE CN.CASE_ID = C.CASE_ID and ROWNUM = 1 ) AS CONTACT_NAME,
       OBJSTATE AS NX_CASE_STATUS,   --WHERE IS THIS HELD
       CASE_LOCAL_ID AS NX_LEGACY_CASE_ID
 
  FROM cc_case_CFV C
  --JOIN CC_CASE_CONTACT CN
  --ON C.CASE_ID = CN.CASE_ID
 where case_local_id in (''GLB108594'',
''GLB108840'',
''GLB109095'',
''GLB109090'',
''GLB109006'',
''GLB108661'',
''GLB108601'',
''GLB108998'',
''GLB108775'',
''GLB108557'',
''GLB108997'',
''GLB108719'',
''GLB108457'',
''GLB109056'',
''GLB109092'',
''GLB108940'',
''GLB109079'',
''GLB108905'',
''GLB108372'',
''GLB108582'',
''GLB108941'',
''GLB109062'',
''GLB109147'',
''GLB109146'',
''GLB108778'',
''GLB108370'',
''GLB108932'',
''GLB108897'',
''GLB109025'',
''GLB108371'',
''GLB109005'',
''GLB108896'',
''GLB108493'',
''GLB108490'',
''GLB108492'',
''GLB108455'',
''GLB108684'',
''GLB108428'',
''GLB108832'',
''GLB108890'',
''GLB109049'',
''GLB109035'',
''GLB108931'',
''GLB109173'',
''GLB109172'',
''GLB108889'',
''GLB109001'',
''GLB109176'',
''GLB109175'',
''GLB109089'',
''GLB108614'',
''GLB109105'',
''GLB108341'',
''GLB108049'',
''GLB109074'',
''GLB109107'',
''GLB109124'',
''GLB109136'',
''GLB109120'',
''GLB109164'',
''GLB109132'',
''GLB109133'',
''GLB109134'',
''GLB109131'',
''GLB109108'',
''GLB109106'',
''GLB109113'',
''GLB108954'',
''GLB109109'',
''GLB109114'',
''GLB109068'',
''GLB109130'',
''GLB109152'',
''GLB109138'',
''GLB109139'',
''GLB109140'',
''GLB109141'',
''GLB109143'',
''GLB109144'',
''GLB109145'',
''GLB108628'',
''GLB108486'',
''GLB108487'',
''GLB108481'',
''GLB108532'',
''GLB108350'',
''GLB108544'',
''GLB108550'',
''GLB108498'',
''GLB108520'',
''GLB108276'',
''GLB108292'',
''GLB108278'',
''GLB108497'',
''GLB108584'',
''GLB108416'',
''GLB108542'',
''GLB108508'',
''GLB108297'',
''GLB108298'',
''GLB108503'',
''GLB108501'',
''GLB108535'',
''GLB108482'',
''GLB108495'',
''GLB108502'',
''GLB108525'',
''GLB108528'',
''GLB108471'',
''GLB108268'',
''GLB108468'',
''GLB108585'',
''GLB108540'',
''GLB108509'',
''GLB108378'',
''GLB108539'',
''GLB108494'',
''GLB108533'',
''GLB108530'',
''GLB108531'',
''GLB108466'',
''GLB108510'',
''GLB108356'',
''GLB108470'',
''GLB108472'',
''GLB108500'',
''GLB108518'',
''GLB108274'',
''GLB108275'',
''GLB108561'',
''GLB108272'',
''GLB108483'',
''GLB108277'',
''GLB108395'',
''GLB108548'',
''GLB108549'',
''GLB108551'',
''GLB108437'',
''GLB108521'',
''GLB108537'',
''GLB108523'',
''GLB108517'',
''GLB108499'',
''GLB108511'',
''GLB108475'',
''GLB108653'',
''GLB108602'',
''GLB108349'',
''GLB108547'',
''GLB108541'',
''GLB108546'',
''GLB108477'',
''GLB108269'',
''GLB108271'',
''GLB108545'',
''GLB108586'',
''GLB108645'',
''GLB108488'',
''GLB108496'',
''GLB108506'',
''GLB108640'',
''GLB108293'',
''GLB108479'',
''GLB108440'',
''GLB108639'',
''GLB108480'',
''GLB108485'',
''GLB108536'',
''GLB108491'',
''GLB108476'',
''GLB108524'',
''GLB108526'',
''GLB108527'',
''GLB108513'',
''GLB108300'',
''GLB108484'',
''GLB108534'',
''GLB108273'',
''GLB108507'',
''GLB108514'',
''GLB108270'',
''GLB108467'',
''GLB108654'',
''GLB108516'',
''GLB108538'',
''GLB108933'',
''GLB108732'',
''GLB108914'',
''GLB108106'',
''GLB108172'',
''GLB108784'',
''GLB108141'',
''GLB108906'',
''GLB109053'',
''GLB109084'',
''GLB108136'',
''GLB109007'',
''GLB108749'',
''GLB108883'',
''GLB108450'',
''GLB108792'',
''GLB109051'',
''GLB109052'',
''GLB108142'',
''GLB108907'',
''GLB109054'',
''GLB109085'',
''GLB108887'',
''GLB108267'',
''GLB109036'',
''GLB109065'',
''GLB107116'',
''GLB107029'',
''GLB109174'',
''GLB109177'',
''GLB108648'',
''GLB109023'',
''GLB109070'',
''GLB109080'',
''GLB109170'',
''GLB108076'',
''GLB108943'',
''GLB109179'',
''GLB109171'',
''GLB109126'',
''GLB106832'',
''GLB109166'',
''GLB109161'',
''GLB109168'',
''GLB109169'',
''GLB109165'',
''GLB109167'',
''GLB109163'',
''GLB108920'',
''GLB108921'',
''GLB109150'',
''GLB109148'',
''GLB109137'',
''GLB109142'',
''GLB109135'',
''GLB109153'',
''GLB109157'',
''GLB109156'',
''GLB109159'',
''GLB109155'',
''GLB109158'',
''GLB109149'',
''GLB109125'',
''GLB109128'',
''GLB109129'',
''GLB108942'',
''GLB109110'',
''GLB109123'',
''GLB109112'',
''GLB109111'',
''GLB107995'',
''GLB109121'',
''GLB109116'',
''GLB109115'',
''GLB109104'',
''GLB109100'',
''GLB109101'',
''GLB109087'',
''GLB109086'',
''GLB109094'',
''GLB108899'',
''GLB108951'',
''GLB109097'',
''GLB109088'',
''GLB109002'',
''GLB109091'',
''GLB109093'',
''GLB109096'',
''GLB109098'',
''GLB109099'',
''GLB108808'',
''GLB109082'',
''GLB108816'',
''GLB109081'',
''GLB109055'',
''GLB109078'',
''GLB109067'',
''GLB109075'',
''GLB109069'',
''GLB109076'',
''GLB109072'',
''GLB109073'',
''GLB109077'',
''GLB109064'',
''GLB109010'',
''GLB109063'',
''GLB109033'',
''GLB109026'',
''GLB109047'',
''GLB109048'',
''GLB109046'',
''GLB108783'',
''GLB109041'',
''GLB109039'',
''GLB109040'',
''GLB109043'',
''GLB109038'',
''GLB108826'',
''GLB108828'',
''GLB109044'',
''GLB109029'',
''GLB109032'',
''GLB109027'',
''GLB109031'',
''GLB108731'',
''GLB108928'',
''GLB109028'',
''GLB109024'',
''GLB109018'',
''GLB109011'',
''GLB109013'',
''GLB109017'',
''GLB109022'',
''GLB109020'',
''GLB109016'',
''GLB109012'',
''GLB107884'',
''GLB109009'',
''GLB109008'',
''GLB109014'',
''GLB109015'',
''GLB109021'',
''GLB108885'',
''GLB107377'',
''GLB107170'',
''GLB108944'',
''GLB108945'',
''GLB108915'',
''GLB108910'',
''GLB108624'',
''GLB108903'',
''GLB108362'',
''GLB108834'',
''GLB108869'',
''GLB108851'',
''GLB108853'',
''GLB108852'',
''GLB108710'',
''GLB108789'',
''GLB108612'',
''GLB108804'',
''GLB108791'',
''GLB108798'',
''GLB108797'',
''GLB108790'',
''GLB108206'',
''GLB108720'',
''GLB108768'',
''GLB108761'',
''GLB108419'',
''GLB108100'',
''GLB108603'',
''GLB108574'',
''GLB108401'',
''GLB108020'',
''GLB108439'',
''GLB108575'',
''GLB108552'',
''GLB108453'',
''GLB107589'',
''GLB108445'',
''GLB107171'',
''GLB108438'',
''GLB108429'',
''GLB108360'',
''GLB108243'',
''GLB108291'',
''GLB108364'',
''GLB108170'',
''GLB108304'',
''GLB108287'',
''GLB108282'',
''GLB108137'',
''GLB107988'',
''GLB108074'',
''GLB108188'',
''GLB107656'',
''GLB108121'',
''GLB107536''
)
						 ')

		  
  UPDATE [Dataset].[Open_Cases_ex]
  SET CASE_LOCAL_ID = @CASELOCALID,@CASELOCALID = @CASELOCALID + 1
--  set interfaceID  = @i , @i = @i + 1
  WHERE MIG_SITE_NAME = 'GBCA1'


  --Insert the equipment from the quititem table.

  INSERT into	[Dataset].[Open_Cases_Object_ex]
	(  [MIG_SITE_NAME]
      ,[LEGACY_CASE_ID]
      ,[OBJECT_TYPE]
      ,[SITE]
      ,[OBJECT_ID]
	)


SELECT
DISTINCT
--THIS IS CURRENT CASE MIGRATION JOB LOAD TEMPLATE--
'GBCA1'					AS MIG_SITE_NAME
,LEGACY_CASE_ID			AS LEGACY_CASE_ID
,'EQUIPMENT'			AS OBJECT_TYPE
,'UK300'				AS [SITE]
,[OBJECT_ID]			AS [OBJECT_ID]

FROM OPENQUERY (CARIAD, 'SELECT 
        C.CASE_LOCAL_ID AS  LEGACY_CASE_ID ,
       REF_ID1 AS  OBJECT_ID 
	   
  FROM CC_CASE_BUSINESS_OBJECT O
  JOIN cc_case_CFV C
    ON O.CASE_ID = C.CASE_ID
 WHERE BUSINESS_OBJECT_ID = ''4''
 AND C.case_local_id in (''GLB108594'',
''GLB108840'',
''GLB109095'',
''GLB109090'',
''GLB109006'',
''GLB108661'',
''GLB108601'',
''GLB108998'',
''GLB108775'',
''GLB108557'',
''GLB108997'',
''GLB108719'',
''GLB108457'',
''GLB109056'',
''GLB109092'',
''GLB108940'',
''GLB109079'',
''GLB108905'',
''GLB108372'',
''GLB108582'',
''GLB108941'',
''GLB109062'',
''GLB109147'',
''GLB109146'',
''GLB108778'',
''GLB108370'',
''GLB108932'',
''GLB108897'',
''GLB109025'',
''GLB108371'',
''GLB109005'',
''GLB108896'',
''GLB108493'',
''GLB108490'',
''GLB108492'',
''GLB108455'',
''GLB108684'',
''GLB108428'',
''GLB108832'',
''GLB108890'',
''GLB109049'',
''GLB109035'',
''GLB108931'',
''GLB109173'',
''GLB109172'',
''GLB108889'',
''GLB109001'',
''GLB109176'',
''GLB109175'',
''GLB109089'',
''GLB108614'',
''GLB109105'',
''GLB108341'',
''GLB108049'',
''GLB109074'',
''GLB109107'',
''GLB109124'',
''GLB109136'',
''GLB109120'',
''GLB109164'',
''GLB109132'',
''GLB109133'',
''GLB109134'',
''GLB109131'',
''GLB109108'',
''GLB109106'',
''GLB109113'',
''GLB108954'',
''GLB109109'',
''GLB109114'',
''GLB109068'',
''GLB109130'',
''GLB109152'',
''GLB109138'',
''GLB109139'',
''GLB109140'',
''GLB109141'',
''GLB109143'',
''GLB109144'',
''GLB109145'',
''GLB108628'',
''GLB108486'',
''GLB108487'',
''GLB108481'',
''GLB108532'',
''GLB108350'',
''GLB108544'',
''GLB108550'',
''GLB108498'',
''GLB108520'',
''GLB108276'',
''GLB108292'',
''GLB108278'',
''GLB108497'',
''GLB108584'',
''GLB108416'',
''GLB108542'',
''GLB108508'',
''GLB108297'',
''GLB108298'',
''GLB108503'',
''GLB108501'',
''GLB108535'',
''GLB108482'',
''GLB108495'',
''GLB108502'',
''GLB108525'',
''GLB108528'',
''GLB108471'',
''GLB108268'',
''GLB108468'',
''GLB108585'',
''GLB108540'',
''GLB108509'',
''GLB108378'',
''GLB108539'',
''GLB108494'',
''GLB108533'',
''GLB108530'',
''GLB108531'',
''GLB108466'',
''GLB108510'',
''GLB108356'',
''GLB108470'',
''GLB108472'',
''GLB108500'',
''GLB108518'',
''GLB108274'',
''GLB108275'',
''GLB108561'',
''GLB108272'',
''GLB108483'',
''GLB108277'',
''GLB108395'',
''GLB108548'',
''GLB108549'',
''GLB108551'',
''GLB108437'',
''GLB108521'',
''GLB108537'',
''GLB108523'',
''GLB108517'',
''GLB108499'',
''GLB108511'',
''GLB108475'',
''GLB108653'',
''GLB108602'',
''GLB108349'',
''GLB108547'',
''GLB108541'',
''GLB108546'',
''GLB108477'',
''GLB108269'',
''GLB108271'',
''GLB108545'',
''GLB108586'',
''GLB108645'',
''GLB108488'',
''GLB108496'',
''GLB108506'',
''GLB108640'',
''GLB108293'',
''GLB108479'',
''GLB108440'',
''GLB108639'',
''GLB108480'',
''GLB108485'',
''GLB108536'',
''GLB108491'',
''GLB108476'',
''GLB108524'',
''GLB108526'',
''GLB108527'',
''GLB108513'',
''GLB108300'',
''GLB108484'',
''GLB108534'',
''GLB108273'',
''GLB108507'',
''GLB108514'',
''GLB108270'',
''GLB108467'',
''GLB108654'',
''GLB108516'',
''GLB108538'',
''GLB108933'',
''GLB108732'',
''GLB108914'',
''GLB108106'',
''GLB108172'',
''GLB108784'',
''GLB108141'',
''GLB108906'',
''GLB109053'',
''GLB109084'',
''GLB108136'',
''GLB109007'',
''GLB108749'',
''GLB108883'',
''GLB108450'',
''GLB108792'',
''GLB109051'',
''GLB109052'',
''GLB108142'',
''GLB108907'',
''GLB109054'',
''GLB109085'',
''GLB108887'',
''GLB108267'',
''GLB109036'',
''GLB109065'',
''GLB107116'',
''GLB107029'',
''GLB109174'',
''GLB109177'',
''GLB108648'',
''GLB109023'',
''GLB109070'',
''GLB109080'',
''GLB109170'',
''GLB108076'',
''GLB108943'',
''GLB109179'',
''GLB109171'',
''GLB109126'',
''GLB106832'',
''GLB109166'',
''GLB109161'',
''GLB109168'',
''GLB109169'',
''GLB109165'',
''GLB109167'',
''GLB109163'',
''GLB108920'',
''GLB108921'',
''GLB109150'',
''GLB109148'',
''GLB109137'',
''GLB109142'',
''GLB109135'',
''GLB109153'',
''GLB109157'',
''GLB109156'',
''GLB109159'',
''GLB109155'',
''GLB109158'',
''GLB109149'',
''GLB109125'',
''GLB109128'',
''GLB109129'',
''GLB108942'',
''GLB109110'',
''GLB109123'',
''GLB109112'',
''GLB109111'',
''GLB107995'',
''GLB109121'',
''GLB109116'',
''GLB109115'',
''GLB109104'',
''GLB109100'',
''GLB109101'',
''GLB109087'',
''GLB109086'',
''GLB109094'',
''GLB108899'',
''GLB108951'',
''GLB109097'',
''GLB109088'',
''GLB109002'',
''GLB109091'',
''GLB109093'',
''GLB109096'',
''GLB109098'',
''GLB109099'',
''GLB108808'',
''GLB109082'',
''GLB108816'',
''GLB109081'',
''GLB109055'',
''GLB109078'',
''GLB109067'',
''GLB109075'',
''GLB109069'',
''GLB109076'',
''GLB109072'',
''GLB109073'',
''GLB109077'',
''GLB109064'',
''GLB109010'',
''GLB109063'',
''GLB109033'',
''GLB109026'',
''GLB109047'',
''GLB109048'',
''GLB109046'',
''GLB108783'',
''GLB109041'',
''GLB109039'',
''GLB109040'',
''GLB109043'',
''GLB109038'',
''GLB108826'',
''GLB108828'',
''GLB109044'',
''GLB109029'',
''GLB109032'',
''GLB109027'',
''GLB109031'',
''GLB108731'',
''GLB108928'',
''GLB109028'',
''GLB109024'',
''GLB109018'',
''GLB109011'',
''GLB109013'',
''GLB109017'',
''GLB109022'',
''GLB109020'',
''GLB109016'',
''GLB109012'',
''GLB107884'',
''GLB109009'',
''GLB109008'',
''GLB109014'',
''GLB109015'',
''GLB109021'',
''GLB108885'',
''GLB107377'',
''GLB107170'',
''GLB108944'',
''GLB108945'',
''GLB108915'',
''GLB108910'',
''GLB108624'',
''GLB108903'',
''GLB108362'',
''GLB108834'',
''GLB108869'',
''GLB108851'',
''GLB108853'',
''GLB108852'',
''GLB108710'',
''GLB108789'',
''GLB108612'',
''GLB108804'',
''GLB108791'',
''GLB108798'',
''GLB108797'',
''GLB108790'',
''GLB108206'',
''GLB108720'',
''GLB108768'',
''GLB108761'',
''GLB108419'',
''GLB108100'',
''GLB108603'',
''GLB108574'',
''GLB108401'',
''GLB108020'',
''GLB108439'',
''GLB108575'',
''GLB108552'',
''GLB108453'',
''GLB107589'',
''GLB108445'',
''GLB107171'',
''GLB108438'',
''GLB108429'',
''GLB108360'',
''GLB108243'',
''GLB108291'',
''GLB108364'',
''GLB108170'',
''GLB108304'',
''GLB108287'',
''GLB108282'',
''GLB108137'',
''GLB107988'',
''GLB108074'',
''GLB108188'',
''GLB107656'',
''GLB108121'',
''GLB107536''
)
						   ')


END

GO
