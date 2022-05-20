# https://pester-docs.netlify.app/docs/commands/Invoke-Pester

# Set your testing preferences
$PesterPreference = [PesterConfiguration]::Default
$PesterPreference
$PesterPreference.Output.Verbosity = "Detailed"

# Run all tests in folder (files must be *.tests.ps1) or a specific file
Invoke-Pester -Path "."
Invoke-Pester -Path ".\3.2_testing_Function_Complete.tests.ps1"

# Run tests by tag
Invoke-Pester -Path ".\3.2_testing_Function_Complete.tests.ps1" -Tag "noTestCases"
Invoke-Pester -Path ".\3.2_testing_Function_Complete.tests.ps1" -Tag "TestCases1"
Invoke-Pester -Path ".\3.2_testing_Function_Complete.tests.ps1" -Tag "TestCases2"

Invoke-Pester -Path ".\3.2_testing_Function_Complete.tests.ps1" -Tag MocksExample, TestCases2


# How to mock an object
$services = Get-Service
$services | Export-Clixml -Path ".\services.xml"

$servicesnapshot = Import-Clixml -Path ".\services.xml"

$services
$servicesnapshot