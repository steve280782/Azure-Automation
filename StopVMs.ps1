workflow StopVMs
{
	# Script hacked together by Steve Winwood
    
    # By default, errors in PowerShell do not cause workflows to suspend, like exceptions do.
	# This means a runbook can still reach 'completed' state, even if it encounters errors
	# during execution. The below command will cause all errors in the runbook to be thrown as
	# exceptions, therefore causing the runbook to suspend when an error is hit.
	$ErrorActionPreference = "Stop"
	
	# Grab the credential to use to authenticate to Azure. 
	$Cred = Get-AutomationPSCredential -Name "[insert automation user here]"

	# Connect to Azure
	Add-AzureAccount -Credential $Cred | Write-Verbose

	# Select the Azure subscription you want to work against
	Select-AzureSubscription -SubscriptionName "[insert subscription name here]" | Write-Verbose

	# Stop a list of VMs
	Stop-AzureVM -Name [insert VM name] -ServiceName [insert Cloud Service Name] -Force
    #Multiple stop VM commands can be listed here
}
# Preliminary steps
# 1 Create Azure Automation Instance
# 2 Create Azure user to be used to authenticate automation and set password by logging into web portal
# 3 Create Credential (Asset) for this user under the Azure automation instance
# 4 Create Schedule (Asset) under the Azure automation instance
