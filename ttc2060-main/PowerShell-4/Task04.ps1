# PowerShell-4 Task04
$x = 0
$kontsa = Get-Date -Format "dd/mm/yyyy HH:mm"

while (1){
    $inpu = Read-Host "Give a file name, press enter to quit"
if ([string]::IsNullOrEmpty($inpu)){
    break
}
else {
    Set-Content -Path "$HOME/$inpu.txt" -Value $kontsa | Out-Null
    $x += 1
}
}

Write-Host "Successfully created $x files"