You are asked by your Supervisor to create a Three Tier Terraform Architecture for an Application.

Prerequisites for this exercise include..
* AWS account
* Terraform Installed on your machine
* GIT for version Control


# Create AWS S3 bucket

***first Step**** Start by creating an AWS S3 bucket with the name 'tf-test-bucket-yourpreferredname' 

***2nd Step**** Make sure you enable Versioning in your S3 Bucket to every version of the objects stored in your bucket.

***3rd Step*** Create a Folder in your S3 bucket and name it 'uploads' so you can identify where you save your objects. 

Make sure you save your Terraform template for 'S3_bucket.tf' in your local machine.





Commands to use in this exercise

'Terraform init' ---- to initialize your working directory 
'Terraform fmt'  ---- used to rearrange your terraform script.
'terraform validate' ----- used to check if your script is properly formatted and valid. 
'terraform plan -auto-approve' ---- its used to preview your scripts and what resource will be created
'terraform apply -auto-approve' ----- It is used to create the resources on your script. 
