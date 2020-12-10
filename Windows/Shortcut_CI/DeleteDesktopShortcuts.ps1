# Filename: DeleteDesktopShortcuts.ps1
# Creator: Mats Hellman
# Script used to delete the unwanted shortcuts on the users
# desktop. Used as a CI together with FindDesktopShortcut.ps1


# Set the current users desktop location
$Desktop = [Environment]::GetFolderPath("Desktop")

# Define unwanted shortcuts
$shortcuts = "Link1.lnk","Link2.lnk","Link3.lnk" 

# Check the shortcuts and set compliance state to noncompliant if any
# of the defined shortcuts are found.
foreach ($shortcut in $shortcuts)
{
    if (Get-Item $Desktop"\"$shortcut -ErrorAction SilentlyContinue ){
        Remove-Item $Desktop"\"$shortcut 
    } 
    
}
