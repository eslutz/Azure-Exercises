@description('The name of the environment. This must me dev, test, or prod.')
param envName string = 'dev'
@description('The unique name of the solution. This is used to ensure resource names are unique.')
param solutionName string = 'toyhr${uniqueString(resourceGroup().id)}'
@description('The number of App Service plan instances.')
param appServicePlanInstanceCount int = 1
@description('The name and tier of the App Service plan SKU.')
param appServicePlanSku object = {
  name: 'F1'
  tier: 'Free'
}
@description('The Azure region where these resources should be deployed.')
param location string = 'eastus'

var appServicePlanName = '${envName}-${solutionName}-plan'
var appServiceAppName = '${envName}-${solutionName}-app'

resource appServicePlan 'Microsoft.Web/serverfarms@2024-04-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSku.name
    tier: appServicePlanSku.tier
    capacity: appServicePlanInstanceCount
  }
}

resource appServiceApp 'Microsoft.Web/sites@2024-04-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}
