$sub = Get-AzSubscription -ErrorAction SilentlyContinue
if (-not $sub) {
  Connect-AzAccount  -Identity
}

Select-AzSubscription -SubscriptionId $sub.Id
