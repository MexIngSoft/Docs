## Corrección obligatoria: migraciones y servidor de base de datos

Se detectó que algunas migraciones se están generando o ejecutando sobre SQLite, lo cual es incorrecto para este proyecto.

Todos los proyectos deben trabajar sus migraciones directamente contra PostgreSQL, ya que para eso existe la infraestructura con Docker y el servidor de base de datos definido.

### Regla principal

Ningún proyecto debe usar SQLite para desarrollo, pruebas internas de migración o generación de tablas, salvo que exista una justificación técnica documentada y aprobada.

La base de datos oficial para desarrollo debe ser PostgreSQL.

### Uso correcto de Docker y PostgreSQL

Cada proyecto debe conectarse al servidor PostgreSQL definido en Docker.

Las migraciones deben ejecutarse contra la base de datos correspondiente dentro del servidor PostgreSQL.

Si un proyecto necesita:

* una nueva base de datos;
* un nuevo esquema;
* un usuario específico;
* permisos adicionales;
* extensiones de PostgreSQL;
* datos iniciales;

entonces no debe configurarlo manualmente dentro del código del proyecto.

Debe modificarse el script de inicialización del servidor de base de datos o la configuración Docker correspondiente.

### Documentación obligatoria

Se debe documentar claramente:

* nombre del servidor de base de datos;
* contenedor Docker usado para PostgreSQL;
* nombre de la base de datos por proyecto;
* usuario y permisos requeridos;
* esquema usado, si aplica;
* puerto interno y externo;
* variables de entorno necesarias;
* comando correcto para ejecutar migraciones;
* comando para crear nuevas bases de datos o esquemas;
* ubicación del script inicial del servidor;
* procedimiento para levantar el entorno desde cero.

### Validación pendiente

Aprovechando la revisión de la cotización, verificar si ya está documentado el servidor de base de datos.

Si no está documentado, agregar una sección específica llamada:

**Servidor de base de datos PostgreSQL**

En esa sección debe quedar claro que PostgreSQL es el servidor oficial de datos y que todas las migraciones de los proyectos deben ejecutarse ahí, no en SQLite.

### Criterio de aceptación

La tarea se considera correcta solamente si:

1. SQLite ya no aparece como base de datos activa del proyecto.
2. Las variables de entorno apuntan a PostgreSQL.
3. Docker levanta correctamente el servidor de base de datos.
4. Las migraciones se ejecutan sobre PostgreSQL.
5. Está documentado cómo crear una nueva base de datos o esquema.
6. Está documentado el servidor de base de datos dentro de la cotización o documentación técnica.
