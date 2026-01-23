# PowerShell-1 Task03
$int1 = Read-Host "Give the first integer: "
$int2 = Read-Host "Give the second integer: "
$int3 = [int]$int1
$int4 = [int]$int2
Write-Host "Sum is" ($int3+$int4)
Write-Host "Substraction is" ($int3-$int4)
Write-Host "Multiplication is" ($int3*$int4)
Write-Host "Division is" ($int3/$int4)