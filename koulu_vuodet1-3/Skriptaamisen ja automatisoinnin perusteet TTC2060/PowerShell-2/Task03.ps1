#PowerShell-2 Task03

param(
[string]$parameter, [string]$paramet, [string]$param
)
$str = $parameter,$paramet,$param
Write-Host "Parameters are:" $str
$sorted = $str | Sort-Object -Property Length
Write-Host "Your ordered words are:" $sorted
