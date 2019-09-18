# vim:ts=2:sw=2:et:

resource "aws_route53_record" "cluster" {
  count = var.route53_create_record && var.route53_record_cluster != "" ? 1 : 0

  zone_id = var.route53_zone_id
  name    = var.route53_record_cluster
  type    = "CNAME"
  records = [ aws_rds_cluster.cluster.endpoint ]
  ttl     = var.route53_record_ttl
}

resource "aws_route53_record" "reader" {
  count = var.route53_create_record && var.route53_record_reader != "" ? 1 : 0

  zone_id = var.route53_zone_id
  name    = var.route53_record_reader
  type    = "CNAME"
  records = [ aws_rds_cluster.cluster.reader_endpoint ]
  ttl     = var.route53_record_ttl
}

#output "dns-record" {
#  value = var.create_route53_record ? aws_route53_record.record
#}

