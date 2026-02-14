#root
module "vpc" {
  source             = "./vpc"
  vpc_cidr           = "10.0.0.0/16"
  public_subnet_cidr = "10.0.1.0/24"
  external_ip        = "0.0.0.0/0"

}


module "web" {
  source         = "./web"
  security_group = module.vpc.security_group
  public_subnet  = module.vpc.public_subnet

}