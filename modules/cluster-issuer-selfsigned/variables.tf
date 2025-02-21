variable "secret_name" {
  type        = string
  description = "The name of the ClusterIssuer for selfsigned CA"
  default     = "ca-key-pair-selfsigned"
}

variable "namespace" {
  type    = string
  default = "cert-manager"
}

variable "ca_cert_path" {
  type        = string
  description = "Path to mkcert CA certificate"
}

variable "ca_key_path" {
  type        = string
  description = "Path to mkcert CA key"
}

variable "cluster_issuer_name" {
  type        = string
  description = "The name of the ClusterIssuer"
  default     = "selfsigned"
}

