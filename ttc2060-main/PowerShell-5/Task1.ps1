# PowerShell-5 Task01
param(
    [string]$filename = "C:\Users\Kylmä Sami\Desktop\New folder\users.csv"
)

# if exists
if (-not (Test-Path $filename)) {
    Write-Host "The $filename does not exist."
    Exit
}

# account array and csv data
$accounts = @()
$csvData = Import-Csv $filename

if ($csvData.Count -eq 0) {
    Write-Host "No user accounts were created from the file."
}
else {
    Write-Host "User accounts created:"
    foreach ($row in $csvData) {
        $lastName = $row.LastName.Substring(0, 4).ToLower()
        $firstName = $row.FirstName.Substring(0, 2).ToLower()
        $account = $lastName + $firstName
        $accounts += $account
    }
    $accounts | ForEach-Object {
        Write-Host $_
    }
}