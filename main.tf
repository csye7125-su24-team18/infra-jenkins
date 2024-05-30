terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  required_version = ">= 0.12"
}

provider "aws" {
  profile = "infra"
  region  = var.region
}


# Creating an EC2 instances

resource "aws_instance" "jenkins_tf_instance" {
  ami             = var.ami
  instance_type   = var.instances_type
  subnet_id       = aws_subnet.jenkins_tf_subnet.id
  security_groups = [aws_security_group.jenkins_tf_sg.id]
  key_name        = var.key

  tags = {
    Name = var.instances_name
  }
}

