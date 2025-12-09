resource "kubernetes_namespace" "datadog" {
  metadata {
    name = "datadog"
  }
}

resource "helm_release" "datadog" {
  name       = "datadog"
  namespace  = kubernetes_namespace.datadog.metadata[0].name
  repository = "https://helm.datadoghq.com"
  chart      = "datadog"

  # you can pin if you want:
  version    = "3.149.3"

  create_namespace = false

  values = [
    yamlencode({
      # Core Datadog agent settings
      datadog = {
        apiKey      = var.datadog_api_key
        site        = var.datadog_site
        clusterName = var.datadog_cluster_name

        # use the new kube-state-metrics core
        kubeStateMetricsEnabled = false

        logs = {
          enabled = true
        }

        apm = {
          enabled = true
        }

        processAgent = {
          enabled = true
        }

        collectEvents = true
      }

     
      clusterAgent = {
        enabled       = true
        collectEvents = true
      }

      
      kubeStateMetricsCore = {
        enabled = true
      }

     
      kubeStateMetrics = {
        enabled = false
      }

      
      orchestratorExplorer = {
        enabled = true
      }
    })
  ]

  depends_on = [
    azurerm_kubernetes_cluster.aks
  ]
}
