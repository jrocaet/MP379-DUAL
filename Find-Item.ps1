
Param(
    [Parameter(Mandatory = $true)]
    [string]$Path,

    [Parameter(Mandatory = $true)]
    [string]$Name
)

if (-Not (Test-Path $Path)) {
    Write-Host "La ruta especificada no existeix." -ForegroundColor Red
    exit
}

$found = Get-ChildItem -Path $Path -Recurse -Force -ErrorAction SilentlyContinue |
         Where-Object { $_.Name -like $Name }

if ($found) {
    Write-Host "Resultats trobats:" -ForegroundColor Green
    $found.FullName
} else {
    Write-Host "No s'ha trobat cap element que coincideixi." -ForegroundColor Yellow
}
