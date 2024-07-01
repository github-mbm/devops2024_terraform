resource "aws_s3_bucket" "fox_bucket_1" {
  bucket = "fox-tf-test-bucket1"
  tags = {
    Name = "fox_1"
  }
  depends_on = [aws_route_table.vpc2_rt]
}

resource "aws_s3_bucket" "fox_bucket_2" {
  bucket = "fox-tf-test-bucket2"
  tags = {
    Name = "fox_2"
  }
  depends_on = [aws_s3_bucket.fox_bucket_1]
}

resource "aws_s3_bucket" "fox_bucket_3" {
  bucket = "fox-tf-test-bucket30"
  tags = {
    Name = "fox_30"
  }
  depends_on = [aws_s3_bucket.fox_bucket_2]
  lifecycle {
    prevent_destroy       = false
    create_before_destroy = false
  }
}