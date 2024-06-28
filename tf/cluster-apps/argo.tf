resource "helm_release" "argo_cd" {
  name       = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = "7.3.3"

  values = [
    "${file("values/argocd.yaml")}"
  ]
  create_namespace = true
  namespace        = "argocd"
}

resource "helm_release" "argo_cd_apps" {
  name       = "argocd-apps"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  version    = "2.0.0"

  values = [
    "${file("values/argocd-apps.yaml")}"
  ]
}
