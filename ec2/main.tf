# create instance 

resource "aws_instance" "dev" {
    ami = var.ami
    instance_type = var.instance 
 
    key_name = var.key
    tags = {
      Name = "server-ec2"
    }
}