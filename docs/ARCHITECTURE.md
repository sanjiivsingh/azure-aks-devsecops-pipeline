# Architecture Decision Records (ADR)

## ADR-001: Kubernetes Secrets Store CSI Driver vs. Native K8s Secrets

### Context
Workloads running on AKS frequently require credentials (database strings, API keys) stored in Azure Key Vault. Traditional approaches store base64-encoded strings directly in native Kubernetes Secret objects.

### Decision
Adopt **Azure Key Vault Provider for Secrets Store CSI Driver** (`key_vault_secrets_provider { secret_rotation_enabled = true }`):
- **Direct Mount:** Secrets are mounted directly into pods as read-only volume files without persisting plaintext secrets in etcd.
- **Automated Rotation:** CSI driver automatically synchronizes rotated Key Vault secrets without restarting pod workloads.

---

## ADR-002: Shift-Left Multi-Gate CI Pipeline vs. Monolithic Build

### Context
Pipelines often defer security testing to late deployment stages, slowing feedback loops.

### Decision
Implement a 5-tier progressive verification pipeline:
1. **Secrets:** Gitleaks entropy scanning before build starts.
2. **Unit Tests:** Isolated Pytest suite for FastAPI application code.
3. **IaC SAST:** Parallel Checkov and tfsec analysis on Terraform code.
4. **Container CVEs:** Trivy vulnerability scan against built container layers.
5. **K8s Quality:** YAML schema parsing and manifest validation.
