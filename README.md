# Project Aegis: Multi-Cloud Identity & Automated Governance

## 🎯 Executive Summary
Project Aegis is a **Compliance-as-Code** framework designed to automate security and identity governance across multi-cloud environments (AWS/Azure). Built for enterprise-scale operations, it ensures that infrastructure remains audit-ready for **SOC2 Type II**, **NIST 800-53**, and **HIPAA/FERPA** standards.

## 🏗 Technical Architecture & Decisions
To meet high-availability and security standards, Project Aegis implements:

* **Network Isolation:** Utilizes a custom AWS VPC with Private Subnets and NAT Gateways. This ensures EKS worker nodes are never exposed to the public internet.
* **Zero-Trust Identity:** Implements **IAM Roles for Service Accounts (IRSA)**. This allows Kubernetes pods to interact with AWS services via short-lived tokens, eliminating static IAM keys.
* **Automated Governance:** The `automation/` suite uses Python (Boto3) to perform real-time audits, ensuring "drift" from compliance is detected immediately.



## 🛠 Tech Stack
* **Cloud:** AWS (EKS, VPC, IAM, S3), Azure (AKS, Entra ID)
* **Infrastructure as Code:** Terraform
* **Automation/AIOps:** Python 3.12 (Boto3)
* **Identity:** Okta SSO / MFA Integration

## 🚀 How It Works
1. **Provision:** Terraform deploys a hardened EKS cluster in a private VPC.
2. **Secure:** IRSA maps Okta-authenticated identities to specific AWS resources.
3. **Audit:** The `compliance_engine.py` script scans the environment for security gaps (e.g., unencrypted buckets or missing MFA).
