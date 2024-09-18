resource "aws_security_group" "allow ssh" { 
   name = "allow_sssh"
   description = "allow port  number 22"


  egress {
       from_port  = 0
       to_port    = 0
       protocol   = "-1"
       cidr_blocks = ["0.0.0.0/0"]
       ipv6_cidr_blocks = ["::/0"]
  }

   ingress {

       from_port = 22
       to_port = 22
       protocol = "tcp
       cidr_blocks = ["0.0.0.0/0"] #allow from every one
       ipv6_cidr_blocks = ["::/0"]
    }

}

