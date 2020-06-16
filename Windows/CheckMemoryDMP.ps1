# Filename: CheckMemoryDMP.ps1
# Creator: Mats Hellman
# I use this script to check if there is a memory dump file
# on Windows machines with Microsoft Endpoint Configuration Manager. 
# If the file exists and is less than 30 days old I want a collection created
# so I can follow up on what happened on the device.
# The script is very simple but works for my needs.

$memDMP = $Env:windir + "\Memory.dmp"


if (Get-ChildItem $memDMP -ErrorAction SilentlyContinue | Where-Object {$_.LastWriteTime -ge (get-date).AddDays(-30) } ){
    return "NonCompliant"
}
else {
    return "Compliant"
}