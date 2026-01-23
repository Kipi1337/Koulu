# PowerShell-4 Task01
function Get-Filuinfo {
    Get-ChildItem $HOME | Where-Object {
        $_.PSIsContainer -eq $False
    } | Select-Object Name, Length
}