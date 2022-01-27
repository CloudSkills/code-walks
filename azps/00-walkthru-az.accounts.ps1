# Az.Accounts
# refer: 
# 
Exit #Prevent F5. Instead, place cursor on any line and step thru command with F8


#region SETUP
# get settings & secrets
. ./_my.secrets.ps1
. ./_my.settings.ps1
$MySettings

#endregion

#region LOGIN

# LOGIN TO YOUR AZURE ACCOUNT (DEV, NOT PROD JUST YET :) ) 
# FOR GITPOD, USE Connect-AzAccount -UseDeviceAuthentication
# With Device auth
Connect-AzAccount -UseDeviceAuthentication

<# displays
WARNING: To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code xxxxxxx to authenticate.
#>

<# after login, this displays
Account            SubscriptionName TenantId                             Environment
-------            ---------------- --------                             -----------
my@email.com                  guid-here                            AzureCloud
#>


#endregion

#region ASSESS AZ.ACCOUNTS MODULE

# Start with AZ.Accounts, so we can connect to our account
# See commands, their nouns and verbs to get a high level sense of what we can do with this module
Get-Command -Module Az.Accounts
# See verbs
Get-Command -Module Az.Accounts | Group-Object -Property Verb | Sort-Object
# See nouns
Get-Command -Module Az.Accounts | Group-Object -Property Noun | Sort-Object
 

# For example, what cmdlets work against AzAccount?
Get-Command -Module Az.Accounts -Noun AzAccount


# Look at the Get-* cmdlets for a given module to see what I can see
Get-Command -Module Az.Accounts -Verb Get
# or
Get-Command Get-AZ* -Module Az.Accounts | Sort-Object
# See what some of the Az.Account cmdlets return

Get-AzAccessToken
Get-AzContext
Get-AzContextAutosaveSetting  # Where are context files stored
Get-AzDefault  # Where are context files stored
Get-AzDomain # What domains are associated with this account?
Get-AzEnvironment  # Where are context files stored
Get-AzSubscription # See subscription
Get-AzTenant # See tenant

# Save some properties that are returned into our $MySettings variable
# use (Get-AzContext).Tenant.Id to get the Tenant ID
$MySettings.SubscriptionID = (Get-AzSubscription)[0].Id
$MySettings.TenantID = (Get-AzSubscription)[0].TenantId
$MySettings

#endregion



##################
# EXTRA CONTENT
##################

#Alternately. login with credential
Get-Help Get-Credential -Examples
$cred = Get-Credential  # todo pull from big hashtable in _secrets.ps1
Connect-AzAccount -Credential $cred #not yet supported in PSCore/PS7


$context = Set-AzContext -Name 'WalkthruContext' -Subscription (Get-AzSubscription)[0].Name -Tenant $MySettings.TenantID
$context



# USER SESSION DEFAULTS

# default location or resource group within a session

$subid = (Get-AzSubscription)[-1].Id

$DefaultProfile = Connect-AzAccount -subscriptionID $subid -UseDeviceAuthentication
Get-AzDefault  # See user defaults               

Get-AzSubscription
 
Get-Command set-AZ*Default* -Module Az.Accounts 

Set-AzDefault -ResourceGroup $MySettings.ResourceGroup # -Region $MySettings.Region

# SAVE CONTEXT TO FILE
Get-AzContext
$DefaultProfile | Select-AzContext "Default"

Save-AzContext -Path ~/.azure/my_context.json
cat ~/.azure/my_context.json


## NEXT TIME Load it from file
Import-AzContext -Path ~/.azure/my_context.json




Clear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUserClear-AzContext -Scope CurrentUser

Logout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccountLogout-AzAccount
# Use the REST API directly within Azure
$accessToken = Get-AZAccessToken
Invoke-AzRestMethod
/subscriptions/{subscriptionId}/resourcegroups?api-version=2021-04-01
$RGJson = Invoke-AzRestMethod -Method GET -Path "/subscriptions/$($MySettings.SubscriptionID)/resourcegroups?api-version=2021-04-01" # /$MySettings.ResourceGroup/providers/microsoft.operationalinsights/workspaces/{workspace}?api-version={API}" 
$RGObject =  ConvertFrom-json $RGJson

## OPTIONAL 
## Purpose: Turn off autosaving Azure credentials. Your login information will be forgotten the next time you open a PowerShell window
# Disable-AzContextAutosave

# Can logout when done

Clear-AzContext -Scope CurrentUser

Logout-AzAccount
