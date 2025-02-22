output "name" {
  description = "The name of the self-signed ClusterIssuer"
  value       = kubectl_manifest.cluster_issuer.name
}
