module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.5.3"

  name = "${var.cluster_name}-vpc"
  cidr = "10.0.0.0/16"
  //public subnets are for ALB in here and privates are for eks which use the subnets to distribute the workers (although it is optional) each subnet is in different az
  azs             = ["${var.region}a", "${var.region}b", "${var.region}c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  /*
it will automatically create internet gateway (thanks for builtin aws terraform module) and then create the nat gateway for all the private subnets to use the internet
via the public subnets created in one of the public subnets (all the private will use one nat gateway and one nat gateway is created)
and all routes for everything will be created too
*/
  enable_nat_gateway = true
  single_nat_gateway = true
  public_subnet_tags = {
    "kubernetes.io/role/elb" = "1"
  }
}
