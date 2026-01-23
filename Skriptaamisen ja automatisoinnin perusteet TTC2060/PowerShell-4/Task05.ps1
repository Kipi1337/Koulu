# PowerShell-4 Task05
param(
    [string]$foldername
)

if (Test-Path -Path $foldername){
Get-ChildItem $foldername | Where-Object {$_.PSIsContainer -eq $False} | Select-Object Name > "$HOME/files.txt"
Write-Host "Success"
}
else {
    Write-Host "Sorry, $foldername folder does not exist"
}