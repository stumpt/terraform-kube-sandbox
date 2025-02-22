provider "kubernetes" {
  config_path    = local.kube_config_path
  config_context = local.kube_context
}

provider "helm" {
  kubernetes {
    config_path    = local.kube_config_path
    config_context = local.kube_context
  }
}

provider "kubectl" {
  config_path    = local.kube_config_path
  config_context = local.kube_context
}
