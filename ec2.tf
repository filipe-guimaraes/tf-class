data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "webserver-01" {
  instance_type   = var.instance_type
  ami             = data.aws_ami.ubuntu.id
  subnet_id       = aws_subnet.public_subnet_01.id
  security_groups = [aws_security_group.webserver-01.id]

  tags = {
    Name = var.project_name
  }
}

