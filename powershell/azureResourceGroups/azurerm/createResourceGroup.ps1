Login-AzureRmAccount
  
$subscriptions = Get-AzureRMSubscription | Sort-Object SubscriptionName | Select-Object Name,SubscriptionId
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
Set-AzureRmContext -SubscriptionId $subscriptions[$subscriptionChoice].SubscriptionId


$resourceGroup = Read-Host "Enter Resource Group Name to be created"
write-host "Listing all locations"
Get-AzureRmLocation | Select-Object -Property Location
$location = Read-Host "Enter location in which resource group shold be created" 
New-AzureRmResourceGroup -Name $resourceGroup -Location $location
