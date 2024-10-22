locals {
  record_parts = split(".", var.record_name)
  record_len  = length(local.record_parts)
  record_zone = join(".", slice(local.record_parts, 1, local.record_len))
}

data "aws_route53_zone" "selected" {
  name         = local.record_zone
  private_zone = false
}