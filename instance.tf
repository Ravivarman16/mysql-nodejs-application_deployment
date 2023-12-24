# 1.Providing aws details:

provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

# 2.Creating security group for testing instance:
resource "aws_security_group" "testing-sc" {
  name        = "testing-instance"
  description = "security group for AWS EC2 instances"

  # Ingress rules (inbound traffic)
  # Allow SSH (port 22) from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow application & jenkins (port 8080) from anywhere
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow mysql database (port 3306) from anywhere
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["172.31.0.0/16"]
  }

  # Allow HTTP (port 80) from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rules (outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "testing-instance"
  }
}

# 3.Creating security group for deployment instance:
resource "aws_security_group" "deployment-sc" {
  name        = "deployment-instance"
  description = "security group for AWS EC2 instances"

  # Ingress rules (inbound traffic)
  # Allow SSH (port 22) from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow HTTP (port 80) from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow node-exporter (port 9100) from anywhere
  ingress {
    from_port   = 9100
    to_port     = 9100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow prometheus (port 9090) from anywhere
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow grafana (port 3000) from anywhere
  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow docker-daemon (port 9323) from anywhere
  ingress {
    from_port   = 9323
    to_port     = 9323
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress rules (outbound traffic)
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "deployment-instance"
  }
}

#4.Creating testing instance:
resource "aws_instance" "jenkins-instance" {
  ami                    = "ami-07b36ea9852e986ad"
  instance_type          = "t2.small"
  availability_zone      = "us-east-2a"
  key_name               = "ravi2"
  vpc_security_group_ids = ["${aws_security_group.testing-sc.id}"]
  user_data              = file("testing.sh")

  tags = {
    Name = "testing-instance"
  }
}

#5.Creating deployment instance:
resource "aws_instance" "deployment-instance" {
  ami                    = "ami-07b36ea9852e986ad"
  instance_type          = "t2.micro"
  availability_zone      = "us-east-2b"
  key_name               = "ravi2"
  vpc_security_group_ids = ["${aws_security_group.deployment-sc.id}"]
  user_data              = file("deployment.sh")

  tags = {
    Name = "deployment-instance"
  }
}

#6.Creating mysql database:
resource "aws_db_instance" "mydb" {
  identifier             = "nodejs-db"
  allocated_storage      = 20
  storage_type           = "gp2"
  db_name                = "nodejs"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t2.micro"
  username               = "admin"
  password               = "nodejs123"
  parameter_group_name   = "default.mysql5.7"
  availability_zone      = "us-east-2c"
  skip_final_snapshot    = true
  vpc_security_group_ids = ["${aws_security_group.testing-sc.id}"]
  tags = {
    Name = "nodejs-db"
  }
}

#7. Getting the output of mysql database:
output "rds_endpoint" {
  value = aws_db_instance.mydb.endpoint
}
