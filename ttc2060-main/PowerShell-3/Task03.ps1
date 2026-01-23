# PowerShell-3 Task03

param(
[string]$foldername, [string]$filename
)

$location = "$foldername\$filename"

if (Test-Path -Path $foldername) {
    if (Test-Path -Path "$location.*" -PathType Leaf) {
    Write "$filename already exists in the folder $foldername"
    }
    else {
    $confirm = Read-Host "$filename does not exist in the folder $foldername, Would you like to create one? [y/n]"
    if ($confirm -eq 'y') {
    New-Item $location
    }
    }
}

else {
    Write-Host "Sorry, $foldername folder does not exist"
}
