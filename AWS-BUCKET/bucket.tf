resource "aws_s3_bucket" "bucket" {
  #names must always be unique in terraform
  bucket = "joaoneto-terraformcourse-my-bucket"
}