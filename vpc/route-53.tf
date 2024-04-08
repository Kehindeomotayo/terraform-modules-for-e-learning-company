#Create a hosted zone for the subdomain
resource "aws_route53_zone" "sub-domain" {
  name = "${var.sub_domain_name}.${data.aws_route53_zone.root-domain.name}"
  #tags = var.tags
}


#Create Route53 A record to link sub-domain name to application load balancer (Alias record)
resource "aws_route53_record" "route53-record-dns" {
  name    = aws_route53_zone.sub-domain.name
  zone_id = data.aws_route53_zone.root-domain.zone_id
  #name    = "${data.aws_route53_zone.sub-domain.name}"
  type = "A"


  alias {
    name                   = aws_lb.load-balancer.dns_name
    zone_id                = aws_lb.load-balancer.zone_id
    evaluate_target_health = true
  }
}



