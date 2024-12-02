locals {
  environment = "dev"

  instance_type =  "t2.micro"
  ami = "t2.micro"
  key_name = "pavan"
  bucket = "sdfcgvhbjnkwesrdtfyguhijzsdxfcgv"
}


resource "aws_instance" "pavan" {

    ami = local.ami
    instance_type = local.instance_type
    key_name = local.key_name
    

    tags ={
        Name = "server2"

    }
}

resource "aws_s3_bucket" "name" {

    bucket = local.bucket
  
}