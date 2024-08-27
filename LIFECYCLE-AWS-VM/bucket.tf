resource "aws_s3_bucket" "bucket" {
  #names must always be unique in terraform
  bucket = "joaoneto-lifecycle"

  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags
    ]
  }

  tags = {
    test = "vscode"
  }

}