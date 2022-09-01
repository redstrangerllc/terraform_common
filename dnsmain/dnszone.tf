variable  "domain"      {}

//create hosted zone for domain, this automatically generates NS and SOA records
resource  "aws_route53_zone" "main"  {
    name                = "${var.domain}"
}

//output zone id to main configuration
output "zone_id" {
    value               = "${aws_route53_zone.main.zone_id}"
}