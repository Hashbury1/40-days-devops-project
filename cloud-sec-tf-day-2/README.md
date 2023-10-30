The task is to secure your cloud environment for a company that is migrating its On-premises application to AWS.

Prerequisites for this project include...
* AWS Account
* Terraform installed on your machine 
* code editor 

Please Note: 
You are doing all these using the Terraform template (IaC).
You can also use Terraform modules in case you need to create resources another time.
You need to adhere to best practices for AWS security, like enabling VPC flow logs, disabling root user access etc

Set Up your Virtual Private cloud (VPC) with Public and Private Subnets. 

Deploy an EC2 instance into the Private subnet. This is to ensure that it is not directly accessible from the public internet.

Set up a Security Group (SG) that allows only necessary ports to open eg HTTP and HTTPS 

Use IAM roles and Policies to grant the EC2 instance only the permission it requires. (Grant Only Least Privilege). 

Set up CloudTrail resource to log API calls for your account.

Make Sure you enable encryption for any storage services you are using. You can choose between S3, EBS etc. This ensures data at rest is well protected.

Implement AWS Config to enforce strict security policies for your resources by effective monitoring and assessing the configuration of your AWS resources. 

Set Up a CloudWatch alarm to trigger a notification for any unautorized actions initiated in your account. These alarms can be required to send an immediate alert.

Use AWS Secrets Manager to store sensitive information like Database Credentials. API keys and classified information concerning the application. 

You can also put up an architechural design illustrating your task. 



