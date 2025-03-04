variable "name" {
  description = "(Optional) Name of the queue. Queue names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 80 characters long. For a FIFO (first-in-first-out) queue, the name must end with the .fifo suffix. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix."
  type = string
  default = null
}

variable "content_based_deduplication" {
  description = "(Optional) Enables content-based deduplication for FIFO queues. For more information, see the related documentation."
  type = bool
  default = null
}

variable "deduplication_scope" {
  description = "Specifies whether message deduplication occurs at the message group or queue level."
  type        = string
  default     = "queue"

  validation {
    condition     = contains(["messageGroup", "queue"], var.deduplication_scope)
    error_message = "The deduplication_scope variable must be either 'messageGroup' or 'queue'."
  }
}

variable "delay_seconds" {
  description = "Time in seconds that the delivery of all messages in the queue will be delayed."
  type        = number
  default     = 0

  validation {
    condition     = var.delay_seconds >= 0 && var.delay_seconds <= 900
    error_message = "The delay_seconds variable must be an integer between 0 and 900."
  }
}

variable "fifo_queue" {
  description = "Boolean designating a FIFO queue. If not set, it defaults to false making it standard."
  type        = bool
  default     = false
}

variable "fifo_throughput_limit" {
  description = "Specifies whether the FIFO queue throughput quota applies to the entire queue or per message group."
  type        = string
  default     = "perQueue"

  validation {
    condition     = contains(["perQueue", "perMessageGroupId"], var.fifo_throughput_limit)
    error_message = "The fifo_throughput_limit variable must be either 'perQueue' or 'perMessageGroupId'."
  }
}

variable "kms_data_key_reuse_period_seconds" {
  description = "Length of time, in seconds, for which Amazon SQS can reuse a data key to encrypt or decrypt messages before calling AWS KMS again."
  type        = number
  default     = 300

  validation {
    condition     = var.kms_data_key_reuse_period_seconds >= 60 && var.kms_data_key_reuse_period_seconds <= 86400
    error_message = "The kms_data_key_reuse_period_seconds variable must be an integer between 60 and 86,400."
  }
}

variable "kms_master_key_id" {
  description = "ID of an AWS-managed customer master key (CMK) for Amazon SQS or a custom CMK."
  type        = string
  default     = null
}

variable "max_message_size" {
  description = "Limit of how many bytes a message can contain before Amazon SQS rejects it."
  type        = number
  default     = 262144

  validation {
    condition     = var.max_message_size >= 1024 && var.max_message_size <= 262144
    error_message = "The max_message_size variable must be an integer between 1024 and 262144."
  }
}

variable "message_retention_seconds" {
  description = "Number of seconds Amazon SQS retains a message."
  type        = number
  default     = 345600

  validation {
    condition     = var.message_retention_seconds >= 60 && var.message_retention_seconds <= 1209600
    error_message = "The message_retention_seconds variable must be an integer between 60 and 1209600."
  }
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name."
  type        = string
  default     = null
}

variable "policy" {
  description = "JSON policy for the SQS queue."
  type        = string
  default     = null
}

variable "receive_wait_time_seconds" {
  description = "Time for which a ReceiveMessage call will wait for a message to arrive (long polling) before returning."
  type        = number
  default     = 0

  validation {
    condition     = var.receive_wait_time_seconds >= 0 && var.receive_wait_time_seconds <= 20
    error_message = "The receive_wait_time_seconds variable must be an integer between 0 and 20."
  }
}

variable "redrive_allow_policy" {
  description = "JSON policy to set up the Dead Letter Queue redrive permission."
  type        = string
  default     = null
}

variable "redrive_policy" {
  description = "JSON policy to set up the Dead Letter Queue."
  type        = string
  default     = null
}

variable "sqs_managed_sse_enabled" {
  description = "Boolean to enable server-side encryption (SSE) of message content with SQS-owned encryption keys."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Map of tags to assign to the queue."
  type        = map(string)
  default     = null
}

variable "visibility_timeout_seconds" {
  description = "Visibility timeout for the queue."
  type        = number
  default     = 30

  validation {
    condition     = var.visibility_timeout_seconds >= 0 && var.visibility_timeout_seconds <= 43200
    error_message = "The visibility_timeout_seconds variable must be an integer between 0 and 43200."
  }
}

variable "timeouts" {
  description = "The timeouts for different actions on the Automation Runbook"
  type = object({
    create = string
    update = string
    delete = string
  })
  default = {
    create = "3m"
    update = "3m"
    delete = "3m"
  }
}