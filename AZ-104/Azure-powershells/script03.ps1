$Resourcegroupname = "my-cli-rg-10"
$networkname = "my-cli-vnet"

$VN = Get-AzVirtualNetwork -Name $networkname -ResourceGroupName $Resourcegroupname

Write-Host $VN.Location
Write-Host $VN.AddressSpace.AddressPrefixes