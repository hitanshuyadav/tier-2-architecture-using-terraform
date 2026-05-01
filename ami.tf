 data "aws_ami" "ami" {
  most_recent = true

  owners = ["self"]

  filter {
    name   = "name"
    values = ["demo_image"]
  }

  filter {
    name   = "state"
    values = ["available"]
  }
}