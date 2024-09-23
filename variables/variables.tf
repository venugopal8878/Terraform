variable "ami" {
        type= "string"
        default= "ami-09c813fb71547fc4f"
        description= "this ami id of devops-practice image is redhat"
}

variable "instance_type"{
        type= "string"
        default= "t3.micro"
        description= "this is the type of the server"

}

variable "tags" {
    type= map #optional
    default = {
        Name= "backend"
        Project= "expense"
        Component ="backend"
        Environment = "Dev"
        Terraform = "true" # to know resouce created by terraform
    }

}

variable "sg_name"{
    default = "allow_ssh"
}

variable "sg_description"{
    default = "this allow port 22 only"
}

variable "from_port" {
    default = 22
    type = number

}

variable "to_port"{
    default = 22
    type = number
}

variable "protocol"{
    default = "tcp"
    type = "string"
}

variable "venu_cidr"{
    type = list[string]
    default =["0.0.0.0/0"]
}
