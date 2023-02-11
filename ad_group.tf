data "azuread_client_config" "current" {}

resource "azuread_group" "Dev" {
  display_name     = "Dev"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}