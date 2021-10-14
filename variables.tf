variable "policy_file" {
  description = "IAM Policy File"
  type        = string
}

variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "cluster_oidc_issuer_url" {
  description = "URL of the OIDC Provider from the EKS cluster"
  type        = string
}

variable "service_account_namespace" {
  description = "ServiceAccount namespace"
  type        = string
}

variable "service_account_name" {
  description = "ServiceAccount name"
  type        = string
}
