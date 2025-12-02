
Param(
    [Parameter(Mandatory = $true)]
    [string]$Source,

    [Parameter(Mandatory = $true)]
    [string]$Destination
)

if (-Not (Test-Path $Source)) {
    Write-Host "El directori origen no existeix." -ForegroundColor Red
    exit
}

if (-Not (Test-Path $Destination)) {
    New-Item -ItemType Directory -Path $Destination | Out-Null
}

$timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$backupPath = Join-Path $Destination "Backup-$timestamp"

New-Item -ItemType Directory -Path $backupPath | Out-Null

Write-Host "Copiant fitxers..." -ForegroundColor Cyan
Copy-Item -Path $Source\* -Destination $backupPath -Recurse -Force

Write-Host "Còpia de seguretat completada: $backupPath" -ForegroundColor Green
