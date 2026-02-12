# Arkytechno Claw Bot Infrastructure

Terraform configuration to provision an AWS EC2 instance with a security group that allows SSH (22) and app access (3000) from a single IP, plus a basic user-data bootstrap that installs Node.js LTS and PM2.

## Prerequisites

- Terraform >= 1.3
- AWS credentials configured (e.g., via `~/.aws/credentials` or environment variables)
- An existing EC2 key pair in the target region

## Files

- [main.tf](main.tf): AWS provider, security group, and EC2 instance resources
- [variable.tf](variable.tf): Input variables
- [terraform.tfvars](terraform.tfvars): Example values for variables
- [user-data.sh](user-data.sh): Instance bootstrap script
- [output.tf](output.tf): Outputs (public IP)

## Configuration

Update [terraform.tfvars](terraform.tfvars) with your values:

- `aws_region`: AWS region (default: `ap-southeast-1`)
- `key_name`: EC2 key pair name
- `my_ip`: Your public IP in CIDR format (e.g., `1.2.3.4/32`)
- `ami_id`: Ubuntu 22.04 AMI for the selected region

## Usage

Initialize and deploy:

1. `terraform init`
2. `terraform plan`
3. `terraform apply`

After apply completes, the public IP is available as output:

- `terraform output public_ip`

## SSH Access

Use the key pair corresponding to `key_name`:

- `ssh -i "<key>.pem" ubuntu@<public_ip>`

## Ports

- SSH: 22 (restricted to `my_ip`)
- App: 3000 (restricted to `my_ip`)

## Bootstrap Actions

On first boot, [user-data.sh](user-data.sh) runs:

- Updates packages
- Installs `curl`, `git`, and build tools
- Installs Node.js LTS
- Installs PM2 globally

## Cleanup

To remove resources:

- `terraform destroy`

## Notes

- Ensure your `my_ip` value is current to avoid losing SSH access.
- If you change `my_ip`, re-run `terraform apply` to update security group rules.

## Post-SSH: OpenClaw Onboard

After you SSH into the instance, continue with the OpenClaw onboarding steps.

use the below oneliner command
- ` curl -fsSL https://openclaw.ai/install.sh | bash`