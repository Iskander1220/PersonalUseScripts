@REM coding:OEM
FOR /F "usebackq skip=4 tokens=2* delims=	" %%I IN (`REG QUERY "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\User Shell Folders" /v "Common Desktop"`) DO SET CommonDesktop=%%J
FOR /F "usebackq delims=" %%I IN (`%comspec% /C ECHO %CommonDesktop%`) DO SET CommonDesktop=%%I

START "ShopBTS_InitialBase" /WAIT %comspec% /C "%~dp0_install_Rarus.cmd"
IF DEFINED CommonDesktop %exe7z% x -aoa -o"%CommonDesktop%" -- "%~dp0\depts\Desktop_shortcuts_1S.7z"

CALL "%~dp0_RarusMail.cmd"

rem START "" "\\Srv0\���㬥���\IT\����䨪�樨\��砫쭠� ����ன�� 1�-����� ������� ����.mm"
rem START "" "https://docs.google.com/a/mobilmir.ru/leaf?id=0B6JDqImUdYmlZGFlNDVkZDgtZjRhMC00NmJjLWEzMTUtODY3ODJhOTdiMGEz"

EXIT /B
