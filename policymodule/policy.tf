resource "newrelic_alert_channel" "email_channel" {
  name = "email-example"
  type = "email"

  config {
    recipients              = "jobanpreet@cloudeq.com"
    include_json_attachment = "1"
  }
}

# Provision the alert policy.
resource "newrelic_alert_policy" "policy_with_channels" {
  name                = "example-with-channels"
  incident_preference = "PER_POLICY"

  # NOTE: The `channel_ids` argument has been deprecated. Avoid usage.
  # Add the provisioned channels to the policy.
  channel_ids = [
    newrelic_alert_channel.email_channel.id,
  ]
}

data "newrelic_entity" "app" {
  name = "CEQ-ICT-DESKTOP-005"
  type = "HOST"
  domain = "INFRA"
}




resource "newrelic_nrql_alert_condition" "condition1" {
  account_id = 4438270
  policy_id = newrelic_alert_policy.policy_with_channels.id
  type = "static"
  name = "condition1"
  enabled = true
  violation_time_limit_seconds = 259200

  nrql {
    query = "SELECT average(cpuPercent) FROM SystemSample FACET entityName"
  }

  critical {
    operator = "above"
    threshold = 1
    threshold_duration = 60
    threshold_occurrences = "all"
  }
  fill_option = "none"
  aggregation_window = 60
  aggregation_method = "event_flow"
  aggregation_delay = 120
}
