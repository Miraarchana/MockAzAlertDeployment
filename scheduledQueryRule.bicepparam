using './scheduledQueryRule.bicep'

// Scheduled Query Rule - Databricks Alert Rule - Parameter Definition

param name  = 'DatabricksAlert'
param displayName = 'Databricks Alert'
param alertSeverity = 3

param query = 'Metrics | where row_count <= threshold'
param windowSize = 'PT6H'
param resourceIdColumn = '_ResourceId'
param metricMeasureColumn = 'count'
param threshold = 0
param associatedActionGroups = ['Support']
