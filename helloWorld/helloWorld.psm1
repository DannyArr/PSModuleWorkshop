function Get-HelloWorld {
    Write-Output "Hi there $ENV:Username."
}

function Get-GoodbyeWorld {
    Write-Output "So long $ENV:Username."
}

function Get-DestroyWorld {
    Write-Output "BOOM!"
}

Export-ModuleMember -Function @(
    "Get-HelloWorld",
    "Get-GoodbyeWorld"
)