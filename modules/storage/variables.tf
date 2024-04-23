variable "name" {
  description = "The name of the bucket."
  type        = string
}

variable "location" {
  description = "The target location in which to provision the bucket."
  type        = string
}

variable "force_destroy" {
  description = "Set force_destroy variable for bucket."
  type        = bool
  default     = true
}

variable "uniform_bucket_level_access" {
  description = "Set uniform_bucket_level_access variable for bucket."
  type        = bool
  default     = true
}
