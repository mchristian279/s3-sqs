resource "aws_s3_bucket" "labs3" {
  bucket = var.s3bucket
  acl    = "private"
  tags   = local.common_tags
}

resource "aws_s3_bucket" "bucket" {
  bucket = aws_s3_bucket.labs3.bucket
}

resource "aws_s3_bucket_notification" "bucket_notification" {
  depends_on = [aws_sqs_queue.queuelab]

  bucket = aws_s3_bucket.bucket.id

  queue {
    queue_arn     = aws_sqs_queue.queuelab.arn
    events        = ["s3:ObjectCreated:*"]
    filter_suffix = ".log"
  }
}