terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }
}

provider "github" {
  token = var.token
}

data "github_organization" "temp" {
  name = "sr-temp01"
}

output "github_organization_data" {
  value = data.github_organization.temp
}

resource "github_membership" "soniyaraibagi" {
  username = "soniyaraibagi"
  role     = "member"
}

output "github_membership_data" {
  value = github_membership.soniyaraibagi
}