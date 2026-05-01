resource "aws_internet_gateway" "aws_IG" {
    vpc_id = aws_vpc.main_vpc.id
    tags = {
      "Name" = "demo_IG" 
    }
  
}