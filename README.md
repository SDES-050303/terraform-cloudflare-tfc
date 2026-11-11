# Práctica 12 – Terraform Cloud + Cloudflare (módulos)

Práctica 11 refactorizada en un módulo reutilizable y desplegada desde **Terraform Cloud** (flujo VCS: cada push a `main` ejecuta plan + apply).

```
.
├── versions.tf          # provider de Cloudflare
├── variables.tf         # account_id, api_token, worker_name, d1_database_name
├── main.tf              # llama al módulo
├── outputs.tf
└── modules/
    └── cloudflare-worker-d1/
        ├── main.tf      # D1 + Worker + subdominio workers.dev
        ├── variables.tf
        ├── outputs.tf
        ├── versions.tf
        ├── README.md
        └── src/worker.js
```

Variables del workspace (Terraform Cloud → Variables, categoría *Terraform variable*):

| Variable | Sensible |
| --- | --- |
| `account_id` | no |
| `api_token` | **sí** |
| `worker_name` | no (opcional) |
| `d1_database_name` | no (opcional) |
