# Terraform AKS + Datadog Observability Lab

**Infrastructure as Code • Managed Kubernetes • Observability**

This repository contains a hands-on Azure observability platform built using **Terraform** to provision **Azure Kubernetes Service (AKS)** and integrate **Datadog** for full cluster visibility.

The lab focuses on applying real-world cloud engineering patterns and repeatable infrastructure deployment workflows.

---

## Infrastructure Overview

The Azure environment implements a **managed Kubernetes observability platform** with centralized monitoring and metrics collection.

---

## High-Level Flow

1. **Terraform provisioning**
   - Resource group
   - AKS cluster (control plane + node pool)
   - Supporting Azure resources (as defined in code)

2. **Cluster access**
   - Authentication and access configured using `az` and `kubectl`

3. **Datadog integration**
   - Datadog Agent deployed into AKS (Helm or Kubernetes manifests)
   - Metrics, logs, and events collected from cluster and nodes
   - Telemetry securely forwarded to Datadog via API key

4. **Observability validation**
   - Cluster and node visibility available in Datadog UI
   - Pod status, metrics, logs, and events monitored centrally

---

## Platform Components

### Azure
- Azure Kubernetes Service (AKS)
- Resource Group
- Managed control plane and worker nodes

### Observability
- Datadog Kubernetes Agent
- Cluster metrics and events
- Container and node-level logging

### Infrastructure as Code
- Terraform Azure Provider
- Repeatable infrastructure deployments

---

## Tech Stack

- **Cloud:** Microsoft Azure  
- **Kubernetes:** Azure Kubernetes Service (AKS)  
- **Infrastructure as Code:** Terraform  
- **Observability:** Datadog (Kubernetes Agent)  
- **CLI Tools:** Azure CLI, kubectl, Helm

---

## Prerequisites

- Active Azure subscription  
- Datadog account with API key  

### Local Tooling
- [Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)
- [Terraform](https://developer.hashicorp.com/terraform/install)
- [kubectl](https://kubernetes.io/docs/tasks/tools/)
- [Helm](https://helm.sh/docs/intro/install/)

Log in to Azure before deploying:

```bash
az login
az account set --subscription "<YOUR_SUBSCRIPTION_ID>"




