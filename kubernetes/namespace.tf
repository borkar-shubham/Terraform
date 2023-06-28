resource "kubernetes_namespace" "namespace_1" {
  metadata {
    annotations = {
      name = "example-annotation"
    }

    labels = {
      mylabel = "ecom_dev"
    }

    name = "my_namespace"
  }
}