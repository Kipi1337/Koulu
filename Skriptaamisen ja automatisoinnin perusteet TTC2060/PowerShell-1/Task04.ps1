# PowerShell-1 Task04
$name = @("Peter Parker", "Zoro Roronoa", "Captain Hook", "MC Donalds", "Donald Duck", "Courier 6", "Kola Olli")

Write-Host "There are" $name.count "names on the hit list"
Write-Output $name
Write-Host "First name on the list" $name[0] "Last name on the list" $name[-1]