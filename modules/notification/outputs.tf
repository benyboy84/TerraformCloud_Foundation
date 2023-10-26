output "id" {
  description = "The ID of the notification configuration."
  valut       = tfe_notification_configuration.this.id
}

output "notification_configuration" {
  description = "Terraform Cloud notification configuration resource."
  valut       = tfe_notification_configuration.this
}