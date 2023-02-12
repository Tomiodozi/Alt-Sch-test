resource "aws_key_pair" "altkey" {
  key_name = "alt"
  public_key = file("/home/vagrant/.ssh/id_rsa.pub")
}

resource "aws_instance" "achillies-linux" {
  ami                         = "ami-0aa7d40eeae50c9a9"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.altkey.key_name
  vpc_security_group_ids      = ["${aws_default_security_group.default.id}"]
  subnet_id                   = aws_subnet.sub1.id
  associate_public_ip_address = "true"
  availability_zone           = "us-east-1a"

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
  associate_public_ip_address = "true"
  availability_zone           = "us-east-1b"

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
  associate_public_ip_address = "true"
  availability_zone           = "us-east-1c"

  tags = {
    Name = "linux-instance3"
  }
}