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

module "aws_sns_topic" {
  source = "../"
  name   = "${random_string.this.result}-sns"
}

#----------------------------------------
# EXAMPLE WITH DELIVERY POLICY
#----------------------------------------

module "sns_with_delivery_policy" {
  source          = "../"
  name            = "${random_string.this.result}-sns_delivery_policy"
  delivery_policy = local.delivery_policy
}

#----------------------------------------
# EXAMPLE WITH FIFO
#----------------------------------------

module "sns_fifo" {
  source                      = "../"
  name                        = "${random_string.this.result}.fifo"
  fifo_topic                  = local.fifo_topic
  content_based_deduplication = local.content_based_deduplication
}