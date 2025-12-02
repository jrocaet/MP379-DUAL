Param(
    [Parameter(Mandatory=$true)]
    [string]$RutaISO,

    [Parameter(Mandatory=$true)]
    [string]$RutaDesti
)

$iso = Mount-DiskImage -ImagePath $RutaISO -PassThru
$lletra = ($iso | Get-Volume).DriveLetter + ":\"

Write-Host "ISO muntada a $lletra" -ForegroundColor Green

$fitxer = Get-ChildItem "$lletra" | Select-Object -First 1

if ($fitxer) {
    Copy-Item $fitxer.FullName -Destination $RutaDesti
    Write-Host "Fitxer copiat a $RutaDesti" -ForegroundColor Cyan
} else {
    Write-Host "No s'ha trobat cap fitxer dins l'ISO." -ForegroundColor Yellow
}

Dismount-DiskImage -ImagePath $RutaISO
