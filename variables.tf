variable "account_id" {
  description = "ID de la cuenta de Cloudflare"
  type        = string
}

variable "api_token" {
  description = "API token de Cloudflare (Workers Scripts Edit + D1 Edit)"
  type        = string
  sensitive   = true
}

variable "worker_name" {
  description = "Nombre del Worker"
  type        = string
  default     = "tfc-worker-practica"
}

variable "d1_database_name" {
  description = "Nombre de la base de datos D1"
  type        = string
  default     = "tfc-d1-practica"
}
