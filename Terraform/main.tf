provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }
}

resource "aws_instance" "web" {
  ami           = "ami-03d315ad33b9d49c4"
  instance_type = "t2.micro"
  key_name      = "ubuntu-terraform"
  
  tags = {
    Name = "Docker"
  }
}

output "public_dns" {
  value = "${aws_instance.web.public_dns}"
}