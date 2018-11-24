Start-Transcript -Path "C:\Kundan\clss.txt"


##if elseif else

$services= Get-Service
foreach ($service in $services)
    {
     
        if($service.StartType -eq "Automatic")

            {

                Write-Host "The service $($service.Name) is Automatic"

            }

                elseif ($service.StartType -eq "Manual")

                    {
                    
                        Write-Host "The Service $($service.Name) is Manual"

                    }
                    
                        else 

                            {

                                Write-Host "The service $($service.Name) is Disabled"
                            }
                            
       

    }

###############################################################################################

##Switch

$services= Get-Service
foreach ($service in $services)
    {
     
       Switch ($service.StartType) ## we can use "Swtich -wildcard()" and -casensitive

            {

                Automatic {
                
                    Write-Host "The service $($service.Name) is Automatic"

                          }

                Manual    {
                
                    Write-Host "The service $($service.Name) is Manual"

                          }

                Disabled  {
                
                    Write-Host "The service $($service.Name) is Disabled"

                    }

                  Default  {
                
                    Write-Host "No other values found"     
                    
                     }

               }                                        

    }
######################################################################################

Get-Help about_regular* -ShowWindow ## this is used to check the hep of concept

########################################################################################

##match case

$in=Read-Host "Enter your Birth Date"
if ($in -match "^[1-31]\-^[1-12]$\-\d{2}$")
{

Write-Host Your input is accepted -ForegroundColor Green

}

else
{

Write-Host You have not entered the date in proper format use format dd-mm-yy.

$in=Read-Host "Enter your Birth Date"
}

#######################################################################################
$b=$true
While ($b)
{
$in=Read-Host "Enter the string"
if ($in -match "^[a-z]{3}\-[a-z]{2}\-[a-z]{1}$")##"^[a-z]{3}-[a-z]{2}-[a-z]{1}$" without escape character also it works
{

Write-Host Your input is accepted -ForegroundColor Green
$b=$false

}

else
{

Write-Host You have not entered the string in proper format use format win-ma-y.

}
}

##########################################################################################
##Objects

#creting object
$azurevm= New-Object System.Object 

# add properties to object
$azurevm |Add-Member -MemberType NoteProperty -Name "Name" -Value "MyVm"
$azurevm |Add-Member -MemberType NoteProperty -Name "Status" -Value "Running"

#creting objet 
$users= New-Object System.Object
$users | Add-Member -MemberType NoteProperty -Name "fname" -Value "Kundan"
$users | Add-Member -MemberType NoteProperty -Name "lname" -Value "Patil"

#creating method
$users | Add-Member -MemberType ScriptMethod -Name "SammaccountName" -Value {"$($($this.fname).substring(0,1))"+ "$($this.lname)"} -Force

$users|Get-Member

#To access method value
$users.SammaccountName()

#Collection of objet

$Adusers=@()

$users.fname="Ravi"
$users.lname="Patil"
$Adusers+=$users

$users.fname="Kundan"
$users.lname="Patil"
