# PowerShell-5 Task05
# add event
function Add-MyEvent {
    param (
        [string]$Type,
        [string]$Message
    )

    $Source = "MyPowerShell"
    $LogName = "Application"

    if (-not [System.Diagnostics.EventLog]::SourceExists($Source)) {
        [System.Diagnostics.EventLog]::CreateEventSource($Source, $LogName)
    }

    $EventLogType = switch ($Type) {
        "Information" { [System.Diagnostics.EventLogEntryType]::Information }
        "Warning" { [System.Diagnostics.EventLogEntryType]::Warning }
        "Error" { [System.Diagnostics.EventLogEntryType]::Error }
        default { [System.Diagnostics.EventLogEntryType]::Information }
    }

    [System.Diagnostics.EventLog]::WriteEntry($Source, $Message, $EventLogType)
}

try {
    # Task04

$filename = "ok"


# local user info
$localUsers = Get-LocalUser | Select Name, SID, Lastlogon

# array for local user info
$userInfoArray = @()

foreach ($user in $localUsers) {
    $userSID = $user.SID
    $lastLogon = $user.LastLogin
    $userInfo = [PSCustomObject]@{
        'Name' = $user.Name
        'FullName' = $user.FullName
        'SID' = $userSID
        'LastLogon' = $lastLogon
    }
    $userInfoArray += $userInfo
}

# export to csv
if ($userInfoArray.Count -gt 0) {
    $userInfoArray | Export-Csv -Path $filename -NoTypeInformation
    Write-Host "Local user information exported to $filename"
}

    # Log event
    Add-MyEvent -Type "Information" -Message "CSV file created successfully."
}
catch {
    # Log error event
    Add-MyEvent -Type "Error" -Message "Failed to create the CSV file: $_"
}