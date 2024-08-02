function Get-KankaAccount {
    param (
        [Parameter(Mandatory = $true)]
        [string]$AuthToken
    )

    $Path = "profile"
    $Method = "GET"

    $Response = Invoke-KankaRestMethod -AuthToken $AuthToken -Path $Path -Method $Method

    if ($Response) {
        return $Response.data
    } else {
        Write-Error "No response received from Kanka API."
    }
}
