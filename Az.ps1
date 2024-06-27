# Ensure PowerShellGet is installed and updated
if (-not (Get-Module -ListAvailable -Name PowerShellGet)) {
  Write-Output "PowerShellGet is not installed. Please install PowerShellGet."
  exit
} else {
  Write-Output "PowerShellGet is installed. Ensuring it's up to date."
  Install-Module -Name PowerShellGet -Repository PSGallery -Force -AllowClobber
}

# Set PSGallery as trusted
Write-Output "Setting PSGallery as trusted..."
Set-PSRepository -Name PSGallery -InstallationPolicy Trusted

# Sign in to your Azure subscription
$sub = Get-AzSubscription -ErrorAction SilentlyContinue
if (-not $sub) {
  Connect-AzAccount -Identity

}

# If you have multiple subscriptions, set the one to use
Select-AzSubscription -SubscriptionId $sub.Id

# Define the automation account name
$location = "westeurope"
$resourceGroupName = "AutomationAz"

# Ensure the resource group exists
$resourceGroup = Get-AzResourceGroup -Name $resourceGroupName -ErrorAction SilentlyContinue
if (-not $resourceGroup) {
  Write-Output "Creating resource group '$resourceGroupName' in location '$location'."
  $resourceGroup = New-AzResourceGroup -Name $resourceGroupName -Location $location
} else {
  Write-Output "Resource group '$resourceGroupName' already exists."
}

$output = Set-AzAutomationAccount -ResourceGroupName  "AutomationAz"  -Name "AzAutomationMI" -AssignSystemIdentity 
# Assuming $output contains the result of enabling the system-assigned identity
$systemAssignedPrincipalId = $output.Identity.PrincipalId
$subscriptionId = $sub.Id
$roleAssignment = New-AzRoleAssignment -ObjectId $systemAssignedPrincipalId -Scope "/subscriptions/$subscriptionId" -RoleDefinitionName "Contributor"
$SAMI = $systemAssignedPrincipalId

if ($SAMI) {
  $roleAssignment = $null
  $roleAssignment = New-AzRoleAssignment -ObjectId $SAMI -Scope $scope -RoleDefinitionName "Contributor" -ErrorAction SilentlyContinue
  else ($roleAssignment) {
      Write-Output "Role assignment successful for Automation Account at subscription level."

  } 
}
# Ask the user if they want to retrieve resource usage
$userChoice = Read-Host "Do you want to get Resource usage? (Y/N)"
if ($userChoice -eq "Y") {
  $startDate = Read-Host "Enter the start date (format: YYYY-MM-DD)"
  $endDate = Read-Host "Enter the end date (format: YYYY-MM-DD)"
  
  # Ensure the dates are valid
  try {
    [datetime]::ParseExact($startDate, "yyyy-MM-dd", $null)
    [datetime]::ParseExact($endDate, "yyyy-MM-dd", $null)
    
    # Fetch and display the usage details
    $usageDetails = Get-AzConsumptionUsageDetail -StartDate $startDate -EndDate $endDate -ErrorAction SilentlyContinue
    if ($usageDetails) {
      $usageDetails | Format-Table -AutoSize
    } else {
      Write-Output "No usage details found for the specified date range."
    }
  } catch {
    Write-Output "Invalid date format. Please use the format YYYY-MM-DD."
  }
} elseif ($userChoice -eq "N") {
  Write-Output "Skipping resource usage retrieval."
} else {
  Write-Output "Invalid input. Please enter Y or N."
}
