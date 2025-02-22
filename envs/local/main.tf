module "metallb" {
  source = "../../modules/metallb"
}

module "cert_manager" {
  source = "../../modules/cert-manager"
}

module "cluster_issuer_selfsigned" {
  source  = "../../modules/cluster-issuer-selfsigned"
  ca_cert = var.cluster_issuer_selfsigned_ca_cert
  ca_key  = var.cluster_issuer_selfsigned_ca_key
  depends_on = [
    module.cert_manager
  ]
}

module "cluster_issuer_production" {
  source     = "../../modules/cluster-issuer-production"
  acme_email = var.cluster_issuer_production_acme_email
  depends_on = [
    module.cert_manager
  ]
}

module "ingress_nginx" {
  source = "../../modules/ingress-nginx"
  depends_on = [
    module.metallb
  ]
}

module "echo_server" {
  source      = "../../modules/echo-server"
  name        = var.echo_name
  namespace   = var.echo_namespace
  replicas    = var.echo_replicas
  root_domain = var.root_domain
  issuer_name = module.cluster_issuer_selfsigned.cluster_issuer_name
  depends_on = [
    module.ingress_nginx
  ]
}
