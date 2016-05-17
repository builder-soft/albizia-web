DROP PROCEDURE if exists pSaveParameter;
DELIMITER $$
CREATE PROCEDURE pSaveParameter(IN pKey VARCHAR(20), IN pLabel VARCHAR(100), 
								IN pValue VARCHAR(300), IN pType BIGINT(20))
BEGIN

	IF NOT EXISTS(	SELECT	cId 
				FROM	tParameter
				WHERE	cKey = pKey) THEN
		INSERT INTO tParameter(cKey, cLabel, cValue, cDataType) 
		VALUES(pKey, pLabel, pValue, pType);
	END IF;
END$$

DELIMITER ;
