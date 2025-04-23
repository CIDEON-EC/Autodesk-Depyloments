@ECHO OFF
skript="\\SERVER\SHARE\DEPLOYMENT\WIM-handler.ps1"
wim="20XX_PDC_VLT"
wimpath="\\SERVER\SHARE\DEPLOYMENT"

powershell.exe -ExecutionPolicy Bypass %skript% -WIM %wim% -Mode "Mount" -Path %wimpath%

PAUSE