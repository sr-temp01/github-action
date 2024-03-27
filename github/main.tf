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

data "github_user" "self" {
  username = "soniyaraibagi"
}

data "github_organization" "temp" {
  name = "sr-temp01"
}

output "github_organization_data" {
  value = data.github_organization.temp
}

data "github_membership" "self" {
  username = data.github_user.self.login
}

output "github_membership_data" {
  value = "${data.github_membership.self}"
}

resource "github_membership" "soniyaraibagi" {
  username = "soniyaraibagi"
  role     = "member"
}

import {
  to = github_membership.soniyaraibagi
  id = "sr-temp01:soniyaraibagi"
}