variable "region" {
  description = "The target region in which to provision resources."
  type        = string
  default     = "us-central1"
}

variable "zone" {
  description = "The target zone in which to provision resources."
  type        = string
  default     = "us-central1-a"
}

variable "project_id" {
  description = "The ID of the project in which to provision resources."
  type        = string
  default     = "qwiklabs-gcp-03-e81c6d0eb19b"
}

