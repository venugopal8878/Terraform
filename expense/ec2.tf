resource "aws_security_group" "venu" {
    name        = "venu" #allow_ssh is already there in my account
    description = "Allow port number 22 for SSH access"

    # usually we allow everything in egress
    egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

    ingress {
        from_port        = 22
        to_port          = 22
        protocol         = "tcp"
        cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
        ipv6_cidr_blocks = ["::/0"]
    }

    tags = merge(
        var.common_tags,
        {
            Name = "venu"  #for specifice block we can give 
        }
        
    )
}

resource "aws_instance"  "expense"{
       count = 3
       ami = "ami-09c813fb71547fc4f"
       instance_type=var.environment == "prod" ? "t3.small" : "t3.micro"
       vpc_security_group_ids=[aws_security_group.venu.id]

       tags = merge (
        var.common_tags,{
            Name = var.instance_names[count.index]  
       }
       )
    }