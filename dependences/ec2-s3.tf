resource "aws_s3_bucket" "pavan" {

    bucket = "gotetipavankumar123"
    depends_on = [ aws_instance.kumar ]
  
}


resource "aws_instance" "kumar" {

    ami = "ami-0327f51db613d7bd2"
    instance_type = "t2.micro"
    key_name = "pavan"
  
}