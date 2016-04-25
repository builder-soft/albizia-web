drop procedure if exists pUpdateData_Temp;
DELIMITER $$
create procedure pUpdateData_Temp()
begin
	DECLARE vTemp BIGINT(20);
 
	insert into tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('ENTERPRISE', 'Empresas', null, null, null, 1, 0, true, false);
	
	insert into tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('ENTERPRISE_DATA', 'Datos básicos', 'ALBIZIA_CONTEXT', '/servlet/albizia/manager/Enterprise', null, 1, 0, true, false);
	
	insert into tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('BRANCH', 'Sucursales', 'ALBIZIA_CONTEXT', '/servlet/albizia/manager/Branch', null, 1, 0, true, false);

/*	insert into tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('COST_CENTER', 'Centro de costo', 'ALBIZIA_CONTEXT', '/servlet/config/enterprise/costCenter/CostCenterManager', null, 1, 0, true, false);
*/
	insert into tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('COST_CENTER', 'Centro de costo', 'DALEA_CONTEXT', '/servlet/config/employee/AreaManager', null, 1, 0, false, false);
	
	insert into tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('REMUNERATION', 'Remuneracion', null, NULL, NULL, 1, 0, true, false);

	INSERT INTO tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('PERIODS', 'Periodos', 'ALBIZIA_CONTEXT', '/servlet/admin/period/PeriodManager', null, 1, 0, true, false);
	
	INSERT INTO tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('ASSET_DISCOUNT', 'Haberes y descuentos', 'ALBIZIA_CONTEXT', '/servlet/albizia/manager/AssetDiscount', null, 1, 0, true, false);
	
	INSERT INTO tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('CONTRACT_TYPES', 'Tipos de contratos', 'ALBIZIA_CONTEXT', '/servlet/albizia/manager/ContractType', null, 1, 0, true, false);
	
	INSERT INTO tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('GRATIFICATION', 'Gratificacion', 'ALBIZIA_CONTEXT', '/servlet/albizia/manager/GratificationType', null, 1, 0, true, false);
	
	INSERT INTO tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('INDICATOR', 'Indicadores', 'ALBIZIA_CONTEXT', null, null, 1, 0, true, false);

	INSERT INTO tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('HEALTH', 'Sistemas de salud', 'ALBIZIA_CONTEXT', '/servlet/config/health/HealthManager', null, 1, 0, true, false);
	
	INSERT INTO tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('PFM', 'AFP', 'ALBIZIA_CONTEXT', '/servlet/config/pfm/PFMManager', null, 1, 0, true, false);
	
	INSERT INTO tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('CROSS', 'Generales', null, NULL, null, 1, 0, true, false);
	
	INSERT INTO tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('PROCESS', 'Procesos', null, NULL, null, 1, 0, true, false);
	
	INSERT INTO tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('SALARY', 'Calculo Salario', 'ALBIZIA_CONTEXT', '/servlet/remuneration/process/salary/ProcessSalary', null, 1, 0, true, false);
	
	
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'FILES';
	update tOption SET cParent = vTemp WHERE cKey = 'ENTERPRISE';
	
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'ENTERPRISE';
	update tOption SET cParent = vTemp WHERE cKey IN ('ENTERPRISE_DATA', 'BRANCH', 'COST_CENTER', 'AREA', 'POST');
	
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'FILES';
	update tOption SET cParent = vTemp WHERE cKey = 'CROSS';
	
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'CROSS';
	update tOption SET cParent = vTemp WHERE cKey IN('COMUNA','FISCAL_DATE','LICENSE_CAUSE','GROUP_MGR');
	
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'CONFIG';
	update tOption SET cParent = vTemp WHERE cKey = 'REMUNERATION';

	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'REMUNERATION';
	update tOption SET cParent = vTemp WHERE cKey IN ('PERIODS', 'ASSET_DISCOUNT', 'CONTRACT_TYPES', 'GRATIFICATION', 'INDICATOR', 'HEALTH', 'PFM');

	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'PROCESS';
	update tOption SET cParent = vTemp WHERE cKey = 'SALARY';
	
	
	update tOption SET cOrder=10 WHERE cKey ='ENTERPRISE';
	update tOption SET cOrder=20 WHERE cKey ='EMPLOYEE';
	update tOption SET cOrder=30 WHERE cKey ='CROSS';
	
	update tOption SET cOrder=10 WHERE cKey ='ENTERPRISE_DATA';
	update tOption SET cOrder=20 WHERE cKey ='BRANCH';
	update tOption SET cOrder=30 WHERE cKey ='COST_CENTER';
	update tOption SET cOrder=40 WHERE cKey ='AREA';
	update tOption SET cOrder=50 WHERE cKey ='POST';
	
	update tOption SET cOrder=10 WHERE cKey ='COMUNA';
	update tOption SET cOrder=20 WHERE cKey ='FISCAL_DATE';
	update tOption SET cOrder=30 WHERE cKey ='LICENSE_CAUSE';
	update tOption SET cOrder=40 WHERE cKey ='GROUP_MGR';

	update tOption SET cOrder=10 WHERE cKey ='SECURITY';
	update tOption SET cOrder=20 WHERE cKey ='DOMAIN';
	update tOption SET cOrder=30 WHERE cKey ='ATTENDANCE';
	update tOption SET cOrder=40 WHERE cKey ='REMUNERATION';
	
	update tOption SET cOrder=10 WHERE cKey ='PERIODS';
	update tOption SET cOrder=20 WHERE cKey ='ASSET_DISCOUNT';
	update tOption SET cOrder=30 WHERE cKey ='CONTRACT_TYPES';
	update tOption SET cOrder=40 WHERE cKey ='GRATIFICATION';
	update tOption SET cOrder=50 WHERE cKey ='INDICATOR';
	update tOption SET cOrder=60 WHERE cKey ='HEALTH';
	update tOption SET cOrder=70 WHERE cKey ='PFM';

	update tOption SET cOrder=10 WHERE cKey ='FILES';
	update tOption SET cOrder=20 WHERE cKey ='CONFIG';
	update tOption SET cOrder=30 WHERE cKey ='REPORT';
	update tOption SET cOrder=40 WHERE cKey ='PROCESS';
	
	
	
	update tOption SET cLabel='Colaboradores' WHERE cKey ='EMPLOYEE';
	
	/*
	update tOption set cEnable = false where ckey = 'CH_PASS';
	
	delete from toption where ckey = 'FILES';
	insert into tOption(cKey, cLabel, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) VALUES('FILES', 'Archivos', NULL, NULL, 1, 1, true, 0);
	
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'FILES';
	update tOption SET cURL = null, cParent=vTemp WHERE cKey = 'EMPLOYEE';
	
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'EMPLOYEE';
	
	insert into tOption(cKey, cLabel, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('EMPLOYEE_DATA', 'Datos Básicos', '/servlet/config/employee/EmployeeManager', vTemp, 1, 1, true, 0);
	
	insert into tOption(cKey, cLabel, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('EMPLOYEE_LICENSE', 'Licencias', '/servlet/config/employee/EmployeeLicenseManager', vTemp, 1, 2, true, 0);

	insert into tOption(cKey, cLabel, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('EMPLOYEE_TURN', 'Turnos', '/servlet/config/employee/EmployeeTurnManager', vTemp, 1, 3, true, 0);
	
	insert into tOption(cKey, cLabel, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('EMPLOYEE_MARK', 'Marcas', '/servlet/config/employee/EmployeeMarkManager', vTemp, 1, 4, true, 0);
	
	insert into tOption(cKey, cLabel, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('EMPLOYEE_DETACHED', 'Desvinculado', '/servlet/config/employee/EmployeeDetachedManager', vTemp, 1, 5, true, 0);

	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'FILES';
	update tOption SET cParent = vTemp WHERE cKey = 'POST';
	update tOption SET cParent = vTemp WHERE cKey = 'AREA';
	update tOption SET cParent = vTemp WHERE cKey = 'FISCAL_DATE';
	update tOption SET cParent = vTemp WHERE cKey = 'LICENSE_CAUSE';
	update tOption SET cParent = vTemp WHERE cKey = 'GROUP_MGR';	
	
	update tOption SET cLabel = 'Configuración' WHERE cKey = 'CONFIG';
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'CONFIG';
	insert into tOption(cKey, cLabel, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('SECURITY', 'Seguridad', NULL, vTemp, 1, 1, true, 0);
	insert into tOption(cKey, cLabel, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('DOMAIN', 'Dominio', NULL, vTemp, 1, 2, true, 0);
	insert into tOption(cKey, cLabel, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('ATTENDANCE', 'Asistencia', NULL, vTemp, 1, 3, true, 0);

	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'SECURITY';
	update tOption SET cParent = vTemp WHERE cKey = 'USER';
	update tOption SET cParent = vTemp WHERE cKey = 'ROL';
	update tOption SET cParent = vTemp WHERE cKey = 'ALLOW';

	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'DOMAIN';
	update tOption SET cParent = vTemp, cOrder=1 WHERE cKey = 'DOMAIN_MGR';
	update tOption SET cParent = vTemp, cOrder=2 WHERE cKey = 'PARAMS';
	update tOption SET cParent = vTemp, cOrder=3 WHERE cKey = 'DOMAIN_ATTR_MGR';
	
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'ATTENDANCE';
	update tOption SET cParent = vTemp, cOrder=1 WHERE cKey = 'TURN';
	update tOption SET cParent = vTemp, cOrder=2 WHERE cKey = 'MACHINE';
	update tOption SET cParent = vTemp, cOrder=3, cLabel='Reportes' WHERE cKey = 'REP_CONFIG';
	
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'REPORT';
	update tOption SET cParent = vTemp, cOrder=1 WHERE cKey = 'EVENT_VIEWER';

	
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'ATTENDANCE';
	update tOption SET cParent = vTemp, cOrder=3 WHERE cKey = 'REP_LIST';

	update tOption SET cenable=false WHERE cKey = 'SYSTEM';
	update tOption SET cenable=false WHERE cKey = 'TABLES';
	update tOption SET cenable=false WHERE cKey = 'REP_CONFIG';
	
	update tOption SET cOrder=2 WHERE cKey ='POST';
	update tOption SET cOrder=3 WHERE cKey ='AREA';
	update tOption SET cOrder=4 WHERE cKey ='FISCAL_DATE';
	update tOption SET cOrder=5 WHERE cKey ='LICENSE_CAUSE';
	update tOption SET cOrder=6 WHERE cKey ='GROUP_MGR';
	
	update tOption SET cOrder=2 WHERE cKey ='REP_ASIST';
	update tOption SET cOrder=3 WHERE cKey ='REP_WEEKLY';
	update tOption SET cOrder=4 WHERE cKey ='REP_PLAIN';
	update tOption SET cOrder=5 WHERE cKey ='REP_LATE';
	update tOption SET cOrder=6 WHERE cKey ='REP_ABSENCE';
	update tOption SET cOrder=7 WHERE cKey ='EXECUTE_REPORT';

	update tOption SET cLabel='Dominios' WHERE cKey ='DOMAIN';
	update tOption SET cLabel='Definición' WHERE cKey ='DOMAIN_MGR';
	update tOption SET cLabel='Atributos' WHERE cKey ='DOMAIN_ATTR_MGR';
	update tOption SET cLabel='Otros Reportes' WHERE cKey ='EXECUTE_REPORT';
	update tOption SET cLabel='Reporte Completo (Excel)' WHERE cKey ='REP_PLAIN';
	update tOption SET cLabel='Reportes' WHERE cKey ='REP_LIST';
	update tOption SET cLabel='Turnos' WHERE cKey ='TURN';
	*/
