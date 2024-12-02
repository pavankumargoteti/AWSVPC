resource "aws_instance" "pavan" {


  ami = var.ami
  instance_type =var.instance

  key_name = var.key



  tags = {

    Name = "sever" 
  }
  
}