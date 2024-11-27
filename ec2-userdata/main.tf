resource "aws_instance" "paavn1" {

    ami = "ami-0327f51db613d7bd2"
    instance_type = "t2.micro"
    key_name = "pavan"

    user_data = file("script.sh")


    tags = {
      Name  = "server1"
    }
  
}