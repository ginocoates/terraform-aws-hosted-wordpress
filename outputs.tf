output "Wordpress_Public_IP" {
  value = "${aws_eip.wordpress_eip.public_ip}"
}

output "Wordpres_DNS" {
  value = "${aws_instance.wordpress.public_dns}"
}
