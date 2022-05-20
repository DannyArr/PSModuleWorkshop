function Get-Octet {

    param(
        [parameter(mandatory=$true)]
        [string]$IP,

        [int]$Octet
    )

    $ipOctetArray = $IP.Split(".")

    return $ipOctetArray[$Octet-1]

}

function Get-OctetBinary {
    param(
        [parameter(mandatory=$true)]
        [string]$IP,

        [int]$Octet
    )

    $OctetInteger = Get-Octet -IP $IP -Octet $Octet
    $binary = [System.Convert]::ToString($OctetInteger , 2)

    return $binary
}

