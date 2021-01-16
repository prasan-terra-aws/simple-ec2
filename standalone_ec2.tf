###### AWS Key Pair ###################
resource "aws_key_pair" "devkey" {
  key_name   = var.key_name
  public_key = file(var.pub_key)
}

###### Fetching latest ami image #######
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

############ Provisioning Ec2 Instance ########
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

/*
output "Ec2_PubIP" {
  value = element(length(aws_instance.slack_server[count.index].associate_public_ip_address), count.index)
  #value = aws_instance.slack_server[count.index].associate_public_ip_address
}*/