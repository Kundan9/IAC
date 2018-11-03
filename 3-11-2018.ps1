Start-Transcript C:\Satish
Get-ChildItem | Get-Process
Get-Service 

##loops

#For
Update-Help
get-help about_for -ShowWindow

$N= @(1,2,3,4,5)

for ( $d=0;$d-le 4;$d++) #expression
{

$N[$d]                 #code block

}
#############################


for ( $d=0;$d-le 4;$d++) #expression
{

Write-Host "*"                 #code block

}
#############################

for ( $d=4;$d-ge 1;$d--) #expression
{

    for ($f=0;$f -lt $d;$f++)
    {
        Write-Host "*" -NoNewline      #code block
    }
Write-Host ""

}
################################

for ( $d=1;$d-le 4;$d++) #expression
{

    for ($f=0;$f -lt $d;$f++)
        {
            Write-Host "*" -NoNewline      #code block
        }
         
    
Write-Host ""

}
for ( $d=3;$d-ge 1;$d--) #expression
{

    for ($f=0;$f -lt $d;$f++)
    {
        Write-Host "*" -NoNewline      #code block
    }
Write-Host ""

}

############################################

## For Each loop

for ( $d=1;$d-le 10;$d ++) #expression
{

   New-Item -Path C:\Kundan\$d.txt

}
################################\
Get-Help about_foreach -ShowWindow

$files=Get-ChildItem -Path C:\Kundan 

    foreach ($file in $files)
        {
        
             Remove-Item $file.FullName
             #$file.Delete()
                          

        }
###################################

## While Loop

while (Get-Process -Name notepad)

{

Stop-Process -Name notepad 

}

###################################

## Do While Loop


##IF else

$files=Get-ChildItem -Path C:\Windows\System32\*.dll 
$Comparedate= [datetime] "1 Jan 2017"
#$Comparedate= (Get-Date).AddYears(-3)

   foreach ($file in $files)
   {

   if($file.CreationTime -lt $Comparedate )

   {

   $file.Name |Out-File -FilePath C:\Kundan\dll.txt -Append

   Write-Host -ForegroundColor Green "The File $($file.name) are older than 2017"

   }
   Else
   {

   Write-Host -ForegroundColor Red "The File $($file.name) are not older than 2017"
   }
   }
##########################################################################\

Get-Process | Export-Csv -Path C:\Kundan\process.csv
$olderstate=Import-Csv -Path C:\Kundan\process.csv

$newstate=Get-Process

foreach ($new in $newstate)

{

if ($olderstate | ?{$_.name -eq $new.name})

{
Write-Host "No Worry"
}
Else
{
$new.name |Out-File -FilePath C:\Kundan\new.txt -Append
}

}