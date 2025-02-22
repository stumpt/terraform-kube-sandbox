variable "secret_name" {
  type        = string
  description = "The name of the ClusterIssuer for selfsigned CA"
  default     = "ca-key-pair-selfsigned"
}

variable "namespace" {
  type    = string
  default = "cert-manager"
}

variable "ca_cert" {
  type        = string
  sensitive   = true
  description = "ca_cert_selfsigned"
}

variable "ca_key" {
  type        = string
  sensitive   = true
  description = "ca_cert_selfsigned"
}

variable "cluster_issuer_name" {
  type        = string
  description = "The name of the ClusterIssuer"
  default     = "selfsigned"
}

