# Terraform AWS CI/CD Setup

## GitHub Actions Setup

This project uses GitHub Actions for CI/CD with Terraform.

### Getting Started

1. Clone the repo
2. Create `.github/workflows/terraform.yml`
3. Add the following placeholder:
    ```yaml
    # CI/CD workflow will be configured in the next module
    ```
4. Generate an AWS access key with appropriate IAM policies
5. Add the following secrets to your GitHub repository:
   - `AWS_ACCESS_KEY_ID`
   - `AWS_SECRET_ACCESS_KEY`

The actual CI/CD workflow will be implemented in the next step.
