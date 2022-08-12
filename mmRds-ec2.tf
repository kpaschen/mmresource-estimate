variable "availability_zone" {
  type = string
  default = "eu-central-1a"
}
variable "vpcID" {
  type = string
}

variable "db_username" {
  description = "DB Master username"
  type = string
  sensitive = true
}
variable "db_password" {
  description = "DB Master password"
  type = string
  sensitive = true
}

variable "db_name" {
  type = string
  default = "mattermost"
}


resource "aws_instance" "mm-ec2" {
  ami = "ami-065deacbcaac64cf2"
  instance_type = "t2.micro"
  key_name = "mmkey"
  availability_zone = var.availability_zone
  tags = {
    "Name" = "Terra-EC2-Mattermost"
  }
  root_block_device {
    delete_on_termination = "true"
    volume_size = 8
    volume_type = "gp2"
  }
    vpc_security_group_ids = [ aws_security_group.ec2-sg.id ]
    user_data = <<EOF
#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
sudo apt install postgresql postgresql-contrib
sudo wget https://releases.mattermost.com/7.1.2/mattermost-7.1.2-linux-amd64.tar.gz
sudo tar -xvzf mattermost*.gz
sudo mv mattermost /opt
sudo mkdir /opt/mattermost/data
sudo useradd --system --user-group mattermost
sudo chown -R mattermost:mattermost /opt/mattermost
sudo chmod -R g+w /opt/mattermost
EOF
}

resource "aws_security_group" "ec2-sg" {
  name        = "ec2-security-group"
  description = "allow inbound access to the EC2 instance"
  vpc_id      = var.vpcID

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
}

resource "aws_db_instance" "mm-Rds" {
  allocated_storage = 5
  engine = "postgres"
  engine_version = "14"
  instance_class = "db.t3.micro"
  name = var.db_name
  username = var.db_username
  password = var.db_password
  availability_zone = var.availability_zone
  skip_final_snapshot  = true
  vpc_security_group_ids   = [aws_security_group.rds-sg.id]
  tags = {
    "Name" = "Terra-RDS-Mattermost"
  }
}

resource "aws_security_group" "rds-sg" {
  name = "rds_sg"
  description = "allow inbound access to the RDS instance"
  ingress {
    protocol    = "tcp"
    from_port   = 5432
    to_port     = 5432
    cidr_blocks = [ "0.0.0.0/0" ]
    security_groups = [aws_security_group.ec2-sg.id]
  }
  vpc_id = var.vpcID
}

output "mm-ec2-public-ip" {
  description = "the public ip of Ec2 instance"
  value = aws_instance.mm-ec2.public_ip
}

output "DB-endpont" {
  description = "The endpoint of RDS"
  value = aws_db_instance.mm-Rds.endpoint
}

output "db-name" {
    description = "The name of database"
    value = aws_db_instance.mm-Rds.name
}




