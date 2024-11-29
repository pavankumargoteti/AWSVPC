resource "aws_instance" "name" {

    ami = "ami-0327f51db613d7bd2"
    instance_type = "t2.micro"
    key_name = "pavan"


    for_each = toset(var.pavan)

    tags = {
      Name = each.value
    }
  
}


variable "pavan" {

    type = list(string)
    default = [ "linux","aws","devops","aws-devops" ]
  
}




resource "aws_instance" "pavan" {

    ami = ""
    instance_type = "t2.micro"
    key_name = "pavan"

    count = 3


    tags = {
      Name = "server"
    }
  
}

resource "aws_instance" "pavan1" {

    ami = ""
    instance_type = "t2.micro"
    key_name = "pavan"

    count = 3

    tags = {
      Name = "pavan"
      Name = "pavan-${count.index}"
    }
  
}


resource "aws_instance" "pavan03" {

    ami = ""
    instance_type = "t2.micro"
    key_name = "pavan"

    count = length(var.pavan)

    tags = {
      Name  = "server"
      Name = var.pavan[count.index]
    }
  
}

variable "pavan" {

    type = list(string)
    default = [ "linux","aws","devops","aws-devops" ]


}