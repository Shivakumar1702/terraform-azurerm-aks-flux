variable "rg_name" {
  type        = string
  default     = "cluster-resource-group-001"
  description = "The name of the resource group in which to create the Container Registry. Changing this forces a new resource to be created."

}

variable "rg_location" {
  type        = string
  default     = "eastus"
  description = "Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."

}

variable "tag" {
  type        = string
  default     = "development"
  description = "To add enviroment tag to cluster and the node pool"

}

variable "cluster_name" {
  type        = string
  default     = "cluster-example-001"
  description = "The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."

}

variable "dns_prefix" {
  type        = string
  default     = "mydns"
  description = "DNS prefix specified when creating the managed cluster. Possible values must begin and end with a letter or number, contain only letters, numbers, and hyphens and be between 1 and 54 characters in length. Changing this forces a new resource to be created."

}

variable "upgrade_type" {
  type        = string
  default     = "stable"
  description = "The upgrade channel for this Kubernetes Cluster. Possible values are patch, rapid, node-image and stable."

}

variable "vm_size" {
  type        = string
  default     = "Standard_B2s"
  description = "The size of the Virtual Machine, such as Standard_DS2_v2"

}

variable "enable_auto_scaling" {
  type        = bool
  default     = false
  description = "Should the Kubernetes Auto Scaler be enabled for this Node Pool?"

}

variable "node_pool_name" {
  type        = string
  default     = "nodepool"
  description = "The name which should be used for the default Kubernetes Node Pool."

}

variable "node_count" {
  type        = number
  default     = 1
  description = "Number of VMs in the default node pool."

}

variable "network_plugin" {
  type        = string
  default     = "kubenet"
  description = "Network plugin to use for networking. Currently supported values are azure, kubenet and none. Changing this forces a new resource to be created."

}

variable "network_policy" {
  type        = string
  default     = "calico"
  description = "Sets up network policy to be used with Azure CNI. Network policy allows us to control the traffic flow between pods. Currently supported values are calico, azure and cilium."

}

variable "fluxconf_name" {
  type        = string
  default     = "flux-gitops"
  description = "Specifies the name which should be used for this Kubernetes Flux Configuration. Changing this forces a new Kubernetes Flux Configuration to be created."

}

variable "flux_namespace" {
  type        = string
  default     = "flux"
  description = " Specifies the namespace to which this configuration is installed to. Changing this forces a new Kubernetes Flux Configuration to be created."

}

variable "git_repo_url" {
  type        = string
  description = "Specifies the URL to sync for the flux configuration git repository. It must start with http://, https://, git@ or ssh://"

}

variable "reference_type" {
  type        = string
  default     = "branch"
  description = "Specifies the source reference type for the GitRepository object. Possible values are branch, commit, semver and tag"

}

variable "reference_value" {
  type        = string
  default     = "main"
  description = "Specifies the source branch name"

}

variable "git_user" {
  type        = string
  description = "Specifies the plaintext HTTPS username used to access private git repositories over HTTPS."

}

variable "git_token" {
  type        = string
  description = "Specifies the Base64-encoded HTTPS personal access token or password that will be used to access the repository."

}

variable "path" {
  type        = string
  description = "Specifies the path in the source reference to reconcile on the cluster."
  default     = "/"

}