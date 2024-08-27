resource "aws_key_pair" "key" {
  key_name   = "aws-key"
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
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  lifecycle {
    # prevent_destroy = true
    #bucket
    replace_triggered_by = [
      aws_s3_bucket.bucket
    ]
  }

  tags = {
    Name = "vm-terraform"
  }
}
