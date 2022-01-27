# UP NEXT: Work with Resource Groups
Get-Command -Module Az.Resources
Get-Command -Module Az.Resources | Group-Object -Property Verb | Sort-Object -Property Count -Descending
Get-Command -Module Az.Resources | Group-Object -Property Noun | Sort-Object -Property Count -Descending


# should be connected to Azure already
Get-AzContext
# define hash table of indvidual setttings, using dot sourcing
. ./_my.settings.ps1
$MySettings


#region GET-AZ* Commands
Get-Command -Module Az.Resources -Name Get-Az*

#endregion

#region GET-AZAD* Commands
Get-Command -Module Az.Resources -Name Get-AzAD*
#returns same results as of 2022-01
Get-Command -Module Az.Resources -Name Get-Az* -CommandType Function

# try them out

Get-AzADApplication -First 20
$apps = Get-AzADApplication
$apps
$apps[0]

Get-AzADAppPermission -ObjectId $apps[0].Id

Get-AzADGroup -First 20
$groups = Get-AzADGroup
$groups
$groups[0]

Get-AzADGroupMember -GroupObjectId $groups[0].Id
Get-AzADServicePrincipal -First 20
$sps = Get-AzADServicePrincipal -First 20
$sps[0]

#todo example
#Get-AzADSpCredential -ObjectId $sps[0].Id

Get-AzADUser -First 20
$users = Get-AzADUser -First 20
$users

$users[0] | Select *

#endregion



#region AZRESOURCEGROUP
# test creating something with a default
New-AzResourceGroup -Name "$($MySettings.NamePrefix)-rg" -Location $MySettings.Region


#endregion



# MANAGEMENT GROUPS
Get-Command *AzManagementGroupDeployment*
Get-Help New-AzManagementGroupDeployment -Examples

# DEPLOYMENTS

# APPLICATIONS
## managed applications


# SERVICE PRINCPALS

# RESOURCES
# ./project-resource-inventory.ps1

# POLICIES

# ROLES

# USERS

# GROUPS

# TAGS

Get-AzResourceGroup