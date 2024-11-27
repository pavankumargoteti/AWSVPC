



# Create an IAM group
resource "aws_iam_group" "group1" {
  name = "group1"
}

# Create another IAM group
resource "aws_iam_group" "group2" {
name = "group2"
}

# Attach a policy to the developers group
resource "aws_iam_group_policy" "pavankumar" {
  group  = aws_iam_group.group1.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:ListBucket",
      "Resource": "*"
    }
  ]
}
EOF
}

# Attach a policy to the admins group
resource "aws_iam_group_policy" "keerthi" {
  group  = aws_iam_group.group2.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

# Create IAM users
resource "aws_iam_user" "ahkil" {
  name = "ahkil"
}

resource "aws_iam_user" "paparao" {
  name = "paparao"
}

# Add users to groups
resource "aws_iam_user_group_membership" "developer_membership" {
  user = aws_iam_user.ahkil.name
  groups = [
    aws_iam_group.group1.name
  ]
}

resource "aws_iam_user_group_membership" "admin_membership" {
  user = aws_iam_user.paparao.name
  groups = [
    aws_iam_group.group2.name
  ]
}


resource "aws_iam_user" "pavan01" {
  name = "pavan01"
  tags = {
    Environment = "pavankumar"
  }
} 

resource "aws_iam_user_policy" "s3" {
  name   = "s3"
  user   = aws_iam_user.pavan01.name
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}
EOF
}