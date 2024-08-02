function Invoke-KankaRestMethod {
    param (
        [Parameter(Mandatory = $true)]
        [string]$AuthToken,

        [Parameter(Mandatory = $false)]
        [string]$BaseUrl = "https://api.kanka.io",

        [Parameter(Mandatory = $false)]
        [string]$ApiVersion = "1.0",

        [Parameter(Mandatory = $true)]
        [string]$Path,

        [Parameter(Mandatory = $false)]
        [ValidateSet("GET", "POST", "PUT", "PATCH", "DELETE")]
        [string]$Method,

        [Parameter(Mandatory = $false)]
        [hashtable]$Body = $null
    )

    # Construct the full URI
    $uri = "$BaseUrl/$ApiVersion/$Path"

    $headers = @{
        "Authorization" = "Bearer $AuthToken"
        "Content-Type"  = "application/json"
    }

    $jsonBody = $null
    if ($Body) {
        $jsonBody = $Body | ConvertTo-Json -Depth 10
    }

    try {
        $Response = Invoke-RestMethod -Uri $Uri -Method $Method -Headers $headers -Body $jsonBody -ContentType "application/json"
        return $Response
    }
    catch {
        Write-Error "Failed to invoke Kanka API request: $_"
    }
}
