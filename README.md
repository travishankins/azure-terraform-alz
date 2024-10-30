# Azure Landing Zone Deployment via Terraform

## Overview

This repository contains a comprehensive Terraform setup for deploying an Azure Landing Zone (ALZ) for enterprise-grade environments. Designed with modularity and scalability in mind, this builds upon the [Azure Verified Modules](https://aka.ms/avm) project but provides some flexability in the deployment based on a recent project I completed.

## Key Features

- **Modular Structure:** Reusable Terraform modules for management groups, virtual hubs, Azure Policies, and optional resources.
- **Azure Landing Zone (ALZ) Compliance:** Aligns with Microsoft's ALZ guidance for secure, compliant, and scalable cloud infrastructure.
- **Flexible Resource Group and Subscription Assignments:** Easily manage resources across different management groups and subscriptions.
- **Policy-Driven Governance:** Enforce compliance through Azure Policy configurations in audit mode.
- **Customizable Network Configuration:** Create Virtual Hub, ExpressRoute Gateway in Connectivity subscription
- **Extensibility:** Modules and configuration allow for easy customization and future resource additions.

## Repository Structure

The repository is organized as follows:

```plaintext
├── modules/
│   ├── management_groups/        # Terraform module for Azure Management Groups setup
│   ├── optional_resources/       # Optional resources like Log Analytics and Automation Accounts
│   ├── azure_policy/             # Azure Policy module for compliance and governance
│   └── vwan_with_vhub/           # Virtual WAN and Hub module for networking
│
├── main.tf                       # Main entry point to deploy ALZ infrastructure
├── variables.tf                  # Input variables for the deployment
├── terraform.tfvars              # Default variable values
├── locals.tf                     # Local values for computed names and dynamic resources
├── outputs.tf                    # Outputs for key resources
└── README.md                     # Repository overview and instructions
