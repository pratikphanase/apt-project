$ErrorActionPreference = "Stop"

# Navigate to terraform directory
Set-Location -Path "$PSScriptRoot/../terraform"

Write-Host "Initializing Terraform..."
terraform init

Write-Host "Applying Terraform configuration..."
terraform apply -auto-approve

Write-Host "Deployment complete!"
$ALB_DNS = terraform output -raw alb_dns_name

Write-Host "------------------------------------------------"
Write-Host "ALB DNS Name: $ALB_DNS"
Write-Host "Test URLs:"
Write-Host "  http://$ALB_DNS/"
Write-Host "  http://$ALB_DNS/health"
Write-Host "------------------------------------------------"
