provider "aws" {
  region = var.region
}

# Data source for default VPC
data "aws_vpc" "default" {
  default = true
}

# Data source for default subnets
data "aws_subnets" "default" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.default.id]
  }

  filter {
    name   = "default-for-az"
    values = ["true"]
  }
}

# EC2 Instance
resource "aws_instance" "web" {
  ami           = var.ami_id
  instance_type = "t2.micro" # Free tier eligible

  subnet_id                   = tolist(data.aws_subnets.default.ids)[0]
  associate_public_ip_address = true
  key_name                    = var.key_name

  root_block_device {
    volume_size           = 8 # Free tier eligible
    volume_type           = "gp3"
    encrypted             = true
    delete_on_termination = true
  }

  tags = merge(
    {
      Name       = "${var.project_name}-instance"
      Created_At = "2024-12-24 05:36:00"
    },
    var.common_tags
  )

  # Enable basic monitoring (free tier)
  monitoring = false

  # Prevent accidental termination
  disable_api_termination = false
}