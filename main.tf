terraform {
  backend "http" {
  }
}


provider "gitlab" {
    token = var.gitlab_terraform
}


#==========================================================
#terraform {
#  backend "http" {
#  }
#  required_providers {
#    gitlab = {
#       source = "gitlabhq/gitlab"
#       version = "~> 3.1"
#    }
#  }
#}
#
#variable "gitlab_access_token" {
#  type = string
#}
#=========================================================== P

resource "gitlab_group" "Devs" {
  name        = "Devs"
  description = "First group"
  id          = 1111
}

resource "gitlab_group" "Admins" {
  name        = "Admins"
  description = "Second group"
  id          = 2222
}

#=========================================================== Groups
resource "gitlab_user" "user-1" {
  name             = "user-1"
  username         = "test1"
  password         = "Password1"
  email            = "akashca@codemancers.com"
  is_admin         = true
  projects_limit   = 4
  can_create_group = false
  is_external      = true
  reset_password   = false
  id               = 3333
}

resource "gitlab_user" "user-2" {
  name             = "user-2"
  username         = "test2"
  password         = "Password2"
  email            = "bipinoctca@gmail.com"
  is_admin         = true
  projects_limit   = 4
  can_create_group = false
  is_external      = true
  reset_password   = false
  id               = 4444
}
#=========================================================== Users

resource "gitlab_group_membership" "gm-1" {
  group_id     = "1111"
  user_id      = 3333
  access_level = "guest"
}

resource "gitlab_group_membership" "gm-2" {
  group_id     = "2222"
  user_id      = 4444
  access_level = "guest"
}

#=========================================================== GM

resource "gitlab_project" "project-1" {
  name        = "project-1"
  description = "First project"

  visibility_level = "public"
}

resource "gitlab_project" "project-2" {
  name        = "project-2"
  description = "Second project"

  visibility_level = "public"
}
