provider "aws" {
  region = "eu-north-1"
}

resource "aws_s3_bucket" "project_bucket" {
  bucket = "cloud-native-user-management-system-bucket"
}

resource "aws_dynamodb_table" "users" {
  name         = "Users"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "userId"

  attribute {
    name = "userId"
    type = "S"
  }
}

output "bucket_name" {
  description = "S3 Bucket Name"
  value       = aws_s3_bucket.project_bucket.bucket
}

output "dynamodb_table_name" {
  description = "DynamoDB Table Name"
  value       = aws_dynamodb_table.users.name
}
