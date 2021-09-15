# File: AdmUserCompliance.PS1
# Version: 0.1
# Last edit: 10.5 2018
# Author: Mats Hellman (mats.hellman@nixadmins.net)
# This script is used on workstations or servers to find user accounts in
# the Local Administrators group and verify if they are according to the
# policies set by your company
#
# Compatibility: Works only on PoSh v5 or higher
# Version History:
# 0.1 Initial Version with scoped funtionality :: 10.5.2019
#
#

# Set the allowed groups and users in a array, use * as wildcard
$groupExceptions = @("Administrator", "da*", "a*", "Domain Admins")
# Get the group content and remove compter or domain name from user / group
$admGroupContent = Get-LocalGroupMember -Name "Administrators"

# Get rid of the domain name from the username string
foreach ($name in $admGroupContent)
{
    $usernames += @($name -replace ".*\\")

}

# Main loop for checking every username
foreach( $user in $usernames )
{
#Loop and compare the user and the exception
    foreach ($exception in $groupExceptions)
    {
        if ($user -like $exception)
        {
            # If user is found then set compliance to true, and break the
            # loop to check the next exception
            $isCompliant = "Compliant"
            break
        }
        else
        {
            $isCompliant = "NotCompliant"
        }
    }
    # If the loop is done and the system is not compliant we can break out
    # of the main loop because the system is already non-compliant
    if ($isCompliant -eq "NotCompliant")
    {
        break
    }
}

return $isCompliant