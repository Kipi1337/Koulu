# PowerShell-4 Task02
 function Get-Filuinfo2 {
    param(
        [string] $format
    )
    Get-ChildItem $HOME -Filter "*$format"| Where-Object {
        $_.PSIsContainer -eq $False
    } | Select-Object Name, Length, LastWriteTime
}
