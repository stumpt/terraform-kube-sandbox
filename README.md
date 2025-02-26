[![Terraform Apply](https://github.com/itcaat/terraform-kubernetes-desktop-startkit/actions/workflows/k8s.yml/badge.svg)](https://github.com/itcaat/terraform-kubernetes-desktop-startkit/actions/workflows/k8s.yml)

# 🚀 Terraform Kubernetes — Starter Kit for Docker Desktop

This starter kit is designed for local Kubernetes experimentation using Terraform. It provides a preconfigured setup with certificate management, ingress routing, and load balancing, making it easy to test, learn, and prototype cloud-native deployments.

## 👨‍💻 Who is it for?
- DevOps Engineers & SREs who want a sandbox for testing infrastructure automation.
- Developers exploring Kubernetes deployments without cloud costs.
- Teams learning Terraform and Kubernetes best practices in a safe, local environment.

## 📂 Project Structure

### **Environments**
- `envs/local` - Local Environment. You can use Docker Desktop for local usage.

### **Modules**
Each service is managed as a separate module for better reusability and organization.

#### **📁 modules/metallb**
- Deploys **MetalLB** via Helm.
- Configures **IP address pools** dynamically using `kubectl_manifest`.

#### **📁 modules/cert-manager**
- Installs **Cert-Manager** using Helm.

#### **📁 modules/ingress-nginx**
- Deploys **Ingress-Nginx** as a controller for managing ingress traffic.

#### **📁 modules/cluster-issuer-selfsigned**
- Creates a **ClusterIssuer** and a self-signed CA certificate.

#### **📁 modules/cluster-issuer-production**
- Creates a **ClusterIssuer** that uses letsencrypt .

#### **📁 modules/echo-server**
- Deploys **Echo Server** using Kubernetes manifests.
- Configures an **Ingress resource** with self-signed TLS issued by Cert-Manager.

### **Requirements**
For local usage, for example, in Docker Desktop you might want to use selfsigned certificates. To do that process easy just install the tool `mkcert`.
```sh
# https://github.com/FiloSottile/mkcert?tab=readme-ov-file#installation
brew install mkcert
mkcert -install
```

## 🛠️ Setup and Deployment

The best way is fork the repo. But it's up to you.

1. **Set selfsigned CA certificate and key**
   For local usage you have set some TF_VAR
   ```sh
   export TF_VAR_cluster_issuer_selfsigned_ca_cert="$(base64 < "$(mkcert -CAROOT)/rootCA.pem")"
   export TF_VAR_cluster_issuer_selfsigned_ca_key="$(base64 < "$(mkcert -CAROOT)/rootCA-key.pem")"
   ```

2. **Customizing Variables:**

   You can override default locals by creating a `envs/local/locals.tf` file:
   ```hcl
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
   ```

3. **Initialize Terraform:**
   ```sh
   make tf-init
   ```

4. **Plan the deployment:**
   ```sh
   make tf-plan
   ```

5. **Apply the changes:**
   ```sh
   make tf-apply
   # or you can use -auto-approve option
   make tf-apply-approve
   ```

6. **Verify resources in Kubernetes:**
   ```sh
   kubectl get pods -A
   kubectl get svc -A
   kubectl get ingress -A
   ```

7. **Verify resources in Kubernetes:**
   ```sh
   curl https://echo.127.0.0.1.nip.io
   ```

### **Destroying the Infrastructure**
To remove all deployed resources:
```sh
make tf-destroy
# or you can use -auto-approve option
make tf-destroy-approve
```

### **Recreate Infrastructure**
To delete all deployed resources and create again:
```sh
make tf-recreate
```

### **Full Reset Infrastructure**
Delete EVERYTHING, including state and create again:
```sh
make tf-reset
```

## **Terraform Graph**
To visualize graph install dot app:
```sh
brew install graphviz
make tf-graph
```

## **Terraform Git Hooks**
You can install pre-commit hooks from .hooks folder for autoformatting files:
```sh
make setup-hooks
```

## **Terraform Tests**
You can run basic validation for your Terraform configuration:
```sh
make tf-test
```

## 📌 Key Features
✅ Modular architecture with separate Terraform modules.  
✅ Uses Helm for package management.  
✅ Configures self-signed certificates with Cert-Manager.  
✅ Supports MetalLB for LoadBalancer services in local Kubernetes environments.  
✅ Ingress-Nginx handles application routing.  
✅ Secure and automated TLS handling via ClusterIssuer.  

---
📢 **Contributions & Issues**
If you encounter any issues or have suggestions for improvements, feel free to contribute or raise an issue! 🚀
