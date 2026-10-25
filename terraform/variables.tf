variable "prefix" {
  description = "Prefix for all Azure resource names"
  type        = string
  default     = "secops-demo"
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "rg-devsecops-aks-prod"
}

variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "centralindia"
}

variable "kubernetes_version" {
  description = "Kubernetes control plane version"
  type        = string
  default     = "1.29"
}

variable "vm_size" {
  description = "Size of AKS worker nodes"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "node_count" {
  description = "Initial node pool size"
  type        = number
  default     = 2
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default = {
    Environment = "Production"
    ManagedBy   = "Terraform"
    Project     = "DevSecOps-AKS-Pipeline"
    Compliance  = "CIS-Azure"
  }
}
