# If freshly cloned, run this script once to setup your local environmnet with the right dependencies.
# If a module it already installed it will be upgraded to the latest version.
# PSDepend's depend.ps1 file can then be used to maintain dependencies and versions during build times, etc.

# Run as Admin

$thisPath = Get-Item $PSScriptRoot
. "$PSScriptRoot\buildhelpers.ps1"

Install-PSDepend2

Invoke-PSDepend -Path $thisPath.Parent.FullName -Recurse $false -Force
Get-Dependency -Path $thisPath.Parent.FullName | Test-Dependency
