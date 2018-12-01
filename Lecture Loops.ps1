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
$b=$true
while ($b)
{
$in=Read-Host "Enter your Birth Date"
if ($in -match "^(0?[1-9]|[12][0-9]|3[0-1])[-](0?[1-9]|1[0-2])[-]\d\d$")
{

Write-Host Your input is accepted -ForegroundColor Green
$b=$false

}

else
{

Write-Host You have not entered the date in proper format use format dd-mm-yy.

}
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
#############################################################################################

##Regula expression digit match

$b=$true
While ($b)
{
$in=Read-Host "Enter your birth date"
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

#psobject

$hashtable=@{fname="Kundan";lname="Patil"}
$users=New-Object PSCustomObject -Property $hashtable ##one way to create pscustome object
$object=[pscustomobject] $hashtable   ##another way to create pscustome object

#################################################################################################

$einput=Get-Content -Path "C:\Kundan\10.txt"
$einput | Get-Member
Get-Member -InputObject $einput
foreach ($in in $einput)
{
    if ($in -match "error$")
    {
    Write-Host "Error exist in file $($in)"
    }



}



###################################################################################
#credential
$cred=Get-Credential
$cred|Get-Member
$cred.Password |Get-Member
###
$username="Kundan"
$password="122332" | ConvertTo-SecureString -AsPlainText -Force

$cred=New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username,$password

$pas=$password | ConvertFrom-SecureString
$pas | Out-File -FilePath "c:\kundan\Pss.txt"

$pasword1=Get-Content -Path "c:\kundan\Pss.txt" | ConvertTo-SecureString

#########################################################################################

##Profile

$profile
new-item -ItemType file -Path C:\Users\VMware\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1

########################################################################################################


