drop procedure if exists pUpdateData_Temp;
DELIMITER $$
create procedure pUpdateData_Temp()
begin
	DECLARE vTemp BIGINT(20);
 
	IF (NOT EXISTS(select cId from bsframework.tConfig where cKey='ALBIZIA_CONTEXT')) THEN
		INSERT INTO bsframework.tConfig(cKey, cValue) VALUES('ALBIZIA_CONTEXT', '/albizia-web');
	END IF;
	
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
	VALUES('INDICATOR', 'Indicadores*', 'ALBIZIA_CONTEXT', null, null, 1, 0, true, false);

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
	
	INSERT INTO tOption(cKey, cLabel, cContext, cURL, cParent, cType, cOrder, cEnable, cIsAdmin) 
	VALUES('AGREEMENT', 'Contratos', 'ALBIZIA_CONTEXT', '/servlet/config/employee/EmployeeAgreementManager', null, 1, 0, true, false);
	
	SELECT cID INTO vTemp FROM tOption WHERE cKey = 'EMPLOYEE';
	update tOption SET cParent = vTemp WHERE cKey = 'AGREEMENT';
	
	update tOption SET cOrder=10 WHERE cKey ='EMPLOYEE_DATA';
	update tOption SET cOrder=20 WHERE cKey ='AGREEMENT';
	update tOption SET cOrder=30 WHERE cKey ='EMPLOYEE_LICENSE';
	update tOption SET cOrder=40 WHERE cKey ='EMPLOYEE_TURN';
	update tOption SET cOrder=50 WHERE cKey ='EMPLOYEE_MARK';
	update tOption SET cOrder=60 WHERE cKey ='EMPLOYEE_DETACHED';
	
	
	update tOption SET cContext=NULL WHERE cKey IN('EMPLOYEE','REPORT', 'SECURITY');
	update tOption SET cContext='TIMECTRL_CONTEXT' WHERE cKey IN('EMPLOYEE_DATA');
	update tOption SET cContext='DALEA_CONTEXT' WHERE cKey IN('LICENSE_CAUSE','ENTERPRISE_DATA','EMPLOYEE_DATA','EMPLOYEE_DETACHED', 'FISCAL_DATE', 'EMPLOYEE_LICENSE', 'EMPLOYEE','EMPLOYEE');
	update tOption SET cContext='ALBIZIA_CONTEXT' WHERE cKey IN('ATTENDANCE', 'REMUNERATION','PROCESS');
	
	
#	update tOption SET cUrl='/servlet/albizia/manager/Enterprise' WHERE cKey = 'ENTERPRISE_DATA';
	
END$$
DELIMITER ;

call pUpdateData_Temp;

drop procedure if exists pUpdateData_Temp;

