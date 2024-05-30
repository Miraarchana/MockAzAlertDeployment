using './actionGroup.bicep'

// Action Group - Email Notification - Parameter Definition

param name = 'Support'
param emailReceivers = [
      {
        name: 'email-notification'
        emailAddress: 'your.supportTeam@email.com'
        useCommonAlertSchema: false
        status: 'Enabled'
      }
    ]
