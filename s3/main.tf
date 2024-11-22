resource "aws_s3_bucket" "pavan" {
  bucket = "gotetipavankumar22"


  lifecycle {
    create_before_destroy = true
  }
}


  