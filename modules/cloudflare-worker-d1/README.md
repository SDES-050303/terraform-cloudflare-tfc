# Módulo `cloudflare-worker-d1`

Despliega en Cloudflare un **Worker** que responde peticiones GET, una base de datos **D1** enlazada al Worker y su **subdominio workers.dev**.

## Recursos

| Recurso | Descripción |
| --- | --- |
| `cloudflare_d1_database.this` | Base de datos D1 |
| `cloudflare_workers_script.this` | Worker (`src/worker.js`) con binding `DB` a la base D1 |
| `cloudflare_workers_script_subdomain.this` | Publica el Worker en `https://<worker_name>.<subdominio>.workers.dev` |

## Uso

```hcl
module "worker_d1" {
  source = "./modules/cloudflare-worker-d1"

  account_id       = var.account_id
  worker_name      = "mi-worker"
  d1_database_name = "mi-d1"
}
```

## Inputs

| Nombre | Tipo | Default | Descripción |
| --- | --- | --- | --- |
| `account_id` | string | — | ID de la cuenta de Cloudflare |
| `worker_name` | string | — | Nombre del Worker |
| `d1_database_name` | string | — | Nombre de la base D1 |
| `compatibility_date` | string | `"2026-09-16"` | Fecha de compatibilidad del runtime |
| `enable_workers_dev` | bool | `true` | Publicar en workers.dev |

## Outputs

| Nombre | Descripción |
| --- | --- |
| `worker_name` | Nombre del Worker desplegado |
| `d1_database_id` | UUID de la base D1 |
| `workers_dev_enabled` | Si el Worker está publicado en workers.dev |

## Endpoints del Worker

- `GET /` → JSON de saludo
- `GET /db` → consulta a la base D1
