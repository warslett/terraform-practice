resource "aws_dynamodb_table" "state-lock" {
  name           = var.state-lock-table
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
