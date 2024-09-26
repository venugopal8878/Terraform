locals {
    domain_name = "venuportal.com"
    zone_id = "Z05352171HN9KZYIJ1BXF"
    instance_type = var.environment == "prod" ? "t3.micro" : "t3.small"
}