# Agentic Orchestration Layer - Project Aegis

This module demonstrates the **connectivity layer** for Project Aegis. It moves beyond simple prompt chains to **stateful agentic workflows**.

### How Agents Connect:
* **State Persistence:** We use `LangGraph` to manage the lifecycle of an autonomous action.
* **Aegis Proxy Interception:** Every hand-off between the `security_agent` and `infrastructure_agent` is intercepted by the **NIST AI RMF Compliance Engine**.
* **Governance-as-Code:** The infrastructure agent cannot execute a `Terraform apply` until the security agent returns an `APPROVED` status within the state object.

### Integration:
* **Orchestration:** LangGraph / AutoGen
* **Observability:** LangSmith (tracking agent drift)
* **Execution:** Kubernetes (AKS/GKE) IaC
