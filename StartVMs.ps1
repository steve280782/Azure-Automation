workflow StartVMs
{
	#Runbook hashed together by Steve Winwood 
    
    #By default, errors in PowerShell do not cause workflows to suspend, like exceptions do.
	# This means a runbook can still reach 'completed' state, even if it encounters errors
	# during execution. The below command will cause all errors in the runbook to be thrown as
	# exceptions, therefore causing the runbook to suspend when an error is hit.
	$ErrorActionPreference = "Stop"
	
	# Grab the credential to use to authenticate to Azure. 
	$Cred = Get-AutomationPSCredential -Name "[insert Azure automation user here]"

	# Connect to Azure
	Add-AzureAccount -Credential $Cred | Write-Verbose

	# Select the Azure subscription you want to work against
	Select-AzureSubscription -SubscriptionName "[insert subscription name here" | Write-Verbose

	# Start the VMs
	Start-AzureVM -Name [name of VM] -ServiceName [name of Cloud Service]
  # multiple start VM commands can be listed here
}
