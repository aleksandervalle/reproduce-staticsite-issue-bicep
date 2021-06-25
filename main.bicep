targetScope = 'subscription'

@secure()
param repositoryToken string

resource clientRg 'Microsoft.Resources/resourceGroups@2021-01-01' = {
  location: 'westeurope'
  name: 'reproduce-issue-staticsite-rg'
  properties: {}
}

module webClient './staticsite.bicep' = {
  name: 'webClientModule'
  scope: clientRg
  params: {
    repositoryToken: repositoryToken
  }
}
