variable "cluster_issuer_selfsigned_ca_cert" {
  type        = string
  sensitive   = true
  description = "Base64 encoded selfsigned CA certificate"
}

variable "cluster_issuer_selfsigned_ca_key" {
  type        = string
  sensitive   = true
  description = "Base64 encoded selfsigned CA key"
}
