provider "aws" {
  region = "us-east-1"
}

module "myvpc" {
  source               = "./modules/vpc"
  cidr_vpc             = "192.168.0.0/16"
  vpc_id               = "${module.myvpc.vpc_id}"
  public_subnet1_cidr  = "192.168.1.0/24"
  public_subnet2_cidr  = "192.168.2.0/24"
  private_subnet1_cidr = "192.168.3.0/24"
  private_subnet2_cidr = "192.168.4.0/24"
  igw_id               = "${module.myvpc.igw_id}"
  public_RT_id         = "${module.myvpc.public_RT_id}"
  public_subnet_id1    = "${module.myvpc.public_subnet_id1}"
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = "ami-02354e95b39ca8dec"
  instance_type     = "t2.micro"
  public_subnet_id1 = "${module.myvpc.public_subnet_id1}"
  sg_id             = "${module.sg.sg_id}"
}

module "elb" {
  source            = "./modules/elb"
  public_subnet_id1 = "${module.myvpc.public_subnet_id1}"
  sg_id             = "${module.sg.sg_id}"
  instance1_id      = "${module.ec2.instance1_id}"
  instance2_id      = "${module.ec2.instance2_id}"
}

module "sg" {
  source = "./modules/sg"
  vpc_id = "${module.myvpc.vpc_id}"
}