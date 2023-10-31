You are asked by your Supervisor to create a Three Tier Terraform Architecture for an Application.

Prerequisites for this exercise include..
* AWS account
* Terraform Installed on your machine
* GIT for version Control


# Create AWS S3 bucket

***first Step**** Start by creating an AWS S3 bucket with the name `tf-test-bucket-yourpreferred` 

***2nd Step**** Make sure you enable Versioning in your S3 Bucket to every version of the objects stored in your bucket.

***3rd Step*** Create a Folder in your S3 bucket and name it 'uploads' so you can identify where you save your objects. 

Make sure you save your Terraform template for `s3_bucket.tf` in your local machine.



# create VPC 
Write a Terraform script to set up a Virtual Private Cloud (VPC) in AWS with the following:

- **Step 1**: Create a VPC with CIDR block `10.0.0.0/16`.

- **Step 2**: Create a subnet in that VPC with CIDR block `10.0.1.0/24`.

- **Step 3**: Attach an internet gateway to the VPC.

use `aws_vpc.tf` as your filename in your directory 


# create EC2 instance for your project 
- **Step 1**: Launch an EC2 instance with type `t2.micro`.

- **Step 2**: Make sure to use an Amazon Linux 2 AMI from your AWS Account

- **Step 3**: Tag the instance with "Environment: Dev" to differentiate from staging area. 

use Security group to open required ports and block unauthorized access. 



Commands to use in this exercise

`terraform init` ---- to initialize your working directory 
`terraform fmt`  ---- used to rearrange your terraform script.
`terraform validate` ----- used to check if your script is properly formatted and valid. 
`terraform plan auto-approve` ---- its used to preview your scripts and what resource will be created
`terraform apply -auto-approve` ----- It is used to create the resources on your script. 


