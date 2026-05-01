
resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.0.0/26"
    map_public_ip_on_launch =  true
    availability_zone = "ap-south-1a"
}
resource "aws_subnet" "sub2" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.0.64/26"
    map_public_ip_on_launch =  true
    availability_zone = "ap-south-1b"
}
resource "aws_subnet" "pri_sub1" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.0.128/26"
    availability_zone = "ap-south-1a"
}
resource "aws_subnet" "pri_sub2" {
    vpc_id = aws_vpc.main_vpc.id
    cidr_block = "10.0.0.192/26"
    availability_zone = "ap-south-1b"
   
}