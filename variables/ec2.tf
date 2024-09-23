# creating ec2 using variavles

resource "aws_instance" "variableterraform"{
        ami = var.ami
        instance_type = var.instance_type
        vpc_security_group_id = [aws_security_group.venu.id]
        tags = var.tags
}


resource "aws_security_group" "venu"{
     name= var.sg_mame
     description= var.sg_description

     #usually we allow all form the outbound traffic
     # below is called block in terrform and if it have = it called key pairs
     egress {

        from_port= 0
        to_port = 0
        protocol = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        
     }

     igress {
        from_port= var.from_port
        to_port= var.to_port
        protocol = var.protocol
        cidr_blocks = var.venu_cidr
        ipv6_cidr_blocks = ["::/0"]
     }

     tags = var.tags
}