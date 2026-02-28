Project Aegis: Multi-Cloud Identity & Automated Governance
🎯 Executive Summary
Project Aegis is a Compliance-as-Code framework designed to automate security and identity governance across AWS and Azure. It ensures infrastructure is audit-ready for SOC2 Type II and NIST 800-53.

🏗 Technical Architecture
This project implements a "Defense-in-Depth" strategy:
## 🏗 Technical Architecture
This project implements a "Defense-in-Depth" strategy:

* **Network:** Uses an AWS VPC with **Private Subnets**. Your EKS (Kubernetes) nodes stay hidden from the internet.
* **Identity:** Connects **Okta to AWS IAM** using OIDC. It uses **IRSA** (IAM Roles for Service Accounts) so apps only get the specific permissions they need.
* **Automation:** The Python engine in `/automation` scans for security holes (like open S3 buckets) and reports them.
