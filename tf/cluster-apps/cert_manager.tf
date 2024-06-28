
# resource "helm_release" "cert-manager" {
#   name       = "cert-manager"
#   repository = "https://charts.jetstack.io"
#   chart      = "argo-cd"
#   version    = "v1.15.1"

#   create_namespace = true
#   namespace        = "cert-manager"

#   set {
#     name  = "crds.enabled"
#     value = "true"
#   }

# }
