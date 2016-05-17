delete from bsframework.tDomainAttribute;

DELIMITER $$
create procedure pUpdateData_Temp()
begin
# Hay que inconrporar la creacion de los atributos TIMECTRL, ALBIZIA y DALEA 
# en la tabla tConfig para cada dominio.

	bsframework.tDomainAttribute;
	
#	IF(NOT EXISTS(SELECT cId FROM bsframework.tConfig WHERE cKey = 'DALEA_CONTEXT')) THEN
#		INSERT INTO bsframework.tConfig(cKey, cValue) VALUES('DALEA_CONTEXT', '/dalea-web');
#	END IF;
#
#	IF(NOT EXISTS(SELECT cId FROM bsframework.tConfig WHERE cKey = 'TIMECTRL_CONTEXT')) THEN
#		INSERT INTO bsframework.tConfig(cKey, cValue) VALUES('TIMECTRL_CONTEXT', '/timectrl-web');
#	END IF;
#	IF(NOT EXISTS(SELECT cId FROM bsframework.tConfig WHERE cKey = 'STATIC_CONTEXT')) THEN
#		INSERT INTO bsframework.tConfig(cKey, cValue) VALUES('STATIC_CONTEXT', '/dalea');
#	END IF;
	
END$$
DELIMITER ;

call pUpdateData_Temp;
drop procedure if exists pUpdateData_Temp;
 

UPDATE tVersion SET cVersion='1.3.0', cUpdated=NOW() WHERE cKey = 'DBT';
