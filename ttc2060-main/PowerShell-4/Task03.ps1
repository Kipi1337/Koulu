# PowerShell-4 Task03
param(
    [string] $filename
)

$Workstations = @()

while (1){
    $inpu = Read-Host "Give a workstation name, press enter to quit"
if ([string]::IsNullOrEmpty($inpu)){
    break
}
else {
    $Workstations += $input
}
}

foreach($line in $Workstations){
    Add-Content "$HOME/$filename.txt" $line
}

Write-Host "Successfully created $filename and added content"