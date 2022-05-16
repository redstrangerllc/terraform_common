variable  "domain"      {}
variable  "eip"         {} 

//create hosted zone for domain, this automatically generates NS and SOA records
resource  "aws_route53_zone" "main"  {
    name                = "${var.domain}"
}

//create A record for domain
resource "aws_route53_record" "main-a" {
    zone_id             = "${aws_route53_zone.main.zone_id}"
    name                = "${var.domain}"
    type                = "A"
    ttl                 = "300"

    records = [
        "${var.eip}"
    ]
}

//create A record for www.domain
resource "aws_route53_record" "main-www-a" {
    
    zone_id             = "${aws_route53_zone.main.zone_id}"
    name                = "www.${var.domain}"
    type                = "A"
    ttl                 = "300"

    records = [
        "${var.eip}"
    ]
}

//output zone id to main configuration
output "zone_id" {
    value               = "${aws_route53_zone.main.zone_id}"
}