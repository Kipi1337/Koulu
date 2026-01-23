# PowerShell-5 Task04
param (
    [string]$filename = "ok"
)

# local user info
$localUsers = Get-LocalUser | Select Name, FullName, SID, Lastlogon

# array for local user info
$userInfoArray = @()

foreach ($user in $localUsers) {
    $userInfo = [PSCustomObject]@{
        'Name' = $user.Name
        'FullName' = $user.FullName
        'SID' = $user.SID
        'LastLogon' = $user.lastLogon
    }
    $userInfoArray += $userInfo
}

# export to csv
if ($userInfoArray.Count -gt 0) {
    $userInfoArray | Export-Csv -Path "$filename.csv" -NoTypeInformation
    Write-Host "Local user information exported to $filename"
} else {
    Write-Host "No local users found on the computer."
}