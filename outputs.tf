output "hostname" {
  description = "Name of the kubernetes service"
  value       = kubernetes_service.redis.metadata[0].name
}

output "port" {
  description = "Port for the kubernetes service"
  value       = var.service_port
}

output "password_secret" {
  description = "Secret that is created with the Redis password"
  value       = lookup(var.env, "REDIS_PASSWORD_FILE", local.create_password ? kubernetes_secret.redis[0].metadata[0].name : var.password_secret)
}

output "password_key" {
  description = "Key for the Redis password in the secret"
  value       = var.password_key
}
