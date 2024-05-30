@description('Required. The evaluation frequency of the alert rule.')
@allowed([
  'PT15M'
  'PT30M'
  'PT1H'
])
param evaluationFrequency string = 'PT15M'

@description('Required. Action Group resource names to used to get Action Group resource Ids.')
param associatedActionGroups array = []

@description('Optional. ActionGroupsResourceIds')
var actionGroupsResourceIds = [for associatedActionGroup in associatedActionGroups: resourceId('Microsoft.Insights/actionGroups', associatedActionGroup)]

resource scheduledQueryRule 'Microsoft.Insights/scheduledQueryRules@2023-03-15-preview' = {
  name: name
  location: location
  tags: tags
  properties: {
    actions: { actionGroups: actionGroupsResourceIds
      customProperties: {}
    }
    autoMitigate: autoMitigate
    criteria: {
      allOf: [
        {
          dimensions: [
            {
              name: dimensionsName
              operator: dimensionsOperator
              values: [
                dimensionsValue
              ]
            }
          ]
          failingPeriods: {
            minFailingPeriodsToAlert: minFailingPeriodsToAlert
            numberOfEvaluationPeriods: numberOfEvaluationPeriods
          }
          metricMeasureColumn: metricMeasureColumn
          operator: operator
          query: query
          resourceIdColumn: resourceIdColumn
          threshold: threshold
          timeAggregation: timeAggregation
        }
      ]
    }
    description: description
    displayName: displayName
    enabled: enabled
    evaluationFrequency: evaluationFrequency
    muteActionsDuration: muteActionsDuration
    overrideQueryTimeRange: overrideQueryTimeRange
    ruleResolveConfiguration: {
      autoResolved: autoResolved
      timeToResolve: timeToResolve
    }
    scopes: [
      sourceId
    ]
    severity: alertSeverity
    targetResourceTypes: [
      'Microsoft.OperationalInsights/workspaces'
    ]
    windowSize: windowSize
  }
}
