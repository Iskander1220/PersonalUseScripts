@(REM coding:CP866
    SETLOCAL ENABLEEXTENSIONS
    IF "%~dp0"=="" (SET "srcpath=%CD%\") ELSE SET "srcpath=%~dp0"
    IF NOT DEFINED baseScripts SET "baseScripts=\Local_Scripts\software_update\Downloader"
    SET distcleanup=1
)
(
    CALL "%baseScripts%\_DistDownload.cmd" http://ahkscript.org/download/ahk-install.exe ahk-install.exe -N -O"ahk-install.exe"
)
