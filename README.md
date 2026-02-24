# PowerShell Azure Automation Scripts

A collection of PowerShell scripts for automating common Azure tasks.

## Scripts

### RotateStorageKeys.ps1
Rotates Azure Storage Account keys and outputs the new connection string.

**Prerequisites:** `Az.Accounts`, `Az.Storage` modules

**Usage:**
Update `$storageAccountName` and `$resourceGroupName` before running.
```powershell
.\RotateStorageKeys.ps1
```

---

### UpdateAzureFunctionAppSettings.ps1
Updates a specified app setting across all Azure Function Apps in a resource group.

**Prerequisites:** `Az.Accounts`, `Az.Functions` modules

**Usage:**
Update `$resourceGroupName`, `$appSettingName`, and `$appSettingValue` before running.
```powershell
.\UpdateAzureFunctionAppSettings.ps1
```

---

### cosmos.ps1
Provides helper functions for interacting with Azure Cosmos DB via the REST API, including:
- `Get-AuthorizationHeader` – Generates a HMAC-SHA256 authorization header for Cosmos DB requests
- `upsertDocument` – Upserts a document into a Cosmos DB collection
- `Get-CosmosDocument` – Retrieves a document from a Cosmos DB collection by ID
- `Get-AzureADToken` – Obtains an Azure AD OAuth token using client credentials
- `Get-Sum` – Returns the sum of two numbers

---

### scratch.ps
Scratch/notes file containing miscellaneous commands.

**Example:**
```powershell
Test-NetConnection -ComputerName <IPAddress> -Port <PortNumber>
```
