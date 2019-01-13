$%New-Item -ItemType Directory c:\Kundan
New-Item -ItemType File C:\kundan\test.txt
Set-Content -Value "Test" -Path "C:\Kundan\test.txt" 
Get-Content -Path "C:\Kundan\test.txt" | Out-File -FilePath "C:\kundan\test.txt" -Append
"Test1" | Out-File "C:\Kundan\test.txt" -Append

Get-Item -Path "Env:\Path" | add-c

Get-EventLog -LogName Application | select source 
Write-EventLog -ComputerName NTMS_PC10 -LogName Application -Source chrome -EventId 1004 -Message "My name is Kundan"

$myvar="This is test" 
$myvar | Get-Member
$myvar.ToUpper()
$myvar.Length
$myvar.Substring(0,4)
$myvar.Contains('is')
$myvar.AddDays(4)
$myvar | Get-Date -UFormat "%Y-%m-%d"

$service= Get-Service
$file= $service | Select name,statu
$file | Out-File -FilePath "c:\Kundan\service-$myvar.txt"

