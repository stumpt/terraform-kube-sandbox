locals {
  kube_config_path                     = "~/.kube/config"
  kube_context                         = "docker-desktop"
  ingress_class_name                   = "nginx"
  cluster_issuer_selfsigned            = "selfsigned"
  cluster_issuer_production            = "production"
  cluster_issuer_production_acme_email = "admin@example.com"
  root_domain                          = "127.0.0.1.nip.io"
  metallb_ip_range                     = ["127.0.0.1-127.0.0.1"]
}
