$sub = Get-AzSubscription -ErrorAction SilentlyContinue
if (-not $sub) {
  Connect-AzAccount  -Identity
}

SetAzSubscription -SubscriptionId $sub.Id
