resource "aws_key_pair" "key" {
  key_name   = "aws-key-${var.environment}"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  /*
    'subnet_id' resource name of previous module used in AWS-VPC 
    'vpc_security_group_ids' resource name of previous module used in AWS-VPC
    'ami'
  */
  ami                         = "ami-05134c8ef96964280"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = module.network.subnet_id
  vpc_security_group_ids      = [module.network.security_group_id]
  associate_public_ip_address = true

  tags = {
    Name = "vm-${var.environment}"
  }
}
