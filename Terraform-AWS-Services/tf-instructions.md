# Lab 1 - Create an S3 bucket to store Terraform state files

In this lab you will create an S3 bucket that will be used to store Terraform state files

## Create The Terraform Configurations

1. You can find the Terraform configuration for the S3 bucket [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/tree/main/Terraform-AWS-Services-Creation/terraform-state-s3-bucket). The Terraform configuration files are used to create an S3 bucket that will store your TFSTATE.

The Terraform `main.tf` will do a few things:
- Create the S3 bucket in the `us-east-1` region
- Ensure that version enabling is set to `True`
- Utilize AES256 encryption 

2. Create the bucket by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply - To create the resource



# Lab 2 - Create an Elastic Container Registry Repository

In this lab you will create a repository to store the Docker image that you created for the Uber app.

## Create the ECR Terraform Configuration

1. You can find the Terraform configuration for ECR [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/tree/main/Terraform-AWS-Services-Creation/ECR). The Terraform configuration files are used to create a repository in Elastic Container Repository (ECR). 

The Terraform `main.tf` will do a few things:
- Use a Terraform backend to store the `.tfstate` in an S3 bucket
- Use the `us-east-1` region, but feel free to change that if you'd like
- Use the `aws_ecr_repository` Terraform resource to create a new respository. 

2. Create the bucket by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply - To create the resource



# Lab 3 - Create An EKS Cluster and IAM Role/Policy

In this lab you will create:
- The appropriate IAM role and policy for EKS.
- The EKS cluster

## Create the EKS Terraform Configuration

1. You can find the Terraform configuration for EKS [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/tree/main/Terraform-AWS-Services-Creation/EKS-With-Worker-Nodes). The Terraform configuration files are used to create an EKS cluster and IAM Role/Policy for EKS. 

The Terraform `main.tf` will do a few things:
- Use a Terraform backend to store the `.tfstate` in an S3 bucket
- Use the `us-east-1` region, but feel free to change that if you'd like
- Use the `aws_iam_role` and `aws_iam_policy` Terraform resource to create a new IAM configuration. 

2. Create the bucket by running the following:
- `terraform init` - To initialize the working directory and pull down the provider
- `terraform plan` - To go through a "check" and confirm the configurations are valid
- `terraform apply - To create the resource



# Lab 4 - Create EKS Cluster With CICD

In this lab, you'll learn how to create an EKS cluster using GitHub Actions. The code can be found [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/tree/main/Terraform-AWS-Services-Creation/EKS-With-Worker-Nodes)


## Secrets
Prior to running the pipeline, you'll need to set up authentication from GitHub to AWS. To do that, you'll set up secrets.

You'll need an AWS Access Key ID and an AWS Secret Access Key as those are the two secrets you'll be adding into the GitHub repository. These two secrets will allow you to connect to AWS from GitHub Actions.

1. In the code repository, go to Settings --> Secrets
2. Add in two secrets:
`AWS_ACCESS_KEY_ID`
`AWS_SECRET_ACCESS_KEY`

The values should come from an AWS Access Key and Secret Key. The access key/secret key must be part of a user that has policies attached for the resources being created in AWS.

3. Save the secrets.

## Pipeline
Now that the secrets are created, it's time to create the pipeline.

1. Under the GitHub repository, click on the **Actions** tab
2. Under **Get started with Actions**, click the *set up a workflow yourself* button
3. Inside of the workflow, copy in the contents that you can find [here](https://github.com/AdminTurnedDevOps/DevOps-The-Hard-Way-AWS/blob/main/.github/workflows/main.yml)

The pipeline does a few things:
- On line 4, you'll see `workflow_dispatch`, which means the pipeline won't automatically run unless you kick it off. You can of course change this to have the pipeline automatically run if you, for example, push code to the `dev` or `main` branch.
- The code is checked-out
- Authentication occurs to AWS
- Terraform is set up
- Terraform init occurs
- Terraform format occurs
- Terraform plan occurs
- Terraform apply occurs

4. Run the pipeline and watch as the pipeline automatically creates the EKS cluster


DONE... 