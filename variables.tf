variable "project_id" {
  description = "gcp project id to setup the workload identity pool in"
  type        = string
}

variable "provider_id" {
  description = "provider id to apply to new workload identity provider"
  type        = string
}

variable "bb_deployment_uuid" {
  description = "bitbucket deployment uuid"
  type        = string
}

variable "identity_pool_name" {
  description = "gcp identity pool name"
  type        = string
}

variable "identity_pool_id" {
  description = "gcp identity pool id"
  type        = string
}

variable "bb_repository_uuid" {
  description = "bitbucket repository uuid"
  type        = string
}

variable "bb_workspace_uuid" {
  description = "bitbucket workspace uuid"
  type        = string
}

variable "bb_identity_provider_url" {
  description = "bitbucket identity provider uuid"
  type        = string
}
