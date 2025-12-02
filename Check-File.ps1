
Param(
    [Parameter(Mandatory = $true)]
    [string]$NomFitxer
)

function Comprovar-Fitxer {
    Param(
        [string]$Fitxer
    )

    if (Test-Path $Fitxer) {
        Write-Host "El fitxer existeix en aquesta ruta." -ForegroundColor Green
    } else {
        Write-Host "No s'ha trobat el fitxer $Fitxer" -ForegroundColor Yellow
    }
}

Comprovar-Fitxer -Fitxer $NomFitxer

do {
    $resposta = Read-Host "Vols continuar? (s/n)"
} while ($resposta -notmatch '^[snSN]$')

if ($resposta -match '^[nN]$') {
    Write-Host "Finalitzant script..." -ForegroundColor Cyan
    exit
}

Write-Host "Continuant..." -ForegroundColor Green
