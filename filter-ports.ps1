Param(
    [Parameter(Mandatory=$true)]
    [ValidateSet("TCP","UDP","ALL")]
    [string]$Tipus
)

if ($Tipus -eq "TCP") {
    Get-NetTCPConnection
} elseif ($Tipus -eq "UDP") {
    Get-NetUDPEndpoint
} else {
    Write-Host "--- TCP ---"
    Get-NetTCPConnection
    Write-Host "--- UDP ---"
    Get-NetUDPEndpoint
}
