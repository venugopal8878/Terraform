variable "environment"{
    type = string
    default = "dev"
}

variable "names"{
type = list(string)
    default = ["mysql" ,"backend" ,"frontend"]
    description = "creating ece using count"
}