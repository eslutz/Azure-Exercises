@allowed([
  'nonprod'
  'prod'
])
param environmentType string = 'nonprod'
param location string = 'eastus'
param storageAccountName string = 'toylaunch${uniqueString(resourceGroup().id)}'
param appServiceAppName string = 'toylaunch${uniqueString(resourceGroup().id)}'

module storageAccount 'modules/storage.bicep' = {
  name: 'storageAccount'
  params: {
    environmentType: environmentType
    location: location
    storageAccountName: storageAccountName
  }
}

module appService 'modules/appService.bicep' = {
  name: 'appService'
  params: {
    environmentType: environmentType
    location: location
    appServiceAppName: appServiceAppName
  }
}

output storageAccountCreationTime string = storageAccount.outputs.storageAccountCreationTime
output appServiceAppHostName string = appService.outputs.appServiceAppHostName
