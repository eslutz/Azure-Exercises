@allowed([
  'nonprod'
  'prod'
])
param environmentType string
param location string
param storageAccountName string

var storageAccountSkuName = environmentType == 'prod' ? 'Standard_GRS' : 'Standard_LRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

output storageAccountCreationTime string = storageAccount.properties.creationTime
