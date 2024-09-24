resource "aws_route53_record" "expense"{
  count = length(var.instance_names)  #output from 
  zone_id = var.zone_id
  name    = "${var.instance_names[count.index]}.${var.domain}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.expense[count.index].private_ip] #give the instance name
}