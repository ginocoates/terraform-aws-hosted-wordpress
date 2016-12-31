resource "aws_security_group" "wordpress_security_group" {
  name        = "wordpress_security_group"
  description = "control access to the wordpress server"
}

# allow http access on port 80 from all addresses/ports
resource "aws_security_group_rule" "ingress_http" {
  security_group_id = "${aws_security_group.wordpress_security_group.id}"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
}

# allow http access on port 443 from all addresses/ports
resource "aws_security_group_rule" "ingress_https" {
  security_group_id = "${aws_security_group.wordpress_security_group.id}"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "tcp"
  from_port         = 443
  to_port           = 443
}

# allow reply traffic from the internet to the server on ephemeral ports
resource "aws_security_group_rule" "ingress_reply" {
  security_group_id = "${aws_security_group.wordpress_security_group.id}"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "tcp"
  from_port         = 1024
  to_port           = 65535
}

# allow http access on port 22 from our ip address
resource "aws_security_group_rule" "ingress_ssh" {
  security_group_id = "${aws_security_group.wordpress_security_group.id}"
  type              = "ingress"
  cidr_blocks       = ["${var.local_ip}/32"]
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
}

# allow reply traffic from the server to the internet on ephemeral ports
resource "aws_security_group_rule" "egress_reply" {
  security_group_id = "${aws_security_group.wordpress_security_group.id}"
  type              = "egress"
  cidr_blocks       = ["0.0.0.0/0"]
  protocol          = "all"
  from_port         = 0
  to_port           = 0
}
