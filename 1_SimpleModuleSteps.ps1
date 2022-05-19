# create a shared folder on your local machine with a name of 'PSRepoLocal'

# Register your shared folder as a PSREpository
$sharePath = "//AAD-7H4KDB3/PSRepoLocal"
Register-PSRepository -Name "PSRepoLocal" -SourceLocation $sharePath -PublishLocation $sharePath -InstallationPolicy "Trusted"

# Create a single module file with some functions function. 
# See /helloWorld/helloWorld.psm1

# Generate a module manifest file (.psd1)
New-ModuleManifest -Path "./helloWorld/helloWorld.psd1" -Author $env:USERNAME -Description "Greetings and salutations" -CompanyName "NewDay" -RootModule "helloWorld"

# Validate the new module manifest
Test-ModuleManifest -Path "./helloWorld/helloWorld.psd1"

# Test out the module direct from source
Import-Module ".\helloWorld"
Get-Command -Module "helloWorld"

# Remove the imported module for clean up
Remove-Module "helloWorld"

# Publish your module to your local PS repo
Publish-Module -Path "./helloWorld" -Repository "PSRepoLocal"

# Search for your module
Find-Module helloWorld

# Install and import your module from the repo
Install-Module helloWorld -Repository "PSRepoLocal"
Import-Module helloWorld

# Check it out
Get-InstalledModule -Name "helloWorld"
Get-Module "helloWorld"
Get-Command -Module "helloWorld"

# Try it out
Get-HelloWorld
Get-GoodbyeWorld

<########################
Things to try out:

Use the manifest file to export commands
Make a change and publish a new version
Update you module from the newly published version

#########################>
