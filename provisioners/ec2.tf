resource "aws_security_group" "venu" {
    name        = "allow_sshh" #allow_ssh is already there in my account
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

    tags = {
        Name = "venu"
    }
}

resource "aws_instance"  "terraform" {
       ami = "ami-09c813fb71547fc4f"
       instance_type="t3.micro"
       vpc_security_group_ids=[aws_security_group.venu.id]

       tags = {

         Name = "terraform"
       }

        provisioner  "local-exec" {

        command = "echo ${self.private_ip} > public_ip.txt" #redirct to one file selt means same reource we created here
        }
         connection {
        type     = "ssh"
        user     = "ec2-user"
        password = "DevOps321"
        host     = self.public_ip
    }
    
    # provisioners will execute at the time of creation
    provisioner "remote-exec" {
        inline = [
            "sudo dnf install ansible -y",
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx",
        ]
    }

    provisioner "remote-exec" {
        when    = destroy
        inline = [
            "sudo systemctl stop nginx",
        ]
    }
 }