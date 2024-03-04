# export the s3 bucket name
output "s3_bucket" {
  value = aws_s3_bucket.s3_bucket.id
}

