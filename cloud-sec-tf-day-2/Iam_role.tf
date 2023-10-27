resource "aws_iam_role" "iam_ec2" {
  name = "ec2-iam-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "ec2.amazonaws.com",

        }
      }
    ]
  })
}

resource "aws_iam_policy" "example" {
  name = "iam-policy"

  # Define the policy document with permissions for the EC2 instance
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:GetObject",
          "s3:ListBucket",
          "s3:DeleteObject",
          "s3:PutObject"
        ],
        Effect   = "Allow",
        Resource = ["arn:aws:s3:::backend-terra-hash"]
      },
      # Add other permissions as needed
    ]
  })
}


resource "aws_iam_instance_profile" "iam_ec2" {
  name = "iam-instance-profile"

  # Attach an IAM role to the instance profile
  role = aws_iam_role.iam_ec2.name
}

# create IAM role for VPC flow log
resource "aws_iam_role" "vpc_log" {
  name = "low-log-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "vpc-flow-logs.amazonaws.com"
      },
    }],
  })
}


# create IAM policy to disable root user
resource "aws_iam_policy" "disable_root_user" {
  name        = "disable-root-user"
  description = "Deny all actions for the root user"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Action   = "*",
      Effect   = "Deny",
      Resource = "*",
      Condition = {
        Bool = {
          "aws:RequestTag/root" = "true"
        }
      }
    }],
  })
}

resource "aws_iam_user" "root_user" {
  name = "root"
}


#create IAM policy to disable root user
resource "aws_iam_user_policy_attachment" "disable_root_user" {
  policy_arn = "arn:aws:iam::152918265083:policy/disable-root-user"
  user       = aws_iam_user.root_user.name
}


# create IAM role for confid
resource "aws_iam_role" "config_role" {
  name = "config-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "config.amazonaws.com"
        }
      }
    ]
  })
}


resource "aws_iam_policy" "config_policy" {
  name        = "config-policy"
  description = "Preferred AWS Config policy"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "config:DeliverConfigSnapshot",
          "config:PutEvaluations",
          "config:StartConfigRulesEvaluation",
          "config:StopConfigRulesEvaluation",
        ],
        Effect   = "Allow",
        Resource = "*",
      },
    ]
  })
}

