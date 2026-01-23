# PowerShell-2 Task04

param(
[string]$name = "Unkown", [int]$Hellos = "3"
)

for ($Hellos ; $Hellos -gt 0; $Hellos--) {
  Write-Host "Hello" $name
}