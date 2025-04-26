$Resourcegroupname = "my-cli-rg"
$location = "Central India"
$nsgname = "my-cli-nsg"

$nsgrule1 = New-AzNetworkSecurityRuleConfig -Name "Allow-RDP" -Access Allow -Protocol Tcp -Direction Inbound -Priority 120 -SourcePortRange * -DestinationPortRange 3389 -SourceAddressPrefix Internet -DestinationAddressPrefix "10.150.15.0/24"
$nsgrule2 = New-AzNetworkSecurityRuleConfig -Name "Allow-Http" -Access Allow -Protocol Tcp -Direction Inbound -Priority 130 -SourcePortRange * -SourceAddressPrefix Internet -DestinationPortRange 80 -DestinationAddressPrefix "10.150.15.0/24"

New-AzNetworkSecurityGroup -Name $nsgname -ResourceGroupName $Resourcegroupname -Location $location -SecurityRules $nsgrule1,$nsgrule2