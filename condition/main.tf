variable "create_instance" {

    type = bool
    default = true
  
}


resource "aws_instance" "pavan" {

    count = var.create_instance ? 1 : 0
    ami = ""
    instance_type = "t2.micro"
    key_name = "pavan"



    tags = {
      Name = "server1"
    }
  
}
