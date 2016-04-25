@echo off
cls
echo Borrando y creando Base RSA
mysql -u root -e "DROP DATABASE IF EXISTS rsa;CREATE DATABASE rsa;"
echo Restaurando backup
mysql -u root rsa < backup-rsa.txt
rem mysql -u root -padmin rsa < "D:\google-drive\timecontrol-install\RespaldoDB\RSA\Full 17-02-2016\bkp_rsa_timectrl_19-02-2016.txt"
call run-once rsa
