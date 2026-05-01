output "alb_dns_name" {
    value = aws_lb.demo_lb.dns_name
}

output "aws_ami_name" {
    value = data.aws_ami.ami.name
}

output "aws_bucket_name" {
    value = aws_s3_bucket.s3.bucket
  
}

output "aws_bucket" {
    value = aws_s3_bucket.s3.bucket_domain_name
  
}