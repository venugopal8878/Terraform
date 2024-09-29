variable "instance_names"{
    type = map
    default = {
        frontend = "t3.micro"
        backend = "t3.micro"
        musql = "t3.small"
        }
    
}

variable "zone_id"{

    default = "Z05352171HN9KZYIJ1BXF"
}

variable "domain"{
    default = "venuportal.online"
}