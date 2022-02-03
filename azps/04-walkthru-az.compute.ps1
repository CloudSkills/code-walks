# Working with Az.Compute, creating VMs

# uses $MySettings defined in 00... script

# get settings & secrets
. ./_my.secrets.ps1
. ./_my.settings.ps1
$MySettings

New-AzResourceGroup -Location $MySettings.Region -Name $MySettings.ResourceGroup
# see what's in that resource group if it exists
Get-AzResource -ResourceGroupName $MySettings.ResourceGroup

# Look at the commands in the Az.Compute module
# UP NEXT: Work with Compute
Get-Command -Module Az.Compute
Get-Command -Module Az.Compute | Group-Object -Property Verb | Sort-Object -Property Count -Descending
Get-Command -Module Az.Compute | Group-Object -Property Noun | Sort-Object -Property Count -Descending


# VM scale set commands
Get-Command -Noun AzVMss


# VM commands
Get-Command -Noun AzVM

# Look at examples for New-AzVM
Get-Help New-AzVM Examples


# VMs have the following dependencies, we could create or reference these

# See parameters in the New-AzVM command

(Get-Command New-AzVM).Parameters | Sort-Object -Property Key
