# AWS Infrastructure with Terraform and Node.js

Description: "AWS VPC + ALB + private EC2 ASG running Node.js API using Terraform."

## Prerequisites
- AWS Account
- AWS CLI configured (`aws configure`)
- Terraform installed (v1.5.0+)
- Bash shell (Git Bash on Windows or standard terminal on Linux/Mac)

## Deployment Steps

1. Make scripts executable (if needed):
   ```bash
   chmod +x scripts/*.sh
   ```

2. Run the deploy script:
   ```bash
   ./scripts/deploy.sh
   ```
   This script will initialize Terraform, apply the configuration, and output the ALB DNS name.

## Usage

Once deployed, you can access the API using the ALB URL provided in the output.

**Find ALB URL:**
The `deploy.sh` script prints it at the end. You can also run:
```bash
cd terraform && terraform output -raw alb_dns_name
```

**Test Endpoints:**
```bash
curl http://<ALB_DNS_NAME>/
# Expected: "Hello from private EC2 behind ALB 👋"

curl http://<ALB_DNS_NAME>/health
# Expected: "ok"
```

You can also use the test script:
```bash
./scripts/test.sh <ALB_DNS_NAME>
```

## Teardown

To destroy all resources:
```bash
./scripts/destroy.sh
```
