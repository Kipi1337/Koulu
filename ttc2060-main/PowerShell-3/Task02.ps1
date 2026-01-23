# PowerShell-3 Task02

param(
[string]$foldername, [string]$filename
)

# Trouble shooting commands when I could not get the filetype to be excluded from the search for 4 hours

#echo $location
#$testi0 = Test-Path -Path $foldername
#$testi1 = Test-Path -Path "$location.*" -PathType Leaf
#echo $testi0
#echo $testi1

$location = "$foldername\$filename"

if (Test-Path -Path $foldername) {
    if (Test-Path -Path "$location.*" -PathType Leaf) {
    Write "$filename exists in the folder $foldername"
    }
    else {
    Write-Host "Sorry, $filename does not exist in the folder $foldername"
    }
}

else {
    Write-Host "Sorry, $foldername does not exist"
}