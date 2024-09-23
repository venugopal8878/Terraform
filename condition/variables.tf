variable "environment"{
    type = string
    default = "dev"
}

variable "instance_names"{
     type = list(string)
     default = ["mysql" ," backend ", "frontend"]
}