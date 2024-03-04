# Import the Azure module
Import-Module Az.Accounts
Import-Module Az.Storage

# Set the storage account name and resource group
$storageAccountName = "az104storage1001"
$resourceGroupName = "az-104"

Connect-AzAccount 

# Get the storage account
$storageAccount = Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccountName

# Generate new keys
$newKey1 = New-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName -KeyName "key1"
$newKey2 = New-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName -KeyName "key2"

# Display the new keys
Write-Host $newKey1.Keys[0].KeyName $newKey1.Keys[0].Value
Write-Host $newKey2.Keys[1].KeyName $newKey2.Keys[1].Value

# Get the connection string
$connectionString = "DefaultEndpointsProtocol=https;AccountName=$storageAccountName;AccountKey=$($newKey1.Keys[0].Value)"

Write-Host "Storage Account Connection String: $connectionString"
