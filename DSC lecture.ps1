<# #DSC class

#psdsiredstateconfiguration - 12 resources

#in DSC 3 state
1 Authoring
2 staging
3 Enacting (Execution) 



#>

Find-Module -Includes DscResource
Install-Module 
Get-DscResource -Name service -Syntax
Get-DscResource -Module psdesiredstateconfiguration  #to check the DSC resources

#DSC Example
<#
configuration config1
    {
    Import-DscResource -ModuleName psdesiredstateconfiguration
    Node kundan-comp
        {
        service Bits_service
            {
                Name="BITS"
                State="Stopped"

            }

        }
}
#>

#To run DSC config

Start-DscConfiguration -Path C:\Users\Administrator\config1 -Verbose

Get-DscLocalConfigurationManager 

##Task

Find-Module -Name xnetworking | Install-Module
Import-Module -Name xnetworking
Get-DscResource -Module xnetworking
Get-DscResource -Name xhostsfile -Syntax
configuration config2
{
Import-DscResource -ModuleName xnetworking

Node Kundan-comp
{
    xhostsfile Host_chagne1
    {
    Hostname="kundan.com"
    IPAddress="127.0.0.1"
    Ensure ="Absent" #to remove the host entry
  
    }
   <# #xhostsfile Host_chagne2
    {
    Hostname="ntms.com"
    IPAddress="127.0.0.1"
   # DependsOn= "[xhostsfile]Host_chagne1"
  
   }#>
    }
}

Start-DscConfiguration -Path C:\Users\Administrator\config2 -Wait -Verbose

#Task 2
Get-DscResource -Name file -Syntax
$csvdetils=Import-Csv -Path C:\Users\Administrator\comp.csv
Configuration foldercretion
{
    param (
    [Parameter(Mandatory)]
    [String]
    $compName='localhost'
    #[Parameter(Mandatory)]
    #[String]
    #$Displayname,
    #[Parameter(Mandatory)]
    #[String]
    #$Path,
    #[Parameter(Mandatory)]
    #[String]
    #$cred=$(Get-Credential),
    #[Parameter()]
    #[String[]] $compName = 'localhost'
    )
    
    
    Import-DscResource -ModuleName psdesiredstateconfiguration
        
        Node $compName
        {
         file Folder_1
            {
               
                DestinationPath = "c:\Kundan\Task2"

            }
    }
}

foreach ($comp in $compName)
{
foldercretion  -

}