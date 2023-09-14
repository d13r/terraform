# My Terraform Configuration

This is my Terraform configuration, used to create DNS records and so on.

AWS SSO (with 2FA) is used for authentication, so no long-term credentials are stored on disk.

For non-AWS credentials, the `.tfvars` file is stored on S3 and only downloaded into local memory at runtime.

## Usage

```bash
# Install
git clone git@github.com:d13r/terraform.git
cd terraform
bin/setup

# Run
bin/terraform apply

# Optional
bin/logout
```

## One-Time Setup Steps

I had to take the following steps to set this up initially:

### Set up AWS SSO

- Go to the [IAM Identity Center settings](https://eu-west-1.console.aws.amazon.com/singlesignon/) for the correct region (I am using Ireland - `eu-west-1`)
- Click Enable
- Set the AWS access portal URL subdomain to `d13r`
- Click Users > Add user
  - Enter the user details
  - Click Next
  - Click Next
  - Click Add user
- Click Permission sets > Create permission set
  - Select AdministratorAccess
  - Click Next
  - Set Session duration to 4 hours
  - Click Next
  - Click Create
- Click AWS accounts
  - Tick the AWS account in the list
  - Click Assign users or groups
  - Click Users
  - Tick the user created above
  - Click Next
  - Tick AdministratorAccess
  - Click Next
  - Click Submit
- Log into https://d13r.awsapps.com/start
  - Set a new password when prompted
  - Click MFA devices
  - Click Register device
  - Set up one or more MFA devices

### Create an S3 bucket

- Go to the [Amazon S3 console](https://s3.console.aws.amazon.com/s3/get-started?region=eu-west-1)
- Click Buckets > Create bucket
- Set the Bucket name to `d13r-terraform`
- Click Create bucket
