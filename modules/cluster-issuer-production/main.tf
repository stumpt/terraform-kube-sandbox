resource "kubectl_manifest" "cluster_issuer" {
  yaml_body = <<YAML
apiVersion: cert-manager.io/v1
kind: ClusterIssuer
metadata:
  name: ${var.name}
spec:
  acme:
    email: "${var.acme_email}"
    server: "${var.acme_server}"
    privateKeySecretRef:
      name: "${var.secret_name}"
    solvers:
      - http01:
          ingress:
            class: "${var.ingress_class_name}"
YAML
}
