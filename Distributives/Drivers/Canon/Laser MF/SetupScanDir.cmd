@REM coding:OEM
(
SETLOCAL ENABLEEXTENSIONS
SET srcpath=%~dp0
)
(
IF "%srcpath%"=="" SET srcpath=%CD%\

SET UIDAdministrators=S-1-5-32-544;s:y
SET UIDSYSTEM=S-1-5-18;s:y
SET UIDEveryone=S-1-1-0;s:y

SET baseDir=d:\Users\Public\Pictures
)
IF NOT EXIST "%baseDir%" (
    ECHO ����� "%baseDir%" �� �������.
    ECHO ������ ������� �����, � ���ன �㤥� ᮧ���� ����� �����஢�����:
    SET /P baseDir=
)
(
MKDIR "%baseDir%\�����஢�����"

NET SHARE �����஢����� /DELETE
NET SHARE �����஢�����="%baseDir%\�����஢�����" /GRANT:Everyone,Read
NET SHARE �����஢�����="%baseDir%\�����஢�����" /GRANT:��,Read
NET SHARE �����஢�����="%baseDir%\�����஢�����"

"c:\SysUtils\SetACL.exe" -on "%baseDir%\�����஢�����" -ot file -actn setowner -ownr "n:%UIDAdministrators%" -actn setprot -op "dacl:p_nc;sacl:np" -actn clear -clr dacl -actn rstchldrn -rst dacl -actn ace -ace "n:%UIDAdministrators%;p:full;i:sc,so" -actn ace -ace "n:%UIDSYSTEM%;p:full;i:io,so" -actn ace -ace "n:%UIDEveryone%;p:change,FILE_DELETE_CHILD;i:sc" -actn ace -ace "n:%UIDEveryone%;p:write,read,FILE_DELETE_CHILD,DELETE;i:io,so" 
)
