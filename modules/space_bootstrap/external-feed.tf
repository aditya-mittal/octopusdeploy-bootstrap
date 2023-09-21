resource "octopusdeploy_helm_feed" "feed" {
  name     = var.helm_feed_name
  feed_uri = var.helm_feed_uri
  username = var.helm_feed_username
  password = var.helm_feed_password
}