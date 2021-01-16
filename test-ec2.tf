###### AWS Key Pair ###################
resource "aws_key_pair" "devkey" {
  key_name   = var.key_name
  public_key = file(var.pub_key)
}


data "aws_ami" "latest_ami" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*"]
  }
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "slack_server" {
  ami                  = data.aws_ami.latest_ami.id
  instance_type        = var.instancetype
  key_name             = var.key_name
  security_groups      = ["default"]
  iam_instance_profile = "Ec2-s3"
  count                = var.ec2_count
  tags = {
    Name = element(var.tags, count.index)
  }
}