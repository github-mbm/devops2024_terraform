resource "aws_flow_log" "sky_flow_logs" {
  log_destination      = aws_s3_bucket.fox_bucket_3.arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.vpc1.id
}

#esource "aws_s3_bucket" "example" {
# bucket = "example"
#}