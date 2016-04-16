echo -- 1.2.26 --
IF "%1" == "" GOTO error

	mysql -D%1 -t -u root -padmin --default-character-set=utf8 < create-albizia.sql
	mysql -D%1 -t -u root -padmin --default-character-set=utf8 < rules-albizia.sql

	for %%i in (fn-*.sql) do mysql -D%1 -t -u root -padmin --default-character-set=utf8 < %%i

	for %%i in (sp-*.sql) do mysql -D%1 -t -u root -padmin --default-character-set=utf8 < %%i

	mysql -D%1 -t -u root -padmin --default-character-set=utf8 < data-remcon.sql.txt

goto fin

:error

call ..\msg.cmd "No se indico nombre de la base de datos, ejecute: "
call ..\msg.cmd "$ run-all timectrl"

:fin

