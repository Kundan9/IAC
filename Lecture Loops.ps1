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



Class User{



        [String]$FName

        [String]$LName



        [String]Getfullname(){

          

                return "$($($this.FName).substring(0,1))"+"$($this.LName)"

            }



}



$user=New-Object -TypeName User

$user.FName="Dinesh"

$user.LName="Patil"

$user.Getfullname()

 

$user | Export-Csv -Path C:\Kundan\sam.csv -Append 



$FName | Get-Member









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





## IP match 

 192.168.2.2 -match "\b((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\b"



 ##############################################################################################################################



 ##Modules



 $env:PSModulePath ## to get the module path

 Find-Module *bit*

 Get-Module -ListAvailable

 Install-Module -Name BitTitan.Runbooks.Csv

 Get-Command -Module BitTitan.Runbooks.Csv

 Get-Module -ListAvailable | Update-Module



 Save-Module -Name BitTitan.Runbooks.Csv -Path c:\Module

 Get-Module -Name BitTitan.Runbooks.Csv 



#########################################################

##Variable



New-Variable -Name user -Value Kunda -Scope 



Get-help about_scope -ShowWindow

Clear-Variable -Name $tst #to clear the variable



Get-Variable -Scope Global

Get-Variable -Scope local



$global:tst="Mysession"

.\NewTextDocument.ps1



##########

$mytst="Test"

&\NewTextDocument2.ps1

& E:\NewTextDocument.ps1

#####################################################################



##JOb





get-command -noun "*job*"



Start-Job -ScriptBlock {Get-Service}

Get-Job -Name Job1 | FL *

Receive-Job -Name Job4 -Keep





Start-Job -FilePath .\NewTextDocument.ps1 -Name "20sec"

Start-Job -FilePath .\NewTextDocument2.ps1 -Name "60sec"



Get-Job -Name 20sec | Wait-Job -Timeout 20

Get-Job -Name 60sec | Wait-Job -Timeout 60



$20sec= Get-Job -Name 20sec | Receive-Job

$60sec= Get-Job -Name 60sec | Receive-Job



################################



Start-Job -ScriptBlock {Get-Service1} -Name Error



if ($job.State -eq "Failed")

{



$job.childjobs[0].JobStateInfo.Reason | Out-File -FilePath C:\aa.txt



}

elseif ($job.State -eq "Completed")

{



Get-services



}



$job=Get-Job -Name Error



$job | Get-Member

$job.ChildJobs[0].JobStateInfo.Reason

##############################################################################################

##Function ##to reuse the repetative things

Function Get-jobdata
{

$jobs= Get-Service
Write-host "this is the job details " 

&{$jobs}

}

Get-jobdata |ft
###############################

. C:\Kundan\fuction1.ps1

add-name
####################################

function get-serverdetails ($computername,$service)
{

Write-Host "this is your input $computername service $service"

}

get-serverdetails kundan bits

###############################################
##multiple paramerter

function get-osdetails

{

param ($compname ,$service)

#Write-Host "This is my computer name $compname"
#Write-Host "This is my computer service $service"
$os= Get-WmiObject -ComputerName $compname -Class Win32_OperatingSystem
$os

}

get-osdetails -compname localhost 

############################
#to set the dfault value for parmeter we should define this like below

pram ($compname = "localhost")

######################################

#mndtory paramerter

Function get-osdetails
{
[CmdletBinding()]
param ([parameter(mandatory=$true,helpmessage ="give comp name")]
$compname
)
$os= Get-WmiObject -ComputerName $compname -Class Win32_OperatingSystem
$os


}

get-osdetails 

##output
PS C:\WINDOWS\system32> get-osdetails
cmdlet get-osdetails at command pipeline position 1
Supply values for the following parameters:
(Type !? for Help.)
compname: !?
give comp name
compname: 

############################################################

##accept paramert valu for specific data type in Function


Function get-osdetails
{
[CmdletBinding()]
param ([parameter(mandatory=$true,helpmessage ="give comp name")]
[int]$compname
)
$os= Get-WmiObject -ComputerName $compname -Class Win32_OperatingSystem
$os


}

#############################
#Begin, process and End in Function

