resource "kubernetes_secret" "ca" {
  metadata {
    name      = var.secret_name
    namespace = var.namespace
  }

  data = {
    "tls.crt" = base64decode(var.ca_cert)
    "tls.key" = base64decode(var.ca_key)
  }

  type = "kubernetes.io/tls"
}

resource "kubectl_manifest" "cluster_issuer" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: ${var.cluster_issuer_name}
spec:
  ca:
    secretName: ${var.secret_name}
YAML

  depends_on = [
    kubernetes_secret.ca
  ]
}

