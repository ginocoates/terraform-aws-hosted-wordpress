# bitnami wordpress server
resource "aws_instance" "wordpress" {
  ami = "${lookup(var.wordpress-images, var.region)}"

  # free tier eligible
  instance_type = "t2.micro"

  # list of security groups for the instance
  security_groups = [
    "${aws_security_group.wordpress_security_group.name}",
  ]

  availability_zone = "${lookup(var.zones, var.region)}"

  key_name = "wordpress"

  # add a public IP address
  associate_public_ip_address = true

  root_block_device = {
    "volume_type"           = "standard"
    "volume_size"           = 40
    "delete_on_termination" = false
  }

  tags {
    Name = "Wordpress Server"
  }
}

resource "aws_eip" "wordpress_eip" {
  instance = "${aws_instance.wordpress.id}"
}
