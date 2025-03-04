variable "region" {
  description = "Provides details about a specific AWS region."
  type = string
  default = "ap-south-1"
}

locals {
  name                      = "${random_string.this.result}-sqs"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
  tags = {
    Environment = "production"
  }
  fifo_queue = true
  content_based_deduplication = true
}