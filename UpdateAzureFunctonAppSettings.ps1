$resourceGroupName = "az-104"

# Set the app setting name and value to update
$appSettingName = "TestSetting"
$appSettingValue = "YourAppSettingValue"

# Connect to Azure using Azure PowerShell
Connect-AzAccount

# Get all Azure Function apps within the resource group
$functionApps = Get-AzFunctionApp -ResourceGroupName $resourceGroupName

# Iterate over each Azure Function app
foreach ($functionApp in $functionApps) {

    # Get the Azure Function app name
    $functionAppName = $functionApp.Name

    Write-Host "Function name: $functionAppName"

    Update-AzFunctionAppSetting -Name $functionAppName -ResourceGroupName $resourceGroupName -AppSetting @{"TestSetting" = "Value1"}
}
