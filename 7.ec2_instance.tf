resource "aws_instance" "web-server-1" {
  ami                         = "ami-0f58b397bc5c1f2e8"
  instance_type               = "t2.micro"
  key_name                    = "LAPKEY"
  subnet_id                   = aws_subnet.sky_subnet_1.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all_secgrp.id}"]
  associate_public_ip_address = true
  tags = {
    Name = "WEB-SERVER-1"
  }
}


