$Resourcegroupname = "my-cli-rg"
$networkname = "my-cli-vnet"
$subnetname = "SubnetB"
$ipaddress = "10.150.15.0/24"

$VN = Get-AzVirtualNetwork -Name $networkname -ResourceGroupName $Resourcegroupname

Add-AzVirtualNetworkSubnetConfig -Name $subnetname -VirtualNetwork $VN -AddressPrefix $ipaddress

$VN | Set-AzVirtualNetwork