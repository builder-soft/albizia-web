INSERT INTO bsframework.tConfig(cKey, cValue) VALUES('ALBIZIA_CONTEXT', '/albizia-web');

UPDATE tVersion SET cVersion='1.3.0', cUpdated=NOW() WHERE cKey = 'DBT';
