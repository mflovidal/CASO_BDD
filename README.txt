CASO: GESTIÓN DE DATOS — INF-239 BASES DE DATOS

Sergio Fonseca - 202404559-8
María Florencia Vidal – 202473592-6



REQUISITOS PREVIOS
- XAMPP instalado con MySQL corriendo en el puerto 3306
- Power BI Desktop instalado
- Conector MySQL para Power BI instalado


  RESTAURAR LA BASE DE DATOS
1. Abrir XAMPP Control Panel e iniciar MySQL
2. Abrir el navegador y entrar a http://localhost/phpmyadmin
3. Crear una base de datos llamada: ct_usm_postulaciones
4. Ir a la pestaña Importar y cargar los archivos en este orden:
   a. creacionT2.sql
   b. insercionT2.sql
   c. objetos.sql
   d. datos_masivos.sql


  PARÁMETROS DE CONEXIÓN
Host:           localhost
Puerto:         3306
Base de datos:  ct_usm_postulaciones
Usuario:        root
Contraseña:     (vacía, no ingresar nada)


  REFRESCAR EL ARCHIVO .pbix
1. Abrir el archivo bdd.1.pbix en Power BI Desktop
2. Ir a Inicio -> Actualizar
3. Si pide credenciales: usuario root, contraseña vacía
4. Si cambia el host o puerto, ir a:
   Inicio -> Transformar datos -> Configuración del origen de datos
   y actualizar los parámetros de conexión


  ESTRUCTURA DEL ARCHIVO .pbix
El archivo contiene 2 páginas:

Dashboard 1 — Control General:
   Control de postulaciones, presupuesto y evolución temporal.
Dashboard 2 — Gestión Territorial:
   Análisis por sede, región y perfil de empresas.
Tablas importadas desde MySQL:
   - vw_postulaciones_gestion: vista con datos de postulaciones,
     empresa, sede y regiones.
   - vw_equipo_gestion: vista con integrantes del equipo de trabajo.
Relación entre tablas:
   vw_postulaciones_gestion.codigo (1) -> vw_equipo_gestion.codigo (*)


  SUPUESTOS
- convenio_marco aparece como True/False en Power BI porque MySQL
  lo almacena como TINYINT(1). True equivale a Si y False equivale a No.
- Los datos masivos fueron generados sinteticamente para cumplir el
  volumen minimo exigido (300 postulaciones, 80 empresas), manteniendo
  variacion real en fechas, presupuestos, regiones y tamanios de empresa.
- El campo anio y mes fueron calculados directamente en la vista SQL
  a partir del campo fecha de la postulacion.
- Las vistas SQL (vw_postulaciones_gestion y vw_equipo_gestion) fueron
  creadas en MySQL para simplificar la conexion con Power BI y evitar
  ambiguedades en los JOINs.
- Se uso importacion de datos (no DirectQuery) para mejor rendimiento.
- La empresa externa solo se asocia a la postulacion, no se crea desde
  el sistema PHP (se asume que ya existe en la BD).