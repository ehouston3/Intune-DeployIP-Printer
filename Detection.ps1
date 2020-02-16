# This script detects if the printer is installed
#
# Date: 1/30/20
# Author: Emmitt B. Houston III
# 
#


$driver = "KONICA MINOLTA Universal V4 PCL"
$INFCache="C:\Utility"
$address = "192.168.1.50"
$name = "Konica Minolta Bizhub C258"
$sleep = "3"
$port = "IP_$address"

# Add Printer
if ($(get-printer|select -ExpandProperty Name|where {$_ -eq $name}) -eq $name){
Write-Host "Installed"
}
else{
}


