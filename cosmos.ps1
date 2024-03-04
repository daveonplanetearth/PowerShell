# create a function to upsert a document in cosmos db using the rest api
function upsertDocument($uri, $key, $database, $collection, $document) {
    $headers = @{
        "x-ms-date" = [DateTime]::UtcNow.ToString("r")
        "x-ms-version" = "2017-02-22"
        "x-ms-documentdb-is-upsert" = "true"
        "x-ms-documentdb-partitionkey" = "[`"id`"]"
        "Content-Type" = "application/json"
    }
    $headers["authorization"] = Get-AuthorizationHeader -Verb "POST" -ResourceId "dbs/$database/colls/$collection" -ResourceType "docs" -Date $headers["x-ms-date"] -MasterKey $key
    $body = $document | ConvertTo-Json -Depth 10
    $response = Invoke-RestMethod -Method "POST" -Uri "https://$uri/dbs/$database/colls/$collection/docs" -Headers $headers -Body $body -ContentType "application/json"
    return $response
}

# create a function to get an azure ad oauth token
function Get-AzureADToken($tenantId, $clientId, $clientSecret) {
    $body = @{
        grant_type = "client_credentials"
        client_id = $clientId
        client_secret = $clientSecret
        resource = "https://management.azure.com/"
    }
    $response = Invoke-RestMethod -Method "POST" -Uri "https://login.microsoftonline.com/$tenantId/oauth2/token" -Body $body
    return $response.access_token
}



function Get-CosmosDocument($uri, $key, $database, $collection, $documentId) {
    $headers = @{
        "x-ms-date" = [DateTime]::UtcNow.ToString("r")
        "x-ms-version" = "2017-02-22"
        "x-ms-documentdb-partitionkey" = "[`"id`"]"
        "Content-Type" = "application/json"
    }
    $headers["authorization"] = Get-AuthorizationHeader -Verb "GET" -ResourceId "dbs/$database/colls/$collection" -ResourceType "docs" -Date $headers["x-ms-date"] -MasterKey $key
    $response = Invoke-RestMethod -Method "GET" -Uri "https://$uri/dbs/$database/colls/$collection/docs/$documentId" -Headers $headers -ContentType "application/json"
    return $response
}

# iterate through files in a directory and sub-directories
$files = Get-ChildItem -Path "C:\temp\files" -Filter "*.json" -Recurse

$files = Get-ChildItem -Path "C:\temp\files" -Filter "*.json"

# iterate over each file write the contents to host







# get sum of two numbers


