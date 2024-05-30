@description('Required. The resource name.')
param name string = 'Support'

@description('Optional. The list of email receivers that are part of this action group.')
param emailReceivers array = [
  {
    name: 'AlertWasFiredEmail'
    emailAddress: 'some.email@somecompany.com'
    useCommonAlertSchema: false
    status: 'Enabled'
  }
]

@description('Optional. The list of SMS receivers that are part of this action group.')
param smsReceivers array = []

resource actionGroup 'Microsoft.Insights/actionGroups@2023-01-01' = {
  name: name
  location: location
  tags: tags
  properties: {
    groupShortName: groupShortName
    enabled: enabled
    emailReceivers: emailReceivers
    smsReceivers: smsReceivers
    webhookReceivers: webhookReceivers
    armRoleReceivers: armRoleReceivers
    eventHubReceivers: eventHubReceivers
    itsmReceivers: itsmReceivers
    logicAppReceivers: logicAppReceivers
    voiceReceivers: voiceReceivers
    azureAppPushReceivers: azureAppPushReceivers
    azureFunctionReceivers: azureFunctionReceivers
    automationRunbookReceivers: automationRunbookReceivers
  }
}
