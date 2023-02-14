resource "aws_key_pair" "altkey" {
  key_name = "alt"
  public_key = file(INSERT_PATH_TO_PUBLIC_KEY_HERE)
}

resource "aws_instance" "achillies-linux" {
  ami                         = "ami-0aa7d40eeae50c9a9"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.altkey.key_name
  vpc_security_group_ids      = ["${aws_default_security_group.default.id}"]
  subnet_id                   = aws_subnet.sub1.id
  associate_public_ip_address = true

  tags = {
    Name = "linux-instance1 "
  }
}
resource "aws_instance" "achillies-linux2" {
  ami                         = "ami-0aa7d40eeae50c9a9"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.altkey.key_name
  vpc_security_group_ids      = ["${aws_default_security_group.default.id}"]
  subnet_id                   = aws_subnet.sub2.id
  associate_public_ip_address = true

  tags = {
    Name = "linux-instance2"
  }
}
resource "aws_instance" "achillies-linux3" {
  ami                         = "ami-0aa7d40eeae50c9a9"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.altkey.key_name
  vpc_security_group_ids      = ["${aws_default_security_group.default.id}"]
  subnet_id                   = aws_subnet.sub3.id
  associate_public_ip_address = true

  tags = {
    Name = "linux-instance3"
  }
}

resource "local_file" "ec2_public_ip" {
  content  = <<EOF
[webservers]
${aws_instance.achillies-linux.public_ip}
${aws_instance.achillies-linux2.public_ip}
${aws_instance.achillies-linux3.public_ip}
EOF
  filename = "./ansible/host-inventory"
}
