
Param(
    [Parameter(Mandatory = $true)]
    [double]$Valor1,

    [Parameter(Mandatory = $true)]
    [double]$Valor2,

    [Parameter(Mandatory = $true)]
    [string]$Operacio
)

function Calcular {
    Param(
        [double]$A,
        [double]$B,
        [string]$Op
    )

    switch ($Op) {
        "+" { return $A + $B }
        "-" { return $A - $B }
        "*" { return $A * $B }
        "/" { 
            if ($B -eq 0) {
                Write-Host "Error: divisió entre zero no permesa." -ForegroundColor Red
                exit
            }
            return $A / $B 
        }
        default {
            Write-Host "Operació no vàlida. Usa +, -, * o /" -ForegroundColor Yellow
            exit
        }
    }
}

$resultat = Calcular -A $Valor1 -B $Valor2 -Op $Operacio
Write-Host "Resultat: $resultat" -ForegroundColor Green
