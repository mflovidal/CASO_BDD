**INF-239 Bases de Datos | CT-USM Postulaciones**

* **Alumno 1:** Sergio Fonseca - 202404559-8
* **Alumno 2:** Maria Florencia Vidal - 202473592-6

## Requisitos y Parámetros de Conexión

El modelo de Power BI se conecta a la base de datos transaccional local `ct_usm_postulaciones` en MySQL a través de **ODBC**.

* **Servidor (Host):** `127.0.0.1`
* **Puerto:** `3307` *(Aviso importante: El servidor MySQL en XAMPP para este desarrollo operó en el puerto 3307.)*
* **Usuario:** `root`
* **Contraseña:** *(Vacío)*
* **Base de Datos:** `ct_usm_postulaciones`
* **Driver:** MySQL ODBC 8.0 Unicode Driver (o superior)

---

## Instrucciones de Reproducibilidad (Paso a Paso)

Para poder visualizar y refrescar los dashboards en Power BI Desktop sin errores, es **estrictamente necesario** seguir este orden:

### Paso 1: Restaurar la Base de Datos en MySQL (XAMPP)

1. Asegúrese de que el servicio MySQL esté corriendo en XAMPP.
2. Abra **phpMyAdmin** (generalmente en `http://localhost/phpmyadmin/` o ajustando el puerto).
3. En la pestaña superior de **Bases de Datos** cree una nueva con el nombre de `ct_usm_postulaciones`.
4. Vaya a la pestaña **Importar**.
5. Seleccione el archivo  `ct_usm_postulaciones.sql` ubicado en la carpeta `BD/` de esta entrega.
6. Ejecute la importación. Este script: insertara la base de datos, la estructura, los datos masivos y **creará las vistas `vw_postulaciones_gestion` y `vw_equipo_gestion` necesarias para Power BI**.

*(Aviso importante: De no funcionar de esta forma hay un segundo archivo de respaldo llamado `script_unificado.sql` que ejecuta de manera secuencial 5 scripts: Los 3 usados en la T2, el de poblamiento masivo y unos fixes necesarios, este debe ser ejecutado en la pestaña **SQL**, para ello copie y pegue el contenido del archivo en esa pestaña. Ambos metodos dan el mismo resultado.)*

### Paso 2: Configurar la Conexión ODBC en Windows

Power BI necesita un DSN (Data Source Name) con un nombre específico para ubicar la base de datos.

1. En Windows, busque y abra el **"Administrador de orígenes de datos ODBC (64 bits)"**.
2. En la pestaña **DSN de usuario** presione **Agregar...**
3. Elija el controlador de MySQL (Ej: `MySQL ODBC 8.0 Unicode Driver`) y haga clic en Finalizar.
4. Rellene el formulario EXACTAMENTE con estos valores:
* **Data Source Name:** `XAMPP_MySQL` *(El `.pbix` fallará si no se llama exactamente así)*
* **TCP/IP Server:** `127.0.0.1`
* **Port:** `3307` *(Modifíquelo a 3306 si el MySQL de su XAMPP local usa el puerto por defecto)*
* **User:** `root`
* **Password:** *(Dejar vacío)*
* **Database:** `ct_usm_postulaciones`


5. Presione **Test** para comprobar la conexión y luego en **OK** para guardar.

### Paso 3: Abrir y Refrescar Power BI

1. Abra el archivo `.pbix` ubicado en la carpeta `PBI/`.
2. En la pestaña de **Inicio (Home)** de Power BI Desktop, haga clic en el botón **Actualizar (Refresh)**.
3. Todos los datos, tarjetas de KPIs y visualizaciones gráficas se sincronizarán limpiamente extrayendo la información desde MySQL.

---

## Supuestos y Consideraciones Adicionales

Para asegurar el funcionamiento y el modelado correcto, se asumieron las siguientes premisas:

1. **Vistas como Capa de Abstracción:** En lugar de importar todas las tablas normalizadas y saturar el modelo de Power BI con `JOINs`, la transformación y relación (como cruzar empresas con tamaños, convenios y regiones) se delegó al motor MySQL mediante la creación de vistas analíticas directas (`vw_postulaciones_gestion` y `vw_equipo_gestion` donde al final solo fue utilizada una junto con la tabla de empresa.).
2. **Volumen de Datos:** El archivo SQL incluye una expansión masiva realista. Se insertaron al menos 300 postulaciones y 80 empresas, garantizando que cada sede aparezca al menos 20 veces y exista diversidad absoluta de convenios, presupuestos y regiones sin datos idénticos.
3. **Puertos:** Como se mencionó en la sección de parámetros, todo el desarrollo fue testeado en el puerto local `3307`. Si el equipo corrector corre XAMPP en `3306`, simplemente debe indicarlo al crear el origen ODBC y, opcionalmente, revisar el origen en el editor de Power Query en caso de un error de credenciales.
4. **Agregaciones Nativas:** Siguiendo la exigencia del documento del caso, todos los cálculos (presupuestos y conteos) de las tarjetas se realizaron mediante funciones predeterminadas de Suma y Recuento integradas de Power BI; no se implementó código DAX.

