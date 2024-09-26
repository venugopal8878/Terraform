resource "aws_instance" "expense" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.jiondevops.id
  vpc_security_group_ids = [aws_security_group.allowssh.id]
  instance_type          = var.environment == "frontend" ? "t3.micro" : "t3.small"

  tags = {

    Name = var.instance_names[count.index]
  }
}

resource "aws_security_group" "allowssh" {
  name        = "allow ssh"
  description = "this security group is allowed only port 22"

  egress {
    from_port        = 0
    to_port          = 0
    cidr_blocks      = ["0.0.0.0/0"]
    protocol         = "-1"
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    cidr_blocks      = ["0.0.0.0/0"]
    protocol         = "tcp"
    ipv6_cidr_blocks = ["::/0"]
  }
}