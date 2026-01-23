# Powershell-2 Task01
$files = Get-ChildItem -File "C:\Users\Kylmä Sami"
Write-Host $files.count "files found at C:\Users\Kylmä Sami"