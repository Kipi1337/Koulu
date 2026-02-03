# PowerShell-5 Task03
param (
    [string]$filename = "C:\Users\Kylmä Sami\Desktop\New folder\users.csv",
    [switch]$NoPassword
)

# Check if the file exists
if (-not (Test-Path $filename)) {
    Write-Host "Error: The specified file does not exist."
    Exit
}

# csv data
$userdata = Import-Csv $filename

if ($userdata.Count -eq 0) {
    Write-Host "No user data found in the file."
} else {
    $createdCount = 0
    $skippedCount = 0

    foreach ($user in $userdata) {
        $lastname = $user.LastName.Substring(0, 4).ToLower()
        $firstname = $user.FirstName.Substring(0, 2).ToLower()
        $accountname = $lastname + $firstname
        $fullname = $user.Firstname + " " + $user.Lastname

        # Confirmation
        $confirmation = Read-Host "Create local user account '$fullname'? (Y/N)"
        if ($confirmation -eq "Y" -or $confirmation -eq "y") {
            try {
                # Create account
                $params = @{
                    Name = $accountname
                    fullname = $fullname
                    AccountNeverExpires = $true
                }
                Write-Host "To Remove-LocalUser -Name $accountname"

                if (-not $NoPassword) {
                    $params["Password"] = Read-Host -Prompt "Enter password for $accountname" -AsSecureString
                }
                $createdCount++
                New-LocalUser @params
            }
            catch {
                Write-Host "Failed to create local user account: $accountname"
                $skippedCount++
            }
        } else {
            Write-Host "User account creation skipped for: $accountname"
            $skippedCount++
        }
    }
    Write-Host "Successfully created $createdCount user accounts."
    Write-Host "Skipped $skippedCount user account creations."
}