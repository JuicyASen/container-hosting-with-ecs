variable "provider_url" {
  type = string
}

variable "audience" {
  type = string
}

variable "repo_name" {
  type = string
}

variable "provider_thumbprint" {
  type = string

  validation {
    condition = length(var.provider_thumbprint) == 40
    error_message = "The length of oidc provider thumbprint must be exact 40"
  }
}