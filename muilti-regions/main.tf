provider "aws" {

    region = "ap-south-1"
    alias = "mumbai"
  
}
provider "aws" {

    region = "us-east-1"
    alias = "virginia"
  
}



resource "aws_s3_bucket" "kumar" {

    bucket = "gotetipavankumar02"
    provider = aws.virginia
  
}

resource "aws_instance" "pavan" {

    ami = "ami-0327f51db613d7bd2"
    key_name = "pavan"
    instance_type = "t2.micro"
  
}
