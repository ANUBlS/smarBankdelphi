@echo off

set ORA_HOME=D:\Oracle
set SID=sbdev2
set Domain=atabank.com
set Service=%SID%.%Domain%
set User=system
set Password=manager
set SBTableSpace=SMARTBANK
set TableSpaceExt=dbf
set SBTableSpaceDatafile=%ORA_HOME%\ORADATA\%SID%\%SBTableSpace%.%TableSpaceExt%
set SBOwner=SMART
set SBOwnerPassword=qw12as34

sqlplus -s %User%/%Password%@%sid% @DropSB.sql %ORA_HOME% %SID%
del %SBTableSpaceDatafile%
sqlplus -s %User%/%Password%@%sid% @CreateSB.sql %SBTableSpace% %SBTableSpaceDatafile% %SID%

imp userid=%SBOwner%/%SBOwnerPassword%@%sid% file=%1 fromuser=%SBOwner% touser=%SBOwner%