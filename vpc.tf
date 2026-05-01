terraform {
  required_providers {
    aws = { 
        source = "hashicorp/aws"
      version = "5.55.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"

}
resource "aws_vpc" "main_vpc" {
    cidr_block = "10.0.0.0/24"
    tags = {
      "Name" = "demo_vpc" 
    }
  
}




