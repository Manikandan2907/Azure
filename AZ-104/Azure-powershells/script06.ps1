$Resourcegroupname = "my-cli-rg"
$networkname = "my-cli-vnet"
$subnetname = "SubnetB"
$location = "Central India"
$networkinterfacename = "my-cli-eni"

$VN = Get-AzVirtualNetwork -Name $networkname -ResourceGroupName $Resourcegroupname
$subnet = Get-AzVirtualNetworkSubnetConfig -VirtualNetwork $VN -Name $subnetname   

New-AzNetworkInterface -Name $networkinterfacename -ResourceGroupName $Resourcegroupname -Location $location -SubnetId $subnet.Id -IpConfigurationName "IpConfig"