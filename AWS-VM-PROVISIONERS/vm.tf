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

  provisioner "local-exec" {
    #create a file on my local machine
    command = "echo ${self.public_ip} >> public_ip.txt"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./aws-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    #create a file on my local machine
    inline = [
      "echo subnet_id: ${data.terraform_remote_state.vpc.outputs.subnet_id} >> /tmp/network_info.txt",
      "echo security_group_id: ${data.terraform_remote_state.vpc.outputs.security_group_id} >> /tmp/network_info.txt",
    ]
  }

  provisioner "file" {
    #copy local file to remote VM
    source      = "./teste.txt"
    destination = "/tmp/exemplo.txt"
  }

  provisioner "file" {
    #saves information to a file on the remote VM
    content     = "ami used: ${self.ami}"
    destination = "/tmp/ami.txt"
  }


  tags = {
    Name = "vm-terraform"
  }
}
