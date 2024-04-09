output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "public-subnets_id" {
  value = module.vpc.public-subnets_id
}

output "private-subnets_id" {
  value = module.vpc.private-subnets_id
}

output "security-group_id" {
  value = module.vpc.security-group_id
}

output "lb-target-group_arn" {
  value = module.vpc.lb-target-group_arn
}

output "load-balancer_dns_name" {
  value = module.vpc.load-balancer_dns_name
}

output "load-balancer_zone_id" {
  value = module.vpc.load-balancer_zone_id
}

