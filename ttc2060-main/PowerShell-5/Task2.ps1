# PowerShell-5 Task02
param (
    [string]$filename = "C:\Users\Kylmä Sami\Desktop\New folder\url.txt"
)

# if exists
if (-not (Test-Path $filename)) {
    Write-Host "The $filename does not exist."
    Exit
}

$urls = Get-Content $filename

if ($urls.Count -eq 0) {
    Write-Host "No URLs found in the file."
} else {
    Write-Host "Opening URLs in the default browser:"
    foreach ($url in $urls) {
        Start-Process $url
        Write-Host "Opened: $url"
    }
}