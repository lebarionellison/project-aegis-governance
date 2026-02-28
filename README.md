Project Aegis: Multi-Cloud Identity & Automated Governance
🎯 Executive Summary
Project Aegis is a Compliance-as-Code framework designed to automate security and identity governance across AWS and Azure. It ensures infrastructure is audit-ready for SOC2 Type II and NIST 800-53.

🏗 Technical Architecture
This project implements a "Defense-in-Depth" strategy:

Network: Uses an AWS VPC with Private Subnets.

Identity: Connects Okta to AWS IAM using OIDC.

Automation: A Python-based engine scans for misconfigurations.

📊 System Flow
'''mermaid
graph TD
User --> GitHub_Actions
GitHub_Actions --> Terraform
Terraform --> IAM_Roles
IAM_Roles --> EKS_Cluster
EKS_Cluster --> S3_Data_Lake
'''

