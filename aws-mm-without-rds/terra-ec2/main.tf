resource "aws_instance" "ec2" {
    instance_type = "t2.micro"
    ami = var.aws-ami
    availability_zone = var.az
    key_name = var.keyname
    root_block_device {
      delete_on_termination = "true"
      volume_size = 8
      volume_type = "gp2"
    }

    vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  
}

resource "aws_security_group" "ec2-sg" {
    description = "allow inbound outbound traffic"
    vpc_id = var.vpc_ID
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        protocol = "tcp"
        from_port = 22
        to_port = 22
    }
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        protocol = "tcp"
        from_port = 80
        to_port = 80
    }
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        protocol = "tcp"
        from_port = 443
        to_port = 443
    }
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        protocol = "tcp"
        from_port = 8065
        to_port = 8065
    }
    ingress {
        cidr_blocks = [ "0.0.0.0/0" ]
        protocol = "tcp"
        from_port = 5432
        to_port = 5432
    }

    egress {
        cidr_blocks = [ "0.0.0.0/0" ]
        protocol = "-1"
        from_port = 0
        to_port = 0
    }
}

output "ec2_public_ip" {
  value = aws_instance.ec2.public_ip
  description = "ec2 instance public ip"
}