resource "aws_sqs_queue" "queuelabdlq" {
  name                       = var.sqsnamedlq
  visibility_timeout_seconds = 120
  message_retention_seconds  = 1209600
  tags                       = local.common_tags
}

resource "aws_sqs_queue" "queuelab" {
  name                       = var.sqsname
  visibility_timeout_seconds = 120
  message_retention_seconds  = 1209600
  tags                       = local.common_tags
  redrive_policy = jsonencode({
    deadLetterTargetArn = aws_sqs_queue.queuelabdlq.arn
    maxReceiveCount     = 4
  })

  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "sqs:SendMessage",
      "Resource": "*",
      "Condition": {
        "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.bucket.arn}" }
      }
    }
  ]
}
POLICY
}
