$ErrorActionPreference = "Stop"

# Navigate to terraform directory
Set-Location -Path "$PSScriptRoot/../terraform"

Write-Host "Destroying Terraform infrastructure..."
terraform destroy -auto-approve

Write-Host "Destruction complete."
