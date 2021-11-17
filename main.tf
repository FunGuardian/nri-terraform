provider "aws" {
  region = var.region
}

resource "aws_key_pair" "key_pair" {
  key_name   = var.key_name
  public_key = file(var.public_key_file)
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source               = "./modules/ec2"
  key_name             = aws_key_pair.key_pair.key_name
  ami_owners           = ["099720109477"]
  ami_values           = "ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"
  count_instance       = 1
  instance_type        = "t2.micro"
  vpc_id               = module.vpc.vpc_id
  subnet_id            = module.vpc.subnet_id
  private_ip           = null
  network_interface_id = module.vpc.network_interface_id
}
