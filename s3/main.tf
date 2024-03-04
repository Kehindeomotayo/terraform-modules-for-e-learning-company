# create an s3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.project_name}-${var.s3_bucket}"

  lifecycle {
    create_before_destroy = false
  }
}

