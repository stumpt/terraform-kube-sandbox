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

variable "root_domain" {
  type    = string
  default = "cluster.local"
}

variable "issuer_name" {
  type        = string
  description = "The name of the ClusterIssuer to use for TLS"
}

locals {
  hostname    = "${var.name}.${var.root_domain}"
  secret_name = "${var.name}-tls"
  image       = "ealen/echo-server:${var.image_tag}"
}
