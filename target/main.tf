resource "aws_instance" "sankeerthi" {
  


  ami = "ami-04e81358dc84d661d"
  instance_type = "t2.micro"

  key_name = "pavan"

  tags = {
    Name = "redhatserver"
  }
}


resource "aws_s3_bucket" "keerthi" {

    bucket = "gotetipavan"
  
}