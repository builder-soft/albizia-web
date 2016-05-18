delete from bsframework.tDomainAttribute;
truncate table bsframework.tDomainAttribute;

drop procedure if exists pUpdateData_Temp;
DELIMITER $$
create procedure pUpdateData_Temp()
begin
# Hay que inconrporar la creacion de los atributos TIMECTRL, ALBIZIA y DALEA 
# en la tabla tConfig para cada dominio.
	DECLARE vId BIGINT(20);
	DECLARE vDone BOOLEAN DEFAULT FALSE;
	DECLARE cursorDomain CURSOR FOR
		SELECT	cId
		FROM	bsframework.tDomain;
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET vDone = TRUE;

	OPEN cursorDomain;
	cursorDomain_loop: LOOP
		FETCH cursorDomain INTO vId;
		
		IF(vDone) THEN 
			LEAVE cursorDomain_loop;
		END IF;	

#		select vId;
		

		INSERT INTO bsframework.tDomainAttribute(cDomain, cKey, cName, cValue) VALUES(vId, 'TIMECTRL', 'TIMECTRL', 'true');
		INSERT INTO bsframework.tDomainAttribute(cDomain, cKey, cName, cValue) VALUES(vId, 'DALEA', 'DALEA', 'true');
		INSERT INTO bsframework.tDomainAttribute(cDomain, cKey, cName, cValue) VALUES(vId, 'ALBIZIA', 'ALBIZIA', 'false');
		
	END LOOP cursorDomain_loop;
	CLOSE cursorDomain;
		
#	bsframework.tDomainAttribute;
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
