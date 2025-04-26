$Resourcegroupname = "my-cli-rg"
$vmName="my-cli-vm"
$Diskname = "my-cli-Disk01"

$VM = Get-AzVM -Name $vmName -ResourceGroupName $Resourcegroupname

$VM | Add-AzVMDataDisk -Name $Diskname -DiskSizeInGB 4 -CreateOption Empty -Lun 0
