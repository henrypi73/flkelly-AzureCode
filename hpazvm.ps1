$cred = Get-Credential
New-AzResourceGroup `
   -ResourceGroupName "HPrg" `
   -Location "EastUS"
New-AzVm `
    -ResourceGroupName "HPrg" `
    -Name "HPVM" `
    -Location "SouthAfricanorth" `
    -VirtualNetworkName "hpVnet" `
    -SubnetName "mySubnet" `
    -SecurityGroupName "HPSG" `
    -PublicIpAddressName "myPublicIpAddress" `
    -Credential $cred
