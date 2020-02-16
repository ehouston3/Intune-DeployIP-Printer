# This script Creates a printer port and adds a printer. It assumes that the driver has already been added to the Windows Driver Store
#
# Created: 1/30/20
# Author: Emmitt B. Houston III
# Last modified: 2/15/20
# It now accepts the IP address passed to the Install.cmd to make it generic so the IP
# isn't hard-coded into the script
#


$driver = "KONICA MINOLTA Universal V4 PCL"
$INFCache="C:\Utility"
#$address = "192.168.1.50"

# assign the IP address passed to "Install.cmd" as a parameter (ex: Install.cmd 10.0.0.1)
$address = $args[0]
$name = "Konica Minolta Bizhub C258"
$sleep = "5"
$port = "IP_$address"

# Add cached drivers to Windows DriverStore
Get-ChildItem $INFCache -File -Filter *.inf -Recurse | % {pnputil.exe /a $_.FullName}

# Install printer driver from Windows DriverStore

Add-PrinterDriver -Name $driver -Verbose

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
