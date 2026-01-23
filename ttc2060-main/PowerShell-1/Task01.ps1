#PowerShell-1 Task01
$name = $env:username
$date = Get-Date -Format "dd/mm/yyyy"
Write-Host "logged in username is $name and today is $date"