@echo off
REM Stage INF files on target device
REM Deploy IP Printer

set IP=%1
mkdir "c:\Utility"
attrib +H "c:\Utility"
xcopy /I /Y /S "%~dp0Printer" "c:\Utility\Printer"



C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -command "& 'Set-ExecutionPolicy' RemoteSigned"
C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -file "%~dp0DeployIP-Printer.ps1" "%*"
