$Resourcegroupname = "my-cli-rg"
$location = "Central India"
$networkname = "my-cli-vnet"
$ipaddress = "10.150.0.0/16"

New-AzVirtualNetwork -Name $networkname -ResourceGroupName $Resourcegroupname -Location $location -AddressPrefix $ipaddress
