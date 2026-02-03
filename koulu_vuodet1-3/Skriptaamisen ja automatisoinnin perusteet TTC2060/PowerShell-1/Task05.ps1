# PowerShell-1 Task05
$apps = Get-Command -CommandType Application
Write-Host "There are" $apps.Count "applications in powershell"