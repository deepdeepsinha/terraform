output "public_subnets1" {
  value = "${module.myvpc.public_subnet_id1}"
}

output "private_subnets1" {
  value = "${module.myvpc.private_subnet_id1}"
}

output "public_subnets2" {
  value = "${module.myvpc.public_subnet_id2}"
}

output "private_subnets2" {
  value = "${module.myvpc.private_subnet_id2}"
}

output "instance1_ip" {
  value = "${module.ec2.instance_ip_addr1}"
}

output "instance2_ip" {
  value = "${module.ec2.instance_ip_addr2}"
}

output "lbdns1" {
  value = "${module.elb.elb-dns-name1}"
}

output "lbdns2" {
  value = "${module.elb.elb-dns-name2}"
}
