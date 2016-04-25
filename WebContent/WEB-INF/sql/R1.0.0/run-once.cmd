echo -- 1.0.0 --
IF "%1" == "" GOTO error
echo Runing create-albizia.sql...
	mysql -D%1 -t -u root --default-character-set=utf8 < create-albizia.sql
echo Runing rules-albizia.sql...
	mysql -D%1 -t -u root --default-character-set=utf8 < rules-albizia.sql

	for %%i in (fn-*.sql) do mysql -D%1 -t -u root --default-character-set=utf8 < %%i
	for %%i in (sp-*.sql) do mysql -D%1 -t -u root --default-character-set=utf8 < %%i

echo Runing data-albizia.sql...
	mysql -D%1 -t -u root --default-character-set=utf8 < data-albizia.sql
echo Runing data-menu.sql...
	mysql -D%1 -t -u root --default-character-set=utf8 < data-menu.sql
echo Runing update-database.sql...
	mysql -D%1 -t -u root --default-character-set=utf8 < update-database.sql

goto fin

:error

call ..\msg.cmd "No se indico nombre de la base de datos, ejecute: "
call ..\msg.cmd "$ run-all timectrl"

:fin

