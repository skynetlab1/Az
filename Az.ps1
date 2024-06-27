# Set PSGallery as trusted
Write-Output "Setting PSGallery as trusted..."
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# Sign in to your Azure subscription
$sub = Get-AzSubscription -ErrorAction SilentlyContinue
if (-not $sub) {
  Connect-AzAccount  -Identity
}

# If you have multiple subscriptions, set the one to use
Select-AzSubscription -SubscriptionId $sub.Id
