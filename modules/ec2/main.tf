resource "aws_instance" "publicserver" {
  count = var.machinecount
  ami = var.imagename
  instance_type = var.instance_type
  iam_instance_profile = var.iam_instance_profile
  key_name = var.key_name
  subnet_id = "${element(var.public-subnets, count.index)}"
  vpc_security_group_ids = ["${var.sgid}"]
  associate_public_ip_address = true
  tags = {
    Name = "test-instance"
  }
user_data = <<-EOF
 #!/bin/bash
 sudo apt-get update
 sudo apt-get install nginx -y
 sudo systemctl start nginx
 sudo systemctl enable nginx 
 echo "<h1>${var.env}-public-server</h1>" | sudo tee /var/www/html/index.html
EOF

}