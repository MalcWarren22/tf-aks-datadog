\# Terraform AKS + Datadog Observability Mini-Lab



This repo contains a hands-on lab where I use \*\*Terraform\*\* to provision an \*\*Azure Kubernetes Service (AKS)\*\* cluster and then hook it up to \*\*Datadog\*\* for Kubernetes observability.



The goal of this project is to practice real-world cloud engineering workflows:



\- Infrastructure as Code with Terraform  

\- Managed Kubernetes on Azure (AKS)  

\- Container / node-level monitoring with Datadog  

\- Basic CI/CD readiness (infra as code, repeatable deploys)



---



\## Architecture Overview



\*\*High-level flow:\*\*



1\. Terraform uses the Azure provider to create:

&nbsp;  - Resource group  

&nbsp;  - AKS cluster (control plane + node pool)  

&nbsp;  - Supporting resources (as defined in the code)



2\. Once the cluster is created, I connect to it using `az` + `kubectl`.



3\. The Datadog \*\*Agent\*\* is deployed into the cluster (via Helm or Kubernetes manifests), which:

&nbsp;  - Scrapes cluster + node metrics

&nbsp;  - Collects container logs

&nbsp;  - Sends data to my Datadog account via an API key



4\. From the Datadog UI I can see:

&nbsp;  - Cluster overview  

&nbsp;  - Nodes / pods status  

&nbsp;  - Metrics, logs, and events from AKS



---



\## Tech Stack



\- \*\*Cloud:\*\* Microsoft Azure  

\- \*\*Kubernetes:\*\* Azure Kubernetes Service (AKS)  

\- \*\*IaC:\*\* Terraform  

\- \*\*Observability:\*\* Datadog (Kubernetes Agent)  

\- \*\*CLI Tools:\*\* Azure CLI, kubectl, Helm (if used)



---



\## Prerequisites



\- Azure subscription

\- Datadog account + API key

\- Installed locally:

&nbsp; - \[Azure CLI](https://learn.microsoft.com/cli/azure/install-azure-cli)

&nbsp; - \[Terraform](https://developer.hashicorp.com/terraform/install)

&nbsp; - \[kubectl](https://kubernetes.io/docs/tasks/tools/)

&nbsp; - \[Helm](https://helm.sh/docs/intro/install/) (if using Helm for Datadog)



You should also be logged in to Azure:



```bash

az login

az account set --subscription "<YOUR\_SUBSCRIPTION\_ID>"



