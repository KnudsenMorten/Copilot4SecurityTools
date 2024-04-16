#-----------------------------------------------------------------------------
# Microsoft Copilot for Security - Deployment af High Capacity
#-----------------------------------------------------------------------------


# Variables for common values
    $TenantId        = "your-tenant-Id"
    $TemplateFile    = "path-for-template-file"

    # Capacity Resource for Microsoft Copilot for Security
    $SubId           = "your-subscription-id"
    $Location        = "your-region"   # sample: "westeurope"
    $RG              = "your-resource-group" # sample: "rg-copilot-security"
    $ResourceName    = "your unique-resource-name" # sample: "xxxxcopilotsecurity"
    $crossGeoCompute = "Allowed"
    $numberOfUnits   = 4 # can be any number - remember cost per SCU/hour
    $geo             = "your-copilot4security-region" # sample: eu,eastus
    $ResourceType    = "microsoft.securitycopilot/capacities"
    $DeploymentName  = "Deploy" + $ResourceName

<#
    # Connect to Azure (samples)

    # Interactive login
        Connect-AzAccount -Tenant $TenantId -Subscription $SubId

    # Azure App & Secret
        $password = ConvertTo-SecureString "your-secret" -AsPlainText -Force
        $creds = New-Object PSCredential("your-app-id", $password)
        Connect-AzAccount -TenantId $TenantId -Subscription $SubId -Credential $creds -ServicePrincipal

    # Azure App & Certificate thumbprint
        Connect-AzAccount -Tenant $TenantId -Subscription $SubId -ApplicationId "your-azure-app-id" -CertificateThumbprint "your-cert-thumbprint"

    # System-Assigned Managed Identity
        # Ensures you do not inherit an AzContext in your runbook. Out-Null is used to disable any output from this Cmdlet.
            Disable-AzContextAutosave -Scope Process | Out-Null

        # Connect to Azure with system-assigned managed identity.
            $AzureContext = (Connect-AzAccount -Identity).context

        # set and store context. Out-Null is used to disable any output from this Cmdlet.
            Set-AzContext -SubscriptionName $AzureContext.Subscription -DefaultProfile $AzureContext | Out-Null
#>

# Create Resource Group
    If (!(Get-AzResourceGroup -Name $rg -Location $location))
        {
            New-AzResourceGroup -Name $rg -Location $location -Force
        }
    Else
        {
            Write-host "Removing Microsoft Copilot for Security capacity ... Please Wait !"
            Remove-AzResourceGroup $rg `
                                   -Force `
                                   -Verbose

            # create RG again to make sure billing seeing this as a new RG
            New-AzResourceGroup -Name $rg -Location $location -Force
        }


# Deploy
    Write-host "Deploying Microsoft Copilot for Security capacity ... Please Wait !"
    New-AzResourceGroupDeployment `
        -Verbose `
        -Name $DeploymentName `
        -ResourceGroupName $rg `
        -TemplateFile $TemplateFile `
        -capacityName $ResourceName `
        -location $Location `
        -crossGeoCompute $crossGeoCompute `
        -geo $geo `
        -numberOfUnits $numberOfUnits

