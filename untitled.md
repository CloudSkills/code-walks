# CS-Code-Walk-Brainstorm

## Azure Shell code walkthrough challenge

### TL;DR

> Encourage the CloudSkills community to learn Azure by coding for Azure Cloud Shell \(in PowerShell or Azure CLI\), and to share that learning effectively. Create a best practices documented guidance including code template for Azure shell code walkthoughs, for the purpose of increasing and sharing our knowlege of Azure.

### Overview

> Writing code to work with cloud functionality is an ideal way to learn it. Writing code to share our learning is a great way to deepen our knowledge while contributing to the community. Reading clearly written code with informative comments is also a great way to learn. CloudSkills community can build a resource to learn and teach others in the larger cloud community.

### Goals for aspiring builders

* Learn to use Azure via command line
* Explain as you learn
  * Deepen understanding
  * Practice teaching
* Practice content development
* Toe in the water step toward becoming a CS Contributor
* Practice using Git, GitHub, pull requests to contribute

### Goals for organizers

* Inspire and enable the CloudSkills community
* Build reusable best practices document for sharing code walkthoughs
* Create guidance that can be applied to other cloud-centric infrastructure coding \(?\)
  * Python
  * GoLang
  * ???
* Provide a public resource for cloud learning

### Scope

* Cloud
  * Azure
* Command line
  * Azure PowerShell
    * Start with a folder structure, folder per module
  * AZ CLI
    * Start with a folder structure, folder per command
* Focus on accomplishing a single task **OR** Exercising the functionality of a single module
  * Examples:
    * Export Azure App Service Certificate as PFX [Example using AzureRM in 2017](https://azure.github.io/AppService/2017/02/24/Creating-a-local-PFX-copy-of-App-Service-Certificate.html)

### Out of Scope / Future Phases

* Other Cloud Providers
  * \(TBD AWS, GCP?\)
* Opportunities to improve Azure documentation with pull requests, offering more thorough examples to their docs for [AZ Module](https://github.com/Azure/azure-powershell) and [AZ CLI](https://github.com/Azure/azure-cli)

### [Constraints](https://duckduckgo.com/?q=constraints+enable+creativity)

* Unit of publishing is a single .ps1 file \(**OR** .sh?\)
  * Based on template
* Based around accomplishing a task using a PowerShell module **OR** AZ command
* Using PowerShell **OR bash** shell
* Using one of the [included tools](https://docs.microsoft.com/en-us/azure/cloud-shell/features)
* * Not a copy of existing sample, tutorial or walkthrough
  * Exception where updating to use current tools \(i.e. convert script using AzureRM to use AZ module, or PS5.1 to PS7\)

### Questions

* If we stick with PowerShell & PS1 files, what do we lose?
* How to address walkthroughs that use more than 1 module or command.
  * Sym links or see also?
* How to address improving or extending another's work?
  * attribution in the github history?
* How to maintain and keep current?
* Show imperative \(PowerShell/CLI\) and declarative \(ARM via PowerShell/CLI\)

### Requirements

* Template and walkthroughs stored in a CloudSkills github repo
  * Updated via pull requests
  * Give CS members practice and recognition for their github activity
* Follow template that includes \# comment sections
  * Goal/Purpose - What does this script do?
  * Introduction - Any background information to set the contect
  * Requirements
  * Conventions
    * \_mySettings.ps1 file to hold indiviual's variable settings to ensure code is reusable by others.
  * Steps
  * Cleanup!
  * References

## Benefits

* Contributors get exposure on GitHub

### Examples

* [https://docs.microsoft.com/en-us/azure/app-service/scripts/cli-deploy-github?toc=%2fcli%2fazure%2ftoc.json](https://docs.microsoft.com/en-us/azure/app-service/scripts/cli-deploy-github?toc=%2fcli%2fazure%2ftoc.json)

