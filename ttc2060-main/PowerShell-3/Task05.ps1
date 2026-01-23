# PowerShell-3 Task05

param(
[string]$foldername , [string]$filename 
)

$location = $foldername | Get-ChildItem -File



if (Test-Path -Path $foldername)
    {
    $confirm = Read-Host "$foldername, all "$location.count" files will be renamed to $filename? [y/n]"
    if ($confirm -eq 'y') {
    Get-ChildItem -Path $location -Recurse | ForEach-Object -Begin { $i = 1 } -Process { Rename-Item $_ -NewName $filename$i ; $i++ }
    }
}


else {
    Write-Host "$foldername folder does not exist"
    Start-Sleep -Seconds 3
    break
}

$dirAsDir = Get-Item $foldername
$files = $dirAsDir | Get-ChildItem -File
Write-Host $files.count "renamed in" $dirAsDir
