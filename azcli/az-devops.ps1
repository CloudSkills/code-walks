# AZ DEVOPS CODE WALK
# Refer : https://docs.microsoft.com/en-us/azure/devops/cli/log-in-via-pat?view=azure-devops&tabs=windows
# Shell is pwsh

#login to az cli first
az login
## REQUIREMENTS: Create and copy your Personal Access Token (PAT) first via UI, refer https://docs.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=preview-page#frequently-asked-questions-faqs

## INSTALL azure-devops extension
az extension -h
az extension list-available -o table 
# next step takes nearly minute
az extension add --name azure-devops --debug

## DEFINE VARIABLES
## **CHANGE THESE FOR YOUR ENVIRONMENT**
$pat = Get-clipboard # run this after creating the PAT and copying to clipboard
# change next line to your azure devops org url
$myDevOpsOrgUrl = "https://dev.azure.com/yourorgname"
$myDevOpsOrgUrl
$env:AZURE_DEVOPS_EXT_PAT = $pat


az devops configure -h

az devops configure --defaults organization=$myDevOpsOrgUrl
# login to your devops org
az devops login --debug


# change to the AZDO project you want to work with
$myProjectName = 'PartsUnlimited'


# review az devops commands
az devops -h

# review az devops security commands
az devops security -h
az devops security group -h
$g = az devops security group list --project $myProjectName | ConvertFrom-JSON
$groupDescriptor = $g.graphGroups | Select-Object -ExpandProperty descriptor -First 1
az devops security group show --id $groupDescriptor


# review az devops user commands
az devops user -h
$u = az devops user list --detect | ConvertFrom-JSON
$u.items | Select -ExpandProperty user | Select -ExpandProperty displayName
az devops user update -h

# review installed devops extensions
az devops extension -h
$j = az devops extension list | ConvertFrom-JSON
$j | Select-Object extensionId, extensionName

# search for new devops extensions
az devops extension -h
$s = az devops extension search --search-query 'test' | ConvertFrom-JSON
$s | Select-Object extensionId, extensionName, shortDescription

# projects
az devops project -h
az devops project list -o table
az devops project show -p $myProjectName



az devops project create -h
az devops project create --name az-cli-devops-demo --open

# repos
az repos -h
az repos list -h
az repos list -p $myProjectName



# pipelines
az pipelines -h
az pipelines list --project $myProjectName -o table
az pipelines run -h
$result = az pipelines run -p $myProjectName --name $myProjectName | ConvertFrom-JSON
$result


## CLEANUP