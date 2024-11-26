module "pavan2" {

    source = "../ec2"

    ami = "ami-0327f51db613d7bd2"
    instance = "t2.micro"
    key = "pavan"
  
}