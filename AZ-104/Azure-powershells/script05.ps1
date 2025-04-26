$Resourcegroupname = "my-cli-rg"
$networkname = "my-cli-vnet"
$subnetname = "SubnetB"
$location = "Central India"
$subnetaddress = "10.150.15.0/24"
$ipaddress = "10.150.0.0/16"

$subnet = New-AzVirtualNetworkSubnetConfig -Name $subnetname -AddressPrefix $subnetaddress 

New-AzVirtualNetwork -Name $networkname -Location $location -ResourceGroupName $Resourcegroupname -AddressPrefix $ipaddress -Subnet $subnet