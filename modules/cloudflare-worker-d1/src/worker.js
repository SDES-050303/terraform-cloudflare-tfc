// Worker desplegado con Terraform: responde peticiones GET en JSON
export default {
  async fetch(request, env) {
    if (request.method !== "GET") {
      return Response.json({ error: "Solo se permite GET" }, { status: 405 });
    }

    const url = new URL(request.url);

    // Consulta a la base D1 creada por Terraform
    if (url.pathname === "/db") {
      try {
        const row = await env.DB.prepare("SELECT datetime('now') AS ahora, 1 + 1 AS suma").first();
        return Response.json({ d1: "ok", ...row });
      } catch (err) {
        return Response.json({ d1: "error", detalle: String(err) }, { status: 500 });
      }
    }

    return Response.json({
      mensaje: "Hola desde un Worker creado con Terraform",
      metodo: request.method,
      ruta: url.pathname,
      fecha: new Date().toISOString(),
    });
  },
};
