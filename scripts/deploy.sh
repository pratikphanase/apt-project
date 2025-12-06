#!/bin/bash
set -e

# Navigate to terraform directory
cd "$(dirname "$0")/../terraform"

echo "Initializing Terraform..."
terraform init

echo "Applying Terraform configuration..."
terraform apply -auto-approve

echo "Deployment complete!"
ALB_DNS=$(terraform output -raw alb_dns_name)

echo "------------------------------------------------"
echo "ALB DNS Name: $ALB_DNS"
echo "Test URLs:"
echo "  http://$ALB_DNS/"
echo "  http://$ALB_DNS/health"
echo "------------------------------------------------"
