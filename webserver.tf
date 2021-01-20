provider "aws" {
	region = "${var.region}"
}

resource "aws_instance" "danfirstec2" {
	ami = "ami-0be2609ba883822ec"
	instance_type = "t2.micro"
	vpc_security_group_ids = ["${aws_security_group.danInstance.id}"]
	key_name = "emr-miao"
	user_data = <<-EOF
				#!/bin/bash
				yum install httpd -y
				echo "Welcome Daniel, this is created by Terraform" > /var/www/html/index.html
				yum update -y
				service httpd start
				EOF

	#tags {
	#	Name = "Daniel_Web_Server"
	#}

}


resource "aws_security_group" "danInstance" {
	name = "terraform-security-group"

	# Inbound HTTP from anywhere
	ingress {
		from_port = "${var.web_server_port}"
		to_port = "${var.web_server_port}"
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	# Inbound SSH from anywhere
	ingress {
		from_port = "${var.ssh_port}"
		to_port = "${var.ssh_port}"
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}

	# outbound to anywhere
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}

}