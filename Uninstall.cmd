@echo off
REM Remove installed printer and drivers
echo Running script to remove printers, and drivers...
set IP=%1
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command "& 'Set-ExecutionPolicy' RemoteSigned"
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -file "%~dp0RemoveIP-Printer.ps1" "%*"
echo Deleting INF Cache folder
if exist "c:\Utility" rmdir /s /q "c:\Utility"

