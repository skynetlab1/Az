$sub = Get-AzSubscription -ErrorAction SilentlyContinue
if (-not $sub) {
  Connect-AzAccount  
}