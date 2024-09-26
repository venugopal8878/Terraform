resource "aws_instance" "expense" {
    count =3
    ami = data.aws_ami.jiondevops.id
    instance_type = var.environment == "dev" ? "t3.micro" :"t3.small"
    vpc_security_group_ids = [aws_security_group.allowssh.id]
    
    tags ={
        name = var.names[count.index]
    }
}


resource "aws_security_group" "allowssh" {
    name = "allow_ssh"
    description = "this security gruop allow only port 22 for ssh access"

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #allow every from port 22
    ipv6_cidr_blocks = ["::/0"]

  }

  tags = {
    name = "allow_ssh" 
  }
  
}