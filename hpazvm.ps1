Function Connect-to-ARM
{
    Login-AzAccount
  
    $subscriptions = Get-AzSubscription | Sort-Object SubscriptionName | Select-Object Name,SubscriptionId
    [int]$subscriptionCount = $subscriptions.count
    Write-Host "Found" $subscriptionCount "Subscriptions"
    $i = 0
    foreach ($subscription in $subscriptions)
    {
      $subValue = $i
      Write-Host $subValue ":" $subscription.Name "("$subscription.SubscriptionId")"
      $i++
    }
    Do 
    {
      [int]$subscriptionChoice = read-host -prompt "Select number & press enter"
    } 
    until ($subscriptionChoice -le $subscriptionCount)
    
    Write-Host "You selected" $subscriptions[$subscriptionChoice].Name
    Select-AzSubscription -SubscriptionId $subscriptions[$subscriptionChoice].SubscriptionId
}

Connect-to-ARM

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
