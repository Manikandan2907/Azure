$Resourcegroupname = "my-cli-rg"
$location = "Central India"
$publicipname = "Publicip2"

New-AzPublicIpAddress -Name $publicipname -ResourceGroupName $Resourcegroupname -Location $location 
