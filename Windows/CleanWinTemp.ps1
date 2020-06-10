# Script to delete anything older than 14 days from Windows Temp
# This was initially used in a task sequence with run command and it's the reason
# no variables and other magic is used
# To use it like that uncomment the line below and make it a oneliner
# powershell.exe -command " PLACE STRING HERE "
Get-ChildItem C:\Windows\Temp\* -Recurse -Force -Verbose -ErrorAction SilentlyContinue | 
    Where-Object { ($_.CreationTime -lt $(Get-Date).AddDays(-14)) } | 
    Remove-Item -force -Verbose -recurse -ErrorAction SilentlyContinue

#
#   Tested on
#   Windows 10
#   Windows 7
#