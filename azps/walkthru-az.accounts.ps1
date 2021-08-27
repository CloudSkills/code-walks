# Az.Accounts
# refer: 
# 
Exit #Prevent F5, Step thru command lines with F8

# get settings & secrets
. ./_my.secrets.ps1
. ./_my.settings.ps1
$MySettings

# test creating something with a default
New-AzResourceGroup -Name "$MySettings.NamePrefix-rg" -Location $MySettings.Region -Subs

# Start with AZ.Accounts, so we can connect to our account
# See commands, their nouns and verbs to get a high level sense of what we can do with this module
Get-Command -Module Az.Accounts
# See verbs
Get-Command -Module Az.Accounts | Group-Object -Property Verb
# See nouns
Get-Command -Module Az.Accounts | Group-Object -Property Noun
       

# What cmdlets work against AzAccount?
Get-Command -Module Az.Accounts -Noun AzAccount


#Login-AzAccount looks helpful
Get-Help Login-AzAccount -Examples
# For windows users, try -ShowWindow
Get-Help Login-AzAccount -ShowWindow


#Login-AzAccount is an alias for 'Connect-AzAccount'
Get-Alias -Definition Connect-AzAccount

# Login interactively
Get-Help Connect-AzAccount -Online
# With Device auth
Connect-AzAccount -UseDeviceAuthentication
<#returns
WARNING: To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code xxxxxxx to authenticate.

Account            SubscriptionName TenantId                             Environment
-------            ---------------- --------                             -----------
my@email.com                  guid-here                            AzureCloud
#>

#Alternately. login with credential
Get-Help Get-Credential -Examples
$cred = Get-Credential  # todo pull from big hashtable in _secrets.ps1
Connect-AzAccount -Credential $cred #not yet supported in PSCore/PS7

# First, I like to look at the Get-* cmdlets for a given module to see what I can see
Get-Command -Module Az.Accounts -Verb Get
# or
Get-Command Get-AZ* -Module Az.Accounts 
# See what some use Az.Account cmdlets return

Get-AzContext  # See if we're connected to any accounts already    

# use (Get-AzContext).Tenant.Id to get the Tenant ID
$MySettings.SubscriptionID =  (Get-AzSubscription)[0].Id
$MySettings.TenantID = (Get-AzSubscription)[0].TenantId
$MySettings

$context = Set-AzContext -Name 'WalkthruContext' -Subscription (Get-AzSubscription)[0].Name -Tenant $MySettings.TenantID


# Other commands to review
Get-AzContextAutosaveSetting  # Where are context files stored
Get-AzDefault  # See user defaults               
Get-AzEnvironment # See the different Azure clouds            
Get-AzProfile # Service profiles?                 
Get-AzSubscription # See subscription           
Get-AzTenant # See tenant



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

Save-AzContext -Path ~/.azure/dave_context.json
cat ~/.azure/dave_context.json


## NEXT TIME Load it from file
Import-AzContext -Path ~/.azure/dave_context.json



# ./walkthru-az.resources.ps1




# Use the REST API directly within Azure
$accessToken = Get-AZAccessToken
Invoke-AzRestMethod
Invoke-AzRestMethod -Path "/subscriptions/{subscription}/resourcegroups/{resourcegroup}/providers/microsoft.operationalinsights/workspaces/{workspace}?api-version={API}" -Method GET


## OPTIONAL 
## Purpose: Turn off autosaving Azure credentials. Your login information will be forgotten the next time you open a PowerShell window
# Disable-AzContextAutosave

# Can logout when done

Clear-AzContext -Scope CurrentUser

Logout-AzAccount
