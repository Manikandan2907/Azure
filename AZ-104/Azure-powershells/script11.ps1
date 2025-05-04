$resourceGroupName="my-cli-rg"
$networkName="my-cli-vnet"
$subnetName="SubnetA"
$subnetAddressPrefix="10.150.12.0/24"
$addressPrefix="10.150.0.0/16"
$location="Central India"

$subnet=New-AzVirtualNetworkSubnetConfig -Name $subnetName -AddressPrefix $subnetAddressPrefix

New-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroupName `
-Location $location -AddressPrefix $addressPrefix -Subnet $subnet

$publicIPAddressName="my-cli-ip"

$publicAddress=New-AzPublicIpAddress -Name $publicIPAddressName -ResourceGroupName $resourceGroupName `
-Location $location -AllocationMethod Static

$networkInterfaceName="my-cli-eni"

$VirtualNetwork = Get-AzVirtualNetwork -Name $networkName -ResourceGroupName $resourceGroupName

$subnet=Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $VirtualNetwork -Name $subnetName

$networkInterface=New-AzNetworkInterface -Name $networkInterfaceName -ResourceGroupName $resourceGroupName `
-Location $location -SubnetId $subnet.Id -IpConfigurationName "IpConfig"

$ipConfig=Get-AzNetworkInterfaceIpConfig -NetworkInterface $networkInterface
$networkInterface | Set-AzNetworkInterfaceIpConfig -PublicIpAddress $publicAddress -Name $ipConfig.Name

$networkInterface | Set-AzNetworkInterface

$networkSecurityGroupName="my-cli-nsg"

$nsgRule1=New-AzNetworkSecurityRuleConfig -Name "Allow-RDP" -Access Allow -Protocol Tcp `
-Direction Inbound -Priority 120 -SourceAddressPrefix Internet -SourcePortRange * `
-DestinationAddressPrefix 10.150.12.0/24 -DestinationPortRange 3389

$nsgRule2=New-AzNetworkSecurityRuleConfig -Name "Allow-HTTP" -Access Allow -Protocol Tcp `
-Direction Inbound -Priority 130 -SourceAddressPrefix Internet -SourcePortRange * `
-DestinationAddressPrefix 10.150.12.0/24 -DestinationPortRange 80

$networkSecurityGroup=New-AzNetworkSecurityGroup -Name $networkSecurityGroupName -ResourceGroupName $resourceGroupName `
-Location $location -SecurityRules $nsgRule1,$nsgRule2

Set-AzVirtualNetworkSubnetConfig -Name $subnetName -VirtualNetwork $VirtualNetwork `
-NetworkSecurityGroup $networkSecurityGroup -AddressPrefix $subnetAddressPrefix

$VirtualNetwork | Set-AzVirtualNetwork

$vmName="my-cli-vm"
$vmSize="Standard_B2s"


$vmConfig=New-AzVMConfig -Name $vmName -VMSize $vmSize
$Credential=Get-Credential

Set-AzVMOperatingSystem -VM $vmConfig -Credential $Credential -Windows -ComputerName $vmName

Set-AzVMSourceImage -VM $vmConfig -PublisherName "MicrosoftWindowsServer" `
-Offer "WindowsServer" -Skus "2022-Datacenter" -Version "latest"

$networkInterfaceName="my-cli-eni"
$networkInterface = Get-AzNetworkInterface -Name $networkInterfaceName -ResourceGroupName $resourceGroupName

$vm=Add-AzVMNetworkInterface -VM $vmConfig -Id $networkInterface.Id

New-AzVM -ResourceGroupName $resourceGroupName -Location $location -VM $vm


