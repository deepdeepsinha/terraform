resource "aws_elb" "elb1" {
  name               = "elb1"
  #availability_zones = ["us-east-1a","us-east-1b"]
  subnets = ["${var.public_subnet_id1}"]
  security_groups = ["${var.sg_id}"]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = ["${var.instance1_id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 100

  tags = {
    Name = "newelb1"
  }
}

#2nd LB
resource "aws_elb" "elb2" {
  name               = "elb2"
  #availability_zones = ["us-east-1a","us-east-1b"]
  subnets = ["${var.public_subnet_id1}"]
  security_groups = ["${var.sg_id}"]


  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }


  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/index.html"
    interval            = 30
  }

  instances                   = ["${var.instance2_id}"]
  cross_zone_load_balancing   = true
  idle_timeout                = 100
  connection_draining         = true
  connection_draining_timeout = 100

  tags = {
    Name = "newelb1"
  }
}

output "elb-dns-name1" {
  value = "${aws_elb.elb1.dns_name}"
}

output "elb-dns-name2" {
  value = "${aws_elb.elb2.dns_name}"
}