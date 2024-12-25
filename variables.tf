variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
  default     = "free-tier-ec2"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "dev"
}

variable "owner" {
  description = "Owner of the resources"
  type        = string
  default     = "sohelmohammed0"
}

variable "allowed_ssh_ips" {
  description = "List of IPs allowed to SSH"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
  default     = "ami-053b12d3152c0cc71"
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
  default     = "keypair"
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type = map(string)
  default = {
    Environment = "dev"
    Managed_By  = "Terraform"
    Owner       = "sohelmohammed0"
  }
}