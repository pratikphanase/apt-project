#!/bin/bash
set -e

# Navigate to terraform directory
cd "$(dirname "$0")/../terraform"

echo "Destroying Terraform infrastructure..."
terraform destroy -auto-approve

echo "Destruction complete."
