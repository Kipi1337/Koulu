# PowerShell-3 Task04
# Kirjoitusvirheiden tarkistuksessa huomasin pari juttua, korjattu. Ei vaikuttanut tulostukseen

param(
[string]$foldername , [string]$filename , [int]$x  
)

$location = "$foldername\$filename"


if (Test-Path -Path $foldername) 
    {
    $confirm = Read-Host "Folder $foldername, Would you like to create $x files? [y/n]"
    if ($confirm -eq 'y') {
    for ($i = 0 ; $i -lt $x; $i++) {
    $filu = "$i"
    New-Item $location$filu
    }
    }
}


else {
$confirm = Read-Host "$foldername does not exist, would you like to create $foldername and create $x files? [y/n]"
New-Item -ItemType Directory -Path $foldername
    for ($i = 0 ; $i -lt $x; $i++) {
    $filu = "$i"
    New-Item $location$filu
}
}
$dirAsDir = Get-Item $foldername
$files = $dirAsDir | Get-ChildItem -File
Write-Host $x "files have been created in" $dirAsDir