Function get-servicedisplayname
{
[CmdletBinding()]
param ([parameter(helpmessage ="give comp name",valuefrompipelinebypropertyname=$true)]
[ValidateNotNullOrEmpty()]
[ValidateSet("134", "223", "323")]
[int]$ID
)

Begin{Write-Host "This is my beging block"}
Process{Write-Host "$($_.ID)"}
End{Write-Host "this is my end block"}


}

get-servicedisplayname -ID 134
##################################################
##Error handling
$error.clear() #this should be always on first line when you want to check the erors in script
$error[0] | gm
$error[0].CategoryInfo.Reason

$ErrorActionPreference = "continue" 
$ErrorActionPreference = "" 
get-kundan3 -ErrorAction ignore
Get-Service

Get-Process | get-servicedisplayname
get-help about_functions_advanced_parameters -ShowWindow

Test-Connection -ComputerName kundan3 -ErrorAction Ignore

##################################
#Try and catch

Try
{

Test-Connection -ComputerName kundan -ErrorAction stop
#Get-Service -Name Kundan -ErrorAction SilentlyContinue

}
Catch
{

Write-Host "Error occroured $($_)"

$_.categoryinfo
$_.exception

}

#.net, internet task, module is pending in powershell. peding topic.

############################################################################

#How to write Help, if you are using the single function in the script then dfine like beloe example, but if you have multiple fuction in script then you have to mention the help in fuction code block

<#
.Synopsis
   This Code is do the operation on intergers
.DESCRIPTION
   Test
.EXAMPLE
   Ex.1
.EXAMPLE
   Another example of how to use this cmdlet
.INPUTS
   Inputs to this cmdlet (if any)
.OUTPUTS
   Output from this cmdlet (if any)
.NOTES
   General notes
.COMPONENT
   The component this cmdlet belongs to
.ROLE
   The role this cmdlet belongs to
.FUNCTIONALITY
   The functionality that best describes this cmdlet
#>
function Verb-Noun
{
    [CmdletBinding(DefaultParameterSetName='Parameter Set 1', 
                  SupportsShouldProcess=$true, 
                  PositionalBinding=$false,
                  HelpUri = 'http://www.microsoft.com/',
                  ConfirmImpact='Medium')]
    [Alias()]
    [OutputType([String])]
    Param
    (
        # Param1 help description
        [Parameter(Mandatory=$true, 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0,
                   ParameterSetName='Parameter Set 1')]
        [ValidateNotNull()]
        [ValidateNotNullOrEmpty()]
        [ValidateCount(0,5)]
        [ValidateSet("sun", "moon", "earth")]
        [Alias("p1")] 
        $Param1,

        # Param2 help description
        [Parameter(ParameterSetName='Parameter Set 1')]
        [AllowNull()]
        [AllowEmptyCollection()]
        [AllowEmptyString()]
        [ValidateScript({$true})]
        [ValidateRange(0,5)]
        [int]
        $Param2,

        # Param3 help description
        [Parameter(ParameterSetName='Another Parameter Set')]
        [ValidatePattern("[a-z]*")]
        [ValidateLength(0,15)]
        [String]
        $Param3
    )

    Begin
    {
    }
    Process
    {
        if ($pscmdlet.ShouldProcess("Target", "Operation"))
        {
        }
    }
    End
    {
    }
}
 
####################################################################################################################

##Define Verbose in your script

function get-azurevm1
{

[cmdletbinding()]
    
    Param (
    
            $vmname,
            $Region
    
    
    )

    begin {Write-Host "Starting"}
    process {
    Write-Verbose "Typing Hi"
    Write-Host "Hi"}
    end {Write-Host "Ending"}

  }

###############################################################################################

#Debug

function get-azurevm1
{

[cmdletbinding()]
    
    Param (
    
            $vmname,
            $Region
    
    
    )

    begin {Write-Host "Starting"}
    process {
    Write-Debug "Typing Hi"
    Write-Host "Hi"}
    end {Write-Host "Ending"}

  }
 
################################################################################################

#Modules-


New-ModuleManifest -Path "C:\Kundan\IAC-master\IAC-master\error.psd1" -PowerShellVersion 4.0 -CompanyName NTMS -Copyright "(c) 2019 Kundan. All rights reserved" -FunctionsToExport * -RootModule error.psm1

Get-Module -ListAvailable
Import-Module -Name error -Force

Get-Command -Module error
get-azurevm1





