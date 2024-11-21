resource "aws_vpc" "pavan" {

    cidr_block = "192.168.0.0/16"
    tags = {
      Name = "myVPC"
    }
  
}

resource "aws_subnet" "pavan" {

    vpc_id = aws_vpc.pavan.id
    cidr_block = "192.168.0.0/24"
    tags = {
      Name = "mysubnet"
    }
  
}
resource "aws_internet_gateway" "pavan" {

    vpc_id = aws_vpc.pavan.id

    tags = {
      Nmae ="myINGW"
    }
  
}

resource "aws_route_table" "pavan" {
    vpc_id = aws_vpc.pavan.id
    tags = {
        Name = "myRT"
    }

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.pavan.id
    }
  
}
resource "aws_route_table_association" "pavan" {
    subnet_id = aws_subnet.pavan.id
    route_table_id = aws_route_table.pavan.id
    
  
}

 resource "aws_eip" "nat_eip" {


  tags = {
    Name = "NATGatewayEIP"
  }
}
  

resource "aws_nat_gateway" "pavan" {

    subnet_id = aws_subnet.pavan.id
    allocation_id = aws_eip.nat_eip.id

  
}

resource "aws_security_group" "allow_tls" {

  name        = "allow_tls"
  vpc_id      = aws_vpc.pavan.id
  tags = {
    Name = "dev_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }


  }