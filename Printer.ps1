# This script Creates a printer port and adds a printer. It assumes that the driver has already been added to the Windows Driver Store
#
# Date: 1/30/20
# Author: Emmitt B. Houston III
# 
#


$driver = "KONICA MINOLTA Universal V4 PCL"
$address = "192.168.1.50"
$name = "Konica Minolta Bizhub C258"
$sleep = "3"
$port = "IP_$address"

# Create TCP/IP printer port
If ($(get-printerport|select -ExpandProperty Name|where {$_ -eq $port}) -ne $port){
Write-Host "Creating printer port..."
Add-PrinterPort -Name $port -PrinterHostAddress $address
}
start-sleep $sleep

# Add Printer
if ($(get-printer|select -ExpandProperty Name|where {$_ -eq $name}) -ne $name){
Write-Host "Adding printer..."
Add-Printer -DriverName $driver -Name $name -PortName $port
}

Exit 0
