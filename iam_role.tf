 resource "aws_iam_role" "role" {
    name = "demo_iam_role"
    assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Principal = {
          Service = "ec2.amazonaws.com"
        }

        Action = "sts:AssumeRole"
      }
    ]
  })
 }

 data "aws_iam_policy" "policy" {
    arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
   
 }

 resource "aws_iam_role_policy_attachment" "iam_attach" {
    role = aws_iam_role.role.name
    policy_arn = data.aws_iam_policy.policy.arn
   
 }

 resource "aws_iam_instance_profile" "instance_profile" {
    name = "ec2_access_s3"
    role = aws_iam_role.role.name 
 }