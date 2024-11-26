module "pavan" {


    source = "../ec2"


    ami = var.ami
    instance = var.instance
    key = var.key

}


