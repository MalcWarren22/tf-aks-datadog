resource "kubernetes_namespace" "demo" {
  metadata {
    name = "demo-app"
  }
}

resource "kubernetes_deployment" "nginx" {
  metadata {
    name      = "demo-nginx"
    namespace = kubernetes_namespace.demo.metadata[0].name
    labels = {
      app = "demo-nginx"
    }
  }

  spec {
    replicas = 2

    selector {
      match_labels = {
        app = "demo-nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "demo-nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:stable"

          port {
            container_port = 80
          }

          resources {
            requests = {
              cpu    = "50m"
              memory = "64Mi"
            }
            limits = {
              cpu    = "200m"
              memory = "128Mi"
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "nginx" {
  metadata {
    name      = "demo-nginx-svc"
    namespace = kubernetes_namespace.demo.metadata[0].name
  }

  spec {
    selector = {
      app = kubernetes_deployment.nginx.metadata[0].labels.app
    }

    port {
      port        = 80
      target_port = 80
    }

    type = "ClusterIP"
  }
}
