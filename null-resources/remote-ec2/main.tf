resource "aws_instance" "pavan" {
    ami = "ami-04e81358dc84d661d"
    instance_type = "t2.micro"
    key_name = "my-key"
tags = {
  Name = "server-remote"
}


  
}


resource "aws_key_pair" "my_key" {
  key_name   = "my-key"
  public_key = file("C:/Users/91807/.ssh/id_ed25519.pub") # Path to your public key
}


resource "null_resource" "install_apache" {
  depends_on = [aws_instance.pavan]

  provisioner "remote-exec" {
    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("C:/Users/91807/.ssh/id_ed25519") # Path to your private key
      host        = aws_instance.pavan.public_ip
    }

    inline = [
      "sudo yum update -y",
      "sudo yum install -y httpd",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }
}


