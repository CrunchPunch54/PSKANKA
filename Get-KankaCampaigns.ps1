function Get-KankaCampaigns {
    [CmdletBinding(DefaultParameterSetName = 'All')]
    param (
        [Parameter(Mandatory = $true, ParameterSetName = 'All')]
        [Parameter(Mandatory = $true, ParameterSetName = 'Id')]
        [Parameter(Mandatory = $true)]
        [string]$AuthToken,

        [Parameter(Mandatory = $true, ParameterSetName = 'Id')]
        [Parameter(Mandatory = $false)]
        [int]$ID
    )

    $Path = "campaigns"
    $Method = "GET"

    if($PSCmdlet.ParameterSetName -eq "ID") {
        $Path = $Path + "/" + $ID
        $Response = Invoke-KankaRestMethod -AuthToken $AuthToken -Path $Path -Method $Method
    }else{
        $Response = Invoke-KankaRestMethod -AuthToken $AuthToken -Path $Path -Method $Method
    }

    if ($Response) {
        return $Response.data
    } else {
        Write-Error "No response received from Kanka API."
    }
}
