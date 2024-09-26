variable "instance_names" {
  type        = list(string)
  default     = ["mysql", "backend", "frontend"]
  description = "using list of and in main count we create resource how many you want"
}

variable "domain_name" {
  default = "venuportal.online"
}

variable "zone_id" {
  default = "Z05352171HN9KZYIJ1BXF"
}

variable "environment" {
  default = "frontend"
}
