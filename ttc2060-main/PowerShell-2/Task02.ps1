# PowerShell-2 Task02
$search = Read-Host "Please, give the folder to search: "
$dirAsDir = Get-Item $search
$files = $dirAsDir | Get-ChildItem -File
Write-Host $files.count "files found at" $dirAsDir