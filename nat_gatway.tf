resource "aws_eip" "nat-eip" {

  domain = "vpc"
}
resource "aws_nat_gateway" "aws_nat" {
    subnet_id = aws_subnet.sub1.id
    allocation_id = aws_eip.nat-eip.id
    depends_on = [ aws_internet_gateway.aws_IG ]
}