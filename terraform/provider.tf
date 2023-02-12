terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region     = "us-east-1"
  access_key = INSERT_ACCESSKEY
  secret_key = INSERT_SECRETKEY
}

// Redirect IPs to host file
resource "local_file" "ec2_public_ip" {
  content  = <<EOF
[webservers]
${aws_instance.achillies-linux.public_ip}
${aws_instance.achillies-linux2.public_ip}
${aws_instance.achillies-linux3.public_ip}
EOF
  filename = "./ansible/host-inventory"
}

