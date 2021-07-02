output "bucket_name" {
    value = aws_s3_bucket.labs3.bucket
}

output "bucket_arn" {
    value = aws_s3_bucket.labs3.arn
}

output "main_sqs_name" {
    value = aws_sqs_queue.queuelab.name
}

output "main_sqs_arn" {
    value = aws_sqs_queue.queuelab.arn
}

output "dlq_sqs_name" {
    value = aws_sqs_queue.queuelabdlq.name
}

output "dlq_sqs_arn" {
    value = aws_sqs_queue.queuelabdlq.arn
}