data "squadcast_team" "example_team" {
  name = "example test name"
}

data "squadcast_user" "example_user" {
  email = "test@example.com"
}

data "squadcast_service" "example_service" {
  name    = "example service name"
  team_id = data.squadcast_team.example_team.id
}

data "squadcast_service" "example_service_2" {
  name    = "example service name 2"
  team_id = data.squadcast_team.example_team.id
}

resource "squadcast_webform" "example_webform" {
  name            = "example webform name"
  team_id         = data.squadcast_team.example_team.id
  form_owner_type = "user"
  form_owner_id   = data.squadcast_user.example_user.id
  form_owner_name = data.squadcast_user.example_user.name
  services {
    name       = data.squadcast_service.example_service.name
    service_id = data.squadcast_service.example_service.id
  }
  services {
    name       = data.squadcast_service.example_service_2.name
    service_id = data.squadcast_service.example_service_2.id
  }
  header      = "formHeader"
  description = "formDescription"
  title       = "formTitle"
  footer_text = "footerText"
  logo_url    = "logoUrl"
  footer_link = "footerLink"
  email_on    = ["acknowledged", "resolved", "triggered"]
  severity {
    type        = "severityType"
    description = "severityDescription"
  }
  tags = {
    tagKey  = "tagValue"
    tagKey2 = "tagValue2"
  }
}
