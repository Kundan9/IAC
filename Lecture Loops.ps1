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

## Another way of creating the object

##defining our own classess

Get-Help about_class -ShowWindow

###

Class Vm{

        $Name

        [String]status(){
          
                return "stopped"
            }

    }





##############################################################################################################
#Psremoting

Enter-PSSession
Invoke-Command
#Ps sesseion port
#5985- plain text(HTTP)
#5986- Ssl (HTTPS)
 

$psop=New-PSSessionOption -SkipCACheck
Enter-PSSession -ComputerName ntms_pc4 -Credential $crd -UseSSL -Port 5986 -SessionOption $psop 

$crd= Get-Credential

Enable-PSRemoting -Verbose
$comp=$env:COMPUTERNAME

New-SelfSignedCertificate -FriendlyName $comp -DnsName $comp


Get-PSProvidep 
New-Item -path WSMan:\localhost\Listener -Transport HTTPS -Address * -CertificateThumbPrint BB24128B0895314C1E617710E25EBA6BD4FD528C ##ading the https listner for winrm
Get-Item -Path WSMan:\localhost\Client\TrustedHosts
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value 192.168.1.10 -Concatenate ##adding the trusted IP in the list

$ser=@("BITS","ALG")

Invoke-Command -ComputerName NTMS_PC4 -ScriptBlock {get-service -name $args[0,1]} -UseSSL -Port 5986 -SessionOption $psop -Credential $crd -ArgumentList $ser

New-PSSession -ComputerName NTMSPC-9 -Credential $crd -UseSSL -Port 5986 -SessionOption $psop

##Another way to invoke the things form remote machine, this is availble only after 3.0


Invoke-Command -ComputerName NTMS_PC4 -ScriptBlock {get-service -name $using:ser} -UseSSL -Port 5986 -SessionOption $psop -Credential $crd
 
