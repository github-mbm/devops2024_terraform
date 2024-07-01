
resource "aws_dynamodb_table" "test_terraform_locks" {
  name         = "test_terraform_locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    Name = "my-test-db-table"
  }
}

