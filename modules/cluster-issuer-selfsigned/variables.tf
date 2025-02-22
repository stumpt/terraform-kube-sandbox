variable "name" {
  type        = string
  description = "The name of the ClusterIssuer"
  default     = "issuer-selfsigned"
}

variable "namespace" {
  type    = string
  default = "cert-manager"
}

variable "secret_name" {
  type        = string
  description = "The name of the ClusterIssuer for selfsigned CA"
  default     = "ca-key-pair-selfsigned"
}

variable "ca_cert" {
  type        = string
  sensitive   = true
  description = "PEM CA selfsigned certificate"
}

variable "ca_key" {
  type        = string
  sensitive   = true
  description = "PEM key CA selfsigned certificat"
}
