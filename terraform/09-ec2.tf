resource "aws_instance" "my_instance" {
  ami           = "ami-066784287e358dad1"
  instance_type = "t2.micro"
  key_name = aws_key_pair.ec2.key_name
  vpc_security_group_ids = [ aws_security_group.allow_ssh.id ]
  subnet_id = aws_subnet.public.id
  associate_public_ip_address = true
  tags = {
    Name = "My Instance"
  }
}