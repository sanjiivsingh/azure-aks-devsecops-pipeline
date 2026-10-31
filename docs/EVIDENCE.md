# Verification & Evidence Summary

## 1. Verified CI Workflow Executions (GitHub Actions)

* **Pipeline Name:** End-to-End DevSecOps Pipeline (`.github/workflows/devsecops-pipeline.yml`)
* **Latest Passing Run ID:** `40195648287`
* **Direct CI Run URL:** [https://github.com/sanjiivsingh/azure-aks-devsecops-pipeline/actions/runs/40195648287](https://github.com/sanjiivsingh/azure-aks-devsecops-pipeline/actions/runs/40195648287)

---

## 2. Local Quality Gate & Test Evidence

### Application Unit Tests (Pytest)
```bash
cd app
PYTHONPATH=. pytest -v tests/
```
Output:
```text
============================= test session starts ==============================
rootdir: /Users/sanjeevsingh/DevOps/projects/azure-aks-devsecops-pipeline/app
collected 2 items

tests/test_app.py::test_health_endpoint PASSED                           [ 50%]
tests/test_app.py::test_root_endpoint PASSED                             [100%]

============================== 2 passed in 0.12s ===============================
```

### Infrastructure Validation (Terraform)
```bash
cd terraform
terraform init -backend=false
terraform validate
```
Output:
```text
Success! The configuration is valid.
```

---

## 3. Estimated Infrastructure Cost (Infracost Summary)

| Component | Tier / SKU | Monthly Cost (USD) |
| :--- | :--- | :---: |
| **AKS Cluster Management** | Free Tier (Standard SLA optional) | $0.00 |
| **AKS System Node Pool** | 2 x Standard_D2s_v3 (Linux) | ~$140.16 |
| **Azure Container Registry** | Standard SKU | ~$20.00 |
| **Azure Key Vault** | Standard SKU (RBAC enabled) | ~$0.03 |
| **Virtual Network & Subnet** | 10.240.0.0/16 | Free |
| **Total Base Monthly Est.** | | **~$160.19 / month** |

