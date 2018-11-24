#Enter Resource Group name here
$rgName=Read-Host "Enter Resource Group Name"
#Enter location here
$location=Read-host "Enter Region/Location Name"
#Enter VM name
$vmName=Read-Host "Ënter VM prefix Name"
#Enter number of VMs
$i=Read-Host "Ënter number of VMs" 
#Create Resource Goup
New-AzureRmResourceGroup -Name $rgName -Location $location
#Create Subnet and virtual network
$websubnet=New-AzureRmVirtualNetworkSubnetConfig -Name webSubnet -AddressPrefix 10.20.1.0/24 
$dbsubnet=New-AzureRmVirtualNetworkSubnetConfig -Name dbSubnet -AddressPrefix 10.20.2.0/24
$appsubnet=New-AzureRmVirtualNetworkSubnetConfig -Name appSubnet -AddressPrefix 10.20.3.0/24
$vnet=New-AzureRmVirtualNetwork -Name vnet10 -ResourceGroupName $rgname -Location $location -AddressPrefix 10.20.0.0/16 -Subnet $websubnet,$dbsubnet,$appSubnet 
#Create Availability Set
$webAS=New-AzureRmAvailabilitySet -ResourceGroupName $rgname -Location $location -Name webAS1 -PlatformUpdateDomainCount 4 -PlatformFaultDomainCount 2 -Sku aligned
#Set credential        
$creds = Get-Credential
# Create VMs/jobs for Web Tier.
for($k = 0; $k -lt $i; $k++) { New-AzureRmVm -Name $vmName$k  -Credential $creds -ResourceGroupName $rgName -Location $location -VirtualNetworkName $vnet.Name -SubnetName $vnet.Subnets[0].Name -ImageName Win2016Datacenter -Size standard_b1s -AvailabilitySetName $webAS.Name -AsJob 

# Get all jobs and wait on them.
Get-Job | Wait-Job
"All jobs completed"
Get-AzureRmVM
#Automate IIS install
}
Get-azurermvm -ResourceGroupName $rgName |%{ Set-AzureRmVMExtension -ResourceGroupName $rgName `
    -ExtensionName "IIS" `
    -VMName $_.Name `
    -Location $location `
    -Publisher Microsoft.Compute `
    -ExtensionType CustomScriptExtension `
    -AsJob `
    -TypeHandlerVersion 1.8 `
    -SettingString '{"commandToExecute":"powershell Add-WindowsFeature Web-Server; powershell Add-Content -Path \"C:\\inetpub\\wwwroot\\Default.htm\" -Value $($env:computername)"}'
    
}
