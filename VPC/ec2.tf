# create instance 

resource "aws_instance" "dev" {
    ami = "ami-0327f51db613d7bd2"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.pavan.id
    key_name = "pavan"
    tags = {
      Name = "dev-ec2"
    }
}