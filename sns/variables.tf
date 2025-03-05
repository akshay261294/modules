variable "name" {
  description = "The name of the topic. Topic names must be made up of only uppercase and lowercase ASCII letters, numbers, underscores, and hyphens, and must be between 1 and 256 characters long. For a FIFO (first-in-first-out) topic, the name must end with the .fifo suffix. If omitted, Terraform will assign a random, unique name. Conflicts with name_prefix"
  type        = string
  default     = null
}

variable "name_prefix" {
  description = "Creates a unique name beginning with the specified prefix. Conflicts with name"
  type        = string
  default     = null
}

variable "display_name" {
  description = "The display name for the topic"
  type        = string
  default     = null
}

variable "policy" {
  description = "The fully-formed AWS policy as JSON. For more information about building AWS IAM policy documents with Terraform, see the AWS IAM Policy Document Guide."
  type        = string
  default     = null
}

variable "delivery_policy" {
  description = "The SNS delivery policy. More details in the AWS documentation."
  type        = string
  default     = null
}

variable "application_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "application_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "application_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "http_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "http_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = string
  default     = null
}

variable "http_failure_feedback_role_arn" {
  description = " IAM role for failure feedback"
  type        = string
  default     = null
}

variable "kms_master_key_id" {
  description = "The ID of an AWS-managed customer master key (CMK) for Amazon SNS or a custom CMK. For more information, see Key Terms"
  type        = string
  default     = null
}

variable "signature_version" {
  description = "If SignatureVersion should be 1 (SHA1) or 2 (SHA256). The signature version corresponds to the hashing algorithm used while creating the signature of the notifications, subscription confirmations, or unsubscribe confirmation messages sent by Amazon SNS."
  type        = string
  default     = null
}

variable "tracing_config" {
  description = "Tracing mode of an Amazon SNS topic. Valid values: 'PassThrough', 'Active'."
  type        = string
  default     = null
}

variable "fifo_topic" {
  description = "Boolean indicating whether or not to create a FIFO (first-in-first-out) topic. FIFO topics can't deliver messages to customer managed endpoints, such as email addresses, mobile apps, SMS, or HTTP(S) endpoints. These endpoint types aren't guaranteed to preserve strict message ordering. Default is false."
  type        = bool
  default     = false
}

variable "archive_policy" {
  description = "The message archive policy for FIFO topics. More details in the AWS documentation."
  type        = string
  default     = null
}

variable "content_based_deduplication" {
  description = "Enables content-based deduplication for FIFO topics. For more information, see the related documentation"
  type        = bool
  default     = false
}

variable "lambda_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "lambda_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = number
  default     = null
}

variable "lambda_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "sqs_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "sqs_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = number
  default     = null
}

variable "sqs_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "firehose_success_feedback_role_arn" {
  description = "The IAM role permitted to receive success feedback for this topic"
  type        = string
  default     = null
}

variable "firehose_success_feedback_sample_rate" {
  description = "Percentage of success to sample"
  type        = number
  default     = null
}

variable "firehose_failure_feedback_role_arn" {
  description = "IAM role for failure feedback"
  type        = string
  default     = null
}

variable "tags" {
  description = "Key-value map of resource tags. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
  type        = map(string)
  default     = null
}