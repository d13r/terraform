output "bucket_name" {
  description = "The name of the S3 bucket"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "console_url" {
  description = "A link to view the bucket in the AWS Console"
  value       = "https://s3.console.aws.amazon.com/s3/buckets/${aws_s3_bucket.terraform_state.bucket}"
}
