<#################################################
PS Module maker is a module that will 
create the scaffold for a PowerShell module.
This includes Pester module tests and examples, 
as well as dependencies.
#################################################>

## Clone PSModuleMaker repo from BitBucket
# https://bitbucket.org/newdaydigitaldevelopment/psmodulemaker/src/master/?search_id=0ff2bdbf-8f3c-49e7-be5d-e2274a9009ab

## Import the PSModuleMaker module
$PSModuleMakerRootPath = "C:\source\psmodulemaker"    # Path where you cloned to
$PSModuleMakerModulePath = Join-Path $PSModuleMakerRootPath "PSModuleMaker"
Import-Module $PSModuleMakerModulePath

## Create a new module with PSModuleMaker
Get-Help "New-MMPSModule"    # For help text

New-MMPSModule -TargetPath "C:\source\"
    # Select option 2 for StandardPSModule
    # Name => PSModuleDemo
    # Description => Powershell Module Demo
    # Version => Hit 'enter' for default
    # Author => Hit 'enter' for default
    # Email => Hit 'enter' for default

    # This will create the files and initialise a local git repo

Set-Location "C:\source\PSModuleDemo"
git status

## View the module in VS Code
code .

    # Helpers folder: Functions, scripts and variables to assist with builds, testing, etc.
    # PSModuleDemo folder: The folder containing the actual module
        # class folder: for classes
        # private folder: Functions that don't get exported (not available to user).
        # public folder: Exported functions. Available to users
    # tests folder: Pester tests and supporting files like mocks
    # PSModuleDemo.build.ps1: Holds the tasks for invokeBuild, allowing quick access from VSCode to tasks
    # PSModuleDemo.depend.psd1: Used by PSDepend or PSDepend2
    # moduleInfo.json: Used in settings. Can be removed in a later version.
    # README.md: A readme template for your module.

## Install Dev and Build dependencies
    # Copy the file 'setupModules.ps1' to the helpers folder of your new module
    # Have a look at 'PSModuleDemo.depend.psd1' in your new module
    # Run 'setupModules.ps1'

## Run tests
    # Hit F1
    # Select "Tasks: Run task"
    # Select RunTests
    # Try some of the other tasks available
    # View ./PSModuleDemo.build.ps1 to see what the tasks are doing

## Other bits
    # Publish your module
    Publish-Module -Path "./PSModuleDemo" -Repository "PSRepoLocal"

    # Have a look at the module file: 'PSModuleDemo.psm1'

    # Check out the tests

    # Look at the './helpers/settings.ps1' file. It supplies various variables for tests and builds.









