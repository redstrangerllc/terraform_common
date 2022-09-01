variable zone_id    {}
variable domain     {}

//create A record for domain
resource "aws_route53_record" "main-a" {
    zone_id             = "${aws_route53_zone.main.zone_id}"
    name                = "${var.domain}"
    type                = "A"
    ttl                 = "300"

    records = [
        "${var.public_ip}"
    ]
}

//create A record for www.domain
resource "aws_route53_record" "main-www-a" {
    
    zone_id             = "${aws_route53_zone.main.zone_id}"
    name                = "www.${var.domain}"
    type                = "A"
    ttl                 = "300"

    records = [
        "${var.public_ip}"
    ]
}