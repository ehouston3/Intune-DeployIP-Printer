# This script removes the printer, ports, and drivers
# Date: 1/30/20
# Author: Emmitt B. Houston III
#

$driver = "KONICA MINOLTA Universal V4 PCL"
# $address = "169.69.69.69"
$address = $args[0]
#$computername = $(get-computerinfo|select -ExpandProperty CsName )
$computername = $env:computername
$name = "Konica Minolta Bizhub C258"
$sleep = "3"
$port = "IP_$address"
$INFCache="C:\Utility"

# Remove Printer

if ($(get-printer|select -ExpandProperty Name|where {$_ -eq $name}) -eq $name){
Write-host "Removing printer $name"
Remove-Printer -Name $name
}

# Remove TCP/IP printer port
If ($(get-printerport|select -ExpandProperty Name|where {$_ -eq $port}) -eq $port){
Write-host "Removing Printer Port $port"
Remove-PrinterPort -Name $port -ComputerName $computername
}
start-sleep $sleep


# Remove printer driver from Windows DriverStore
if ($(Get-PrinterDriver|select -ExpandProperty Name|where {$_ -eq $driver}) -eq $driver){
Write-host "Removing Printer Driver $driver"
Remove-PrinterDriver -Name $driver -ComputerName $computername
}




# Uninstall cached drivers to Windows DriverStore
if (Test-Path $INFCache){
Write-host "Deleting the printer drivers installed from the INF Cache folder $INFCache"
Get-ChildItem $INFCache -File -Filter *.inf | % {pnputil.exe /delete-driver $_.FullName /force}
}

Exit 0