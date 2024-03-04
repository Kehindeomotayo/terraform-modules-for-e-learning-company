# create an s3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.project_name}-${var.env_file_bucket_name}"

  lifecycle {
    create_before_destroy = false
  }
}

