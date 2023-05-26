data "squadcast_team" "example_team" {
  name = "example team name"
}

data "squadcast_user" "example_user" {
  email = "test@example.com"
}

resource "squadcast_runbook" "example_runbook" {
  name    = "example runbook name"
  team_id = data.squadcast_team.example_team.id

  steps {
    content = "some text here"
  }

  steps {
    content = "some text here 2"
  }

  entity_owner {
    id  = data.squadcast_user.example_user.id
    type = "user"
  }
}
