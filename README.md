# RandomScripts
My collection of random scripts for device management, might include other fun stuff as well
Most of the scripts are in PowerShell but in the future you might find other scripts as well.
As always, I am not responsible of the outcome when you run the scripts. Always understand
what you download from the internet :smile: 
The script's are ordered by the target operating system where they have been tested.

## Scripts in this collection

- Windows/CleanUserTemp.ps1, clean users temp folder in Windows
- Windows/CleanWinTemp.ps1, clean operating system temp folder in Windows

## Script documentation and development plans
### CleanUserTemp.ps1
Can be used to clean the users temp folders on Windows. Where I am using this
is in scheduled tasks or as a Microsoft Configuration Manager CI. The script 
will by default only clean out files older than 14 days.  
[x] Basic cleanup for the user temp folder  
[ ] User notification of the cleanup  
[ ] Possibility to do different cleanups, like temp or with recycle bin  
[ ] Trigger from low diskspace  
### CleanWinTemp.ps1
Used to clean the Operating System temp folder. As with the user script only
files older than 14 days will be removed.   
[x] Basic cleanup for the OS temp folder  
[ ] User notification for the cleanup  
[ ] Allow other cleaning options  
[ ] Trigger from low diskspace  
