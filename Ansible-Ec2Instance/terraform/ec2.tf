resource "aws_instance" "ec2"  {    
    availability_zone = var.availability_zone
    key_name = var.keypair
    instance_type = "t2.micro"
    ami = var.ami
    root_block_device {
        delete_on_termination = "true"
        volume_size = 8
        volume_type = "gp2"
    }
    vpc_security_group_ids = [aws_security_group.ec2-sg.id]

    tags = {
    "Name" = "Mattermost-Instance"
    }

    user_data = <<EOF
      #!/bin/bash
      sudo apt update
      sudo apt upgrade -y
    EOF
 
}


resource "aws_security_group" "ec2-sg" {

  vpc_id = var.vpcID
  description = "allow inbound access to the EC2 instance"
  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 443
    to_port     = 443
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 80
    to_port     = 80
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 8065
    to_port     = 8065
    cidr_blocks = [ "0.0.0.0/0" ]
  }
  ingress {
    protocol    = "tcp"
    from_port   = 5432
    to_port     = 5432
    cidr_blocks = [ "0.0.0.0/0" ]
  }

    egress{
    protocol    = "-1"
    from_port   = 0
    to_port     = 0
    cidr_blocks = [ "0.0.0.0/0" ]
  }

}

output "public-ip" {
  description = "Instance public ip"
  value = aws_instance.ec2.public_ip
}