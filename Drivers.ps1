# This script adds the locally cached drivers to the Windows Driver Store, and installs them.
# Date: 1/30/20
# Author: Emmitt B. Houston III
# 
#

# Array containing drivers to install
$driver = "KONICA MINOLTA Universal V4 PCL"
$sleep = "3"
$INFCache="C:\Utility"

# Add cached drivers to Windows DriverStore
Get-ChildItem $INFCache -File -Filter *.inf -Recurse | % {pnputil.exe /a $_.FullName}

# Install printer driver from Windows DriverStore

Add-PrinterDriver -Name $driver -Verbose


Exit 0
