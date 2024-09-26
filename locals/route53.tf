resource "aws_route53_record" "venu" { 
  count           = 3
  zone_id         = local.zone_id
  name            = var.instance_names[count.index] == "frontend" ? local.domain_name : "${var.instance_names[count.index]}.${local.domain_name}" #here we can combine using . called interploation or conatination and $ use special case
  type            = "A"
  ttl             = 1
  records          = var.instance_names[count.index] == "frontend" ? [aws_instance.expense[count.index].public_ip] : [aws_instance.expense[count.index].private_ip]
  allow_overwrite = true #if any alredy existing recors it's over write
}