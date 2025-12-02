Add-Type -AssemblyName PresentationFramework

$test = Test-NetConnection -ComputerName "8.8.8.8" -Port 53

if ($test.TcpTestSucceeded -eq $true) {
    [System.Windows.MessageBox]::Show("Connexió TCP correcta!", "Xarxa OK")
} else {
    [System.Windows.MessageBox]::Show("Error de connexió TCP.", "Xarxa KO")
}
