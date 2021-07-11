@secure()
param repositoryToken string

resource webClient 'Microsoft.Web/staticSites@2020-12-01' = {
  name: 'reproduce-issue-staticsite-client'
  location: resourceGroup().location
  properties: {
    provider: 'GitHub'
    repositoryUrl: 'https://github.com/aleksandervalle/reproduce-staticsite-issue-client'
    branch: 'main'
    repositoryToken: repositoryToken
    buildProperties: {
      appLocation: '/'
      apiLocation: ''
      outputLocation: 'dist'
    }
  }
  sku: {
    name: 'Free'
    tier: 'Free'
  }
}
