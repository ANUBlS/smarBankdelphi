@echo off

rem *** Define connection string
if "%1" == "" (
	set /P ConnectString="Connect string: "
) else (
	set ConnectString=%1
)

rem *** Define username/mask
if "%2" == "" (
	set /P UserNameMask="User name mask: "
) else (
	set UserNameMask=%2
)

rem *** Execute procedure
echo Executing: SQLPLUS -s %ConnectString% @KillAll.sql %UserNameMask%
sqlplus -s %ConnectString% @KillAll.sql %UserNameMask%