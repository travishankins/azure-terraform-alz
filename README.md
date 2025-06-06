# Azure Landing Zone on Terraform ☁️🏗️

**Infrastructure‑as‑Code** blueprint that deploys Microsoft's **Azure Landing Zone (ALZ)** architecture using open‑source **Terraform** modules.

## 📋 Table of Contents

* [Why this repo?](#why-this-repo)
* [Architecture](#architecture)
* [Key Features](#key-features)
* [Quick Start](#quick-start)
* [Repository Structure](#repository-structure)
* [Modules](#modules)
* [Customization](#customization)
* [Roadmap](#roadmap)
* [Resources](#resources)


## Why this repo?

Implementing Microsoft’s Cloud Adoption Framework “Ready” stage manually can be error‑prone and time‑consuming.
This repo offers a **repeatable, idempotent** way to bootstrap an enterprise‑grade Azure foundation that is:

* **Secure by default** – baseline policies, role assignments, and guardrails.
* **Scalable** – hierarchical management groups & subscriptions ready for workload landing zones.
* **Extensible** – modular design lets you swap or add components with minimal code changes.

## Architecture

![High-level architecture](docs/architecture/alz-terraform-diagram.png)

The design follows the Enterprise‑scale landing zone reference with separate **Management**, **Connectivity**, and **Identity** management groups.
Networking can be deployed with either classic **Hub & Spoke** or **Virtual WAN + Virtual Hub** (default).

## Key Features

| Icon | Feature                      | Description                                                                                                                       |
| ---- | ---------------------------- | --------------------------------------------------------------------------------------------------------------------------------- |
| 🚀   | **Automated bootstrap**      | Deploys remote state storage, backend key vault, and management group hierarchy in one `terraform apply`.                         |
| 🛡️  | **Policy‑driven governance** | Assigns 🔒 CAF & ALZ‑aligned Azure Policy sets in **audit** mode (configurable to *deny*).                                        |
| 🌐   | **Enterprise network edge**  | Builds Virtual WAN, hubs, route tables, and optional ExpressRoute Gateway in the Connectivity subscription.                       |
| 🔍   | **Diagnostics & monitoring** | Sends activity logs, metrics, and platform alerts to a central Log Analytics workspace with Azure Monitor Baseline Alerts (AMBA). |
| 🧩   | **Pluggable modules**        | Drop‑in modules for Bastion, Key Vault, Automation, Defender, etc.                                                                |
| ♻️   | **Idempotent & CI/CD ready** | Works with GitHub Actions / Azure DevOps pipelines out of the box.                                                                |

## Quick Start

```bash
# 1. Prerequisites
az login
az account set --subscription "<management subscription>"

# 2. Clone & init
git clone https://github.com/travishankins/azure-terraform-alz.git
cd azure-terraform-alz
terraform init -backend-config="resource_group_name=tfstate-rg"

# 3. Review & deploy
terraform plan -var-file="terraform.tfvars"
terraform apply -var-file="terraform.tfvars"
```

> **Note:** `terraform.tfvars` contains sample values for demo purposes—update them to match your environment.

## Repository Structure

```
.
├── modules/                    # Reusable sub‑modules
│   ├── management_groups/
│   ├── vwan_with_vhub/
│   ├── azure_policy/
│   └── optional_resources/
├── docs/                       # Diagrams & additional guidance
├── main.tf                     # Root module composition
├── variables.tf                # Input variables
├── terraform.tfvars            # Default variable values
└── LICENSE
```

## Modules

| Module                  | Purpose                                                                               |
| ----------------------- | ------------------------------------------------------------------------------------- |
| **management\_groups**  | Creates CAF‑aligned management group hierarchy and assigns baseline RBAC.             |
| **vwan\_with\_vhub**    | Deploys Virtual WAN, Hub(s), spoke connections, and optional ExpressRoute.            |
| **azure\_policy**       | Assigns built‑in & custom policy initiatives covering Governance, Security, and Cost. |
| **optional\_resources** | Enables Log Analytics, Automation, Bastion, or Defender as needed.                    |

## Customization

1. Copy `terraform.tfvars` and adjust prefixes, regions, and toggles.
2. Toggle modules by setting `enable_*` variables.
3. Override or extend policy definitions in `modules/azure_policy/custom`.

## Roadmap

* 🔄 Bicep parity module examples
* 📦 Registry‑published versioned modules


## Resources

* [Cloud Adoption Framework – ALZ](https://aka.ms/alz)
* [Terraform Azure Verified Modules](https://registry.terraform.io/namespaces/Azure)
* [Microsoft ALZ Terraform Accelerator article](https://techcommunity.microsoft.com/blog/azuregovernanceandmanagementblog/introducing-terraform-support-for-azure-monitor-baseline-alerts-amba-for-azure-l/4414766)
