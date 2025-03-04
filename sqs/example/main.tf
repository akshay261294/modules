#----------------------------------------
#RANDOM STRING GENERATOR
#----------------------------------------

resource "random_string" "this" {
  length  = 6
  special = false
  lower   = true
  upper   = false
}

#----------------------------------------
# RESOURCE GROUP
#----------------------------------------


module "aws_sqs_queue" {
  source = "../"
  name                      = local.name
  delay_seconds             = local.delay_seconds
  max_message_size          = local.max_message_size
  message_retention_seconds = local.message_retention_seconds
  receive_wait_time_seconds = local.receive_wait_time_seconds
  tags = local.tags

}

#----------------------------------------------
#FIFO QUEUE
#----------------------------------------------

module "fifo_queue" {
  source = "../"
  name = random_string.this.result
  fifo_queue = local.fifo_queue
  content_based_deduplication = local.content_based_deduplication
}
