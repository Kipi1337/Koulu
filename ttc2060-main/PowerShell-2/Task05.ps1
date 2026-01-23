# PowerShell-2 Task05

param(
[string]$ping = "192.168.1.1", [int32]$pong = 10
)

$i = 1

$confirm = Read-Host "I will try to ping address" $ping $pong "time(s), Okay? [y/n]"
if ($confirm -eq 'y') {
    # go forward otherwise break
for ($i ; $i -lt $pong+1; $i++) {
  Write-Host "try $i to ping" $ping
  Start-Sleep -Seconds 1 #for stimulating time inbetween pings
}
}