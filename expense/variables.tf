variable "environment"{
    type = string
    default = "dev"
}

variable "instance_names"{
     type = list(string)
     default = ["mysql" ," backend ", "frontend"]
}


variable "common_tags" {
    type= map
       default = {
        Name = "expense"
        Environment = "dev"
        Terraform = true
       }
}

variable "zone_id"{

    default = "Z05352171HN9KZYIJ1BXF"
}

variable "domain"{
    default = "venuportal.online"
}