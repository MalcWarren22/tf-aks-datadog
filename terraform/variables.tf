variable "location" {
  type        = string
  description = "Azure region for the resource group and AKS cluster"
  default     = "eastus"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Azure resource group"
  default     = "rg-tf-aks-datadog"
}

variable "aks_cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
  default     = "aks-tf-datadog-demo"
}

variable "node_count" {
  type        = number
  description = "Number of nodes in the AKS node pool"
  default     = 1
}

variable "node_vm_size" {
  type        = string
  description = "VM size for AKS nodes"
  default     = "Standard_B2s"
}

# Datadog

variable "datadog_api_key" {
  type        = string
  description = "Datadog API key"
  sensitive   = true
}

variable "datadog_app_key" {
  type        = string
  description = "Datadog app key"
  sensitive   = true
}

variable "datadog_site" {
  type        = string
  description = "Datadog site (e.g., datadoghq.com, datadoghq.eu)"
  default     = "us5.datadoghq.com"
}

variable "datadog_cluster_name" {
  type        = string
  description = "Name of the cluster as it should appear in Datadog"
  default     = "aks-tf-datadog-demo"
}

variable "subscription_id" {
  type        = string
  description = "Azure subscription ID to deploy into"
}

