variable "name" {
  type    = string
  default = "echo"
}

variable "image_tag" {
  type    = string
  default = "0.9.2"
}

variable "namespace" {
  type    = string
  default = "demo"
}

variable "replicas" {
  type    = number
  default = 1
}

variable "ingress_class_name" {
  type    = string
  default = "nginx"
}

variable "issuer_name" {
  type        = string
  description = "The name of the ClusterIssuer to use for TLS"
}

variable "hostname" {
  type        = string
  description = "echo.cluster.local"
}

locals {
  secret_name = "${var.name}-tls"
  image       = "ealen/echo-server:${var.image_tag}"
}

