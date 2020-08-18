resource "aws_instance" "instance1" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  subnet_id                     = "${var.public_subnet_id1}"
  security_groups             = ["${var.sg_id}"]
  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update
              sudo yum install -y httpd
              sudo chkconfig httpd on
              sudo service httpd start
              echo "<h1>HELLO</h1>" | sudo tee /var/www/html/index.html
              EOF
  tags = {
    Name = "instance1"
  }
}

resource "aws_instance" "instance2" {
  ami                         = "${var.ami_id}"
  instance_type               = "${var.instance_type}"
  subnet_id                     = "${var.public_subnet_id1}"
  security_groups             = ["${var.sg_id}"]
  associate_public_ip_address = true
  user_data = <<-EOF
              #!/bin/bash
              sudo yum update
              sudo yum install -y httpd
              sudo chkconfig httpd on
              sudo service httpd start
              echo "<h1>Welcome</h1>" | sudo tee /var/www/html/index.html
              EOF
  tags = {
    Name = "instance2"
  }
}

output "instance1_id" {
  value = "${aws_instance.instance1.id}"
}

output "instance2_id" {
  value = "${aws_instance.instance2.id}"
}

output "instance_ip_addr1" {
  value = "${aws_instance.instance1.private_ip}"
}

output "instance_ip_addr2" {
  value = "${aws_instance.instance2.private_ip}"
}