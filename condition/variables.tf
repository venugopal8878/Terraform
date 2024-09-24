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