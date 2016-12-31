# define the local IP to map to the SSH security rule
variable "local_ip" {
  type = "string"
}

# pass the region as a variable so we can provide it in a tfvars file
variable "region" {
  type = "string"
}

# define the region specific wordpress images
variable "wordpress-images" {
  type = "map"

  default = {
    "us-east-1" = "ami-a42d75b3"
  }
}

variable "zones" {
  type = "map"

  default = {
    "us-east-1" = "us-east-1b"
  }
}
