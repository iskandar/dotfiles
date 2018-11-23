
Write-Host '----> pwsh.ps1' -ForegroundColor Green

##
## Azure PowerShell Modules for PowerShell Core
##
# https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azurermps-6.13.0
Install-Module -Verbose -AllowClobber -Force Az

# To uninstall, see here:
# https://docs.microsoft.com/en-us/powershell/azure/uninstall-azurerm-ps?view=azurermps-6.13.0

##
## AWS Tools
## https://docs.aws.amazon.com/powershell/latest/userguide/pstools-getting-set-up-linux-mac.html
Write-Host '----> AWS Tools for PowerShell Core' -ForegroundColor Green
Install-Module -Verbose -AllowClobber -Force AWSPowerShell.NetCore


# Install other PowerShell modules here
## YAML
Install-Module -Verbose -AllowClobber -Force powershell-yaml

Write-Host '----> Installed Modules' -ForegroundColor Green
Get-InstalledModule | Select-Object Name, Version | Sort