END$$
DELIMITER ;

call pUpdateData_Temp;

drop procedure if exists pUpdateData_Temp;

/*
Archivos:
	...
	...
	- Empresa
		- Sucursales
		- Centro de Costo
		- Perfiles/Cargos
		
	- Generales
		- Comunas
		- Feriados
		
	
Configuracion:
	...
	...
	Remuneraciones:
		- Periodos (BOARD).
		- Haberes y descuentos.
		- Tipos de contrato
		- Gratificaciones
		- Indicadores
		- Sistemas de salud
		- AFP
		
   
*/



/*
INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('BOARD', 'Períodos', '/servlet/admin/period/PeriodManager', @menuIdConfig, 2);


INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('COMUNA', 'Comunas', '/servlet/admin/comuna/ComunaManager', @menuIdConfig, 3);

	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('ENTERPRISE', 'Empresas', '/servlet/config/enterprise/EnterpriseManager', @menuIdConfig, 4);
	SET @menuIdEnterprise = LAST_INSERT_ID();
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('BRANCH', 'Sucursales', '/servlet/config/enterprise/branch/BranchManager', @menuIdEnterprise, 1);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('COST_CENTER', 'Centro de costo', '/servlet/config/enterprise/costCenter/CostCenterManager', @menuIdEnterprise, 2);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('PROFILE', 'Perfiles', '/servlet/config/enterprise/profile/ProfileManager', @menuIdEnterprise, 3);
	
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('EMPLOYEE', 'Empleados', '/servlet/config/employee/EmployeeManager', @menuIdConfig, 5);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('LOG', 'Log', NULL, LAST_INSERT_ID());
	
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('HyD_CRUD', 'Haberes y descuentos', '/servlet/config/assetDiscount/AssetDiscountManager', @menuIdConfig, 6);
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('CHARGES', 'Cargos de Empleados', NULL, @menuIdConfig, 7);
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('CONTRACT_TYPES', 'Tipos de contratos', NULL, @menuIdConfig, 8);
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('HOURS', 'Horarios', NULL, @menuIdConfig, 9);
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('GRETIFICATIONS', 'Gratificacion', NULL, @menuIdConfig, 10);
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('INDICATORS', 'Indicadores', NULL, @menuIdConfig, 11);
	SET @menuIdIndicators = LAST_INSERT_ID();
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('PERIODS', 'Periodos', NULL, @menuIdIndicators, 1);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('FACTORS', 'Factores (UF, UTM, IPC, etc)', NULL, @menuIdIndicators, 2);

	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('HEALTH', 'Sistemas de salud', '/servlet/config/health/HealthManager', @menuIdConfig, 12);
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('PFM', 'AFP', '/servlet/config/pfm/PFMManager', @menuIdConfig, 13);
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('INSURANCE', 'Seguro Cesantia', NULL, @menuIdConfig, 14);
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('SINGLE_TAX', 'Impuesto único', NULL, @menuIdConfig, 15);
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('ALLOWANCES', 'Asig. Familiar y Maternal', NULL, @menuIdConfig, 16);
	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('SUPPORT', 'Soporte', NULL, @menuIdConfig, 17);
	
INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('REMU', 'Remuneraciones', NULL, NULL, 3);
SET @menuIdRemu = LAST_INSERT_ID();

	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('EVENTS', 'Eventos de Empleados', '/servlet/remuneration/events/EventsEmployeeServlet', @menuIdRemu, 1);

	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('PROCESS', 'Procesos', NULL, @menuIdRemu, 2);
	SET @menuIdProcess = LAST_INSERT_ID();
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('SALARY', 'Cálculo de Sueldos', '/servlet/remuneration/process/salary/ProcessSalary', @menuIdProcess, 1);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('PAYROLL', 'Nóminas', NULL, @menuIdProcess, 2);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('PREVIRED', 'Previred', '/servlet/remuneration/process/previred/Previred', @menuIdProcess, 3);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('CENTRALIZATION', 'Centralización', NULL, @menuIdProcess, 4);

	INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('FILES', 'Archivos', NULL, @menuIdRemu, 3);
	SET @menuIdFiles = LAST_INSERT_ID();
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('EMPLOYEE_FILES', 'Empleados', NULL, @menuIdFiles, 1);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('REMUNERATION_FILES', 'Remuneraciones', NULL, @menuIdFiles, 2);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('OVERTIME_FILES', 'Horas extras', NULL, @menuIdFiles, 3);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('DAYS_FILES', 'Días', NULL, @menuIdFiles, 4);

INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('REPORT', 'Reportes', NULL, NULL, 4);
SET @menuIdReport = LAST_INSERT_ID();
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('FAVORITES', 'Favoritos', NULL, @menuIdReport);
		SET @menuIdFavorites = LAST_INSERT_ID();
			INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('F01', 'Favoritos 01', NULL, @menuIdFavorites);
			INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('F02', 'Favoritos 02', NULL, @menuIdFavorites);
			INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('F03', 'Favoritos 03', NULL, @menuIdFavorites);
			INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('F04', 'Favoritos 04 >', NULL, @menuIdFavorites);
			SET @menuIdFavorites04 = LAST_INSERT_ID();
				INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('I01', 'Informe 01', NULL, @menuIdFavorites04);
				INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('I02', 'Informe 02', NULL, @menuIdFavorites04);
		
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('CUSTOM_REPORT', 'Informe Personalizado', NULL, @menuIdReport);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('GRAPH', 'Gráfico', NULL, @menuIdReport);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('PERIODS_REPORT', 'Períodos', NULL, @menuIdReport);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('STATISTICS', 'Estadísticas', NULL, @menuIdReport);
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('FINANCIAL_NEWS', 'Noticias financieras', '/servlet/news/MainNews', @menuIdReport);


INSERT INTO tOption(cKey, cLabel, cUrl, cParent, cOrder) VALUES('OTHER', 'Otros', NULL, NULL, 5);
SET @menuIdOther = LAST_INSERT_ID();
		INSERT INTO tOption(cKey, cLabel, cUrl, cParent) VALUES('INVOICE', 'Facturas', '/servlet/invoice/InvoiceManager', @menuIdOther);
*/

/** Creacion de usuario contador del sistema, con las opciones desarrolladas 
hasta ahora 

SELECT	cId
INTO	@domainId 
FROM	bsframework.tDomain
LIMIT 0,1;

INSERT INTO bsframework.tUser(cMail, cName, cPassword) VALUES('conta', 'Contador Principal', md5('conta'));
SET @userId = LAST_INSERT_ID();
INSERT INTO bsframework.tR_UserDomain(cUser, cDomain) VALUES(@userId, @domainId);

INSERT INTO tRol(cName) VALUES('Contador');
SET @rolId = LAST_INSERT_ID();

INSERT INTO tR_UserRol(cUser, cRol) VALUES(@userId, @rolId);

INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,6);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,7);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,8);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,9);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,10);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,11);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,12);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,13);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,14);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,15);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,16);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,17);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,19);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,27);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,28);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,33);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,34);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,35);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,36);
INSERT INTO tR_RolOption(cRol, cOption) VALUES(@rolId,38);
*/