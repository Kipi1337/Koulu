# PowerShell-3 Task01
param(
[string]$foldername = "OneDrive"
)

if (Test-Path -Path $foldername) {
    Write "$foldername exists"
    $files = $foldername | Get-ChildItem -File
    Write-Host $files.count "files found at" $foldername
    $names = Get-ChildItem -File $foldername | Select Name
    Write-Output $names
}

else {
    Write-Host "Sorry, $foldername does not exist"
}