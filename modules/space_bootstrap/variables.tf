variable "space_id" {}

variable "clusters" {
  type = map(object({
    endpoint               = string
    token_value            = string
    token_name             = string
    deployment_target_name = string
    environment_ids        = list(string)
  }))
}

variable "deployment_target_roles" {
  type = list(string)
}

variable "helm_feed_name" {}
variable "helm_feed_uri" {}
variable "helm_feed_username" {}
variable "helm_feed_password" {}


variable "developer_role_partial_name" {}
variable "development_team_name" {}
variable "development_team_description" {}
