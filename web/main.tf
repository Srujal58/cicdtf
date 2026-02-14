#ec2  instance Congiguration.

resource "aws_instance" "server" {
  ami           = "ami-09547c8673abb0190"
  instance_type = "t2.micro"
  subnet_id     = var.public_subnet
  security_groups = [var.security_group]

  tags = {
    Name = "my-ec2-instance"
  }
}