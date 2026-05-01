resource "aws_route_table" "Pub_rt" {
    vpc_id = aws_vpc.main_vpc.id
}
resource "aws_route_table" "Pri_rt" {
    vpc_id = aws_vpc.main_vpc.id
}
resource "aws_route_table_association" "name1" {
    route_table_id = aws_route_table.Pub_rt.id
    subnet_id = aws_subnet.sub1.id
    
}
resource "aws_route_table_association" "name2" {
    route_table_id = aws_route_table.Pub_rt.id
    subnet_id = aws_subnet.sub2.id  
}
resource "aws_route_table_association" "name3" {
    route_table_id = aws_route_table.Pri_rt.id
    subnet_id = aws_subnet.pri_sub1.id
    
}
resource "aws_route_table_association" "name4" {
    route_table_id = aws_route_table.Pri_rt.id
    subnet_id = aws_subnet.pri_sub2.id
    
}
resource "aws_route" "name1" {
    route_table_id = aws_route_table.Pub_rt.id
    destination_cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_IG.id
} 
resource "aws_route" "name2" {
    route_table_id = aws_route_table.Pri_rt.id
    destination_cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.aws_nat.id
}

