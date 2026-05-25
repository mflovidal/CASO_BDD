USE ct_usm_postulaciones;

INSERT INTO region (nombre) VALUES
('Arica y Parinacota'), ('Tarapacá'), ('Antofagasta'), ('Atacama'), ('Coquimbo'), ('Valparaíso'),
('Metropolitana de Santiago'), ('Libertador General Bernardo O''Higgins'), ('Maule'),
('Ñuble'), ('Biobío'), ('La Araucanía'), ('Los Ríos'), ('Los Lagos'),
('Aysén del General Carlos Ibáñez del Campo'), ('Magallanes y de la Antártica Chilena');

INSERT INTO sede (nombre) VALUES
('Campus Casa Central Valparaíso'), ('Campus San Joaquín'),
('Campus Vitacura'), ('Sede Viña del Mar'), ('Sede Concepción');

INSERT INTO tamano_empresa (nombre) VALUES ('Microempresa'), ('Mediana'), ('Grande');

INSERT INTO tipo_iniciativa (nombre) VALUES ('Nueva'), ('Existente');

INSERT INTO tipo_persona (nombre) VALUES ('Profesor'), ('Estudiante');

INSERT INTO estado_postulacion (nombre) VALUES ('En Revisión'), ('Aprobada'), ('Rechazada'), ('Cerrada'), ('Borrador');

INSERT INTO rol (nombre) VALUES ('Responsable academico'), ('Evaluador'), ('Administrativo');

INSERT INTO empresa (nombre, rut, convenio_marco, id_tamano) VALUES
('TecnoChile S.A.',   '76.123.456-K', 1, 3),
('SoftAndes Ltda.',   '77.987.654-3', 0, 2),
('PymeDigital SpA',   '78.111.222-3', 1, 1),
('Innovación Valpo',  '79.333.444-5', 0, 1),
('Sistemas Sur S.A.', '80.555.666-7', 1, 2),
('DataMining SpA',    '81.777.888-9', 0, 3);

INSERT INTO representante_empresa (nombre, email, telefono, id_empresa) VALUES
('Pedro Álvarez',   'pedro.alvarez@tecnochile.cl',   '+56911111001', 1),
('Claudia Mena',    'claudia.mena@softandes.cl',     '+56911111002', 2),
('Jorge Reyes',     'jorge.reyes@pymedigital.cl',    '+56911111003', 3),
('Sandra Poblete',  'sandra.poblete@innovalpo.cl',   '+56911111004', 4),
('Andrés Carrasco', 'andres.carrasco@sistemassur.cl','+56911111005', 5),
('Mónica Leiva',    'monica.leiva@datamining.cl',    '+56911111006', 6);

INSERT INTO iniciativa (nombre, objetivo, descripcion_soluciones, resultados_esperados) VALUES
('Sistema de IA para Riego',           'Optimizar el uso de agua en agricultura',      'Algoritmos de ML integrados en sensores IoT',         'Ahorro del 30% en agua'),
('Plataforma de Trazabilidad Minera',  'Mejorar trazabilidad en extracción minera',    'Blockchain para registro de procesos extractivos',    'Reducción de mermas 20%'),
('App de Gestión Logística',           'Digitalizar la cadena logística regional',     'Aplicación móvil con seguimiento en tiempo real',     'Reducción 25% en tiempos'),
('Sistema de Monitoreo Ambiental',     'Vigilar indicadores medioambientales',         'Red de sensores con dashboard web centralizado',      'Alertas ante eventos críticos'),
('Automatización de Procesos PYME',    'Reducir tareas manuales repetitivas en PYME', 'RPA con integración a sistemas ERP existentes',       'Aumento 40% productividad'),
('Plataforma E-learning Técnico',      'Capacitar técnicos en nuevas tecnologías',     'LMS con módulos interactivos y evaluaciones online', '200 técnicos certificados/año'),
('Sistema de Análisis de Datos Pesca', 'Optimizar decisiones en sector pesquero',      'Data warehouse con visualización BI',                 'Mejora 15% en rentabilidad'),
('Red de Ciberseguridad Industrial',   'Proteger infraestructura crítica regional',    'SIEM con monitoreo continuo de redes OT/IT',          'Reducción 50% en incidentes'),
('Portal de Emprendimiento USM',       'Conectar emprendedores con mentores USM',      'Portal web con matching algorítmico',                 '100 emprendimientos por año'),
('Sistema Predictivo de Mantención',   'Anticipar fallas en maquinaria industrial',    'Modelos predictivos con datos de sensores',           'Reducción 35% paradas no plan.');

INSERT INTO postulacion (numero_postulacion, codigo, fecha, presupuesto_total, id_empresa, id_sede, id_region_ejecucion, id_region_impacto, id_tipo_iniciativa, id_estado, id_iniciativa) VALUES
(1001, 'POST-001', '2026-03-20',  5000000.00,  1, 1, 6,  6,  1, 1, 1),
(1002, 'POST-002', '2026-03-21',  8200000.00,  2, 2, 7,  7,  2, 2, 2),
(1003, 'POST-003', '2026-03-22',  3500000.00,  3, 3, 3,  6,  1, 1, 3),
(1004, 'POST-004', '2026-03-25',  6800000.00,  4, 4, 6,  7,  2, 3, 4),
(1005, 'POST-005', '2026-03-26',  9100000.00,  5, 5, 11, 11, 1, 2, 5),
(1006, 'POST-006', '2026-03-27',  4400000.00,  6, 1, 7,  6,  2, 1, 6),
(1007, 'POST-007', '2026-03-28',  7600000.00,  1, 2, 14, 14, 1, 4, 7),
(1008, 'POST-008', '2026-03-29', 11000000.00,  2, 5, 11, 12, 2, 2, 8),
(1009, 'POST-009', '2026-03-30',  2900000.00,  3, 3, 7,  7,  1, 1, 9),
(1010, 'POST-010', '2026-03-31', 15000000.00,  5, 1, 6,  7,  2, 2, 10);

INSERT INTO persona (rut, nombre) VALUES
('12.345.678-1', 'Juan Pérez'),
('13.456.789-2', 'María Soto'),
('14.567.890-3', 'Carlos Jara'),
('15.678.901-4', 'Ana González'),
('16.789.012-5', 'Roberto Muñoz'),
('17.890.123-6', 'Claudia Rojas'),
('18.901.234-7', 'Felipe Díaz'),
('19.012.345-8', 'Valentina Lagos'),
('10.123.456-9', 'Patricio Silva'),
('11.234.567-0', 'Lorena Fuentes'),
('20.111.222-1', 'Ana Ríos'),
('20.333.444-2', 'Luis Paz'),
('21.555.666-3', 'Florencia Vidal'),
('21.777.888-4', 'Diego Aras'),
('22.999.000-5', 'Elena Sol'),
('22.111.333-6', 'Matías Vera'),
('23.222.444-7', 'Camila Torres'),
('23.444.555-8', 'Sebastián Mora'),
('24.555.666-9', 'Isadora Núñez'),
('24.777.888-0', 'Gonzalo Pinto'),
('25.888.999-1', 'Javiera Castro'),
('25.111.222-2', 'Andrés Leal'),
('26.333.444-3', 'Fernanda Ramos'),
('26.555.666-4', 'Tomás Ibáñez'),
('27.777.888-5', 'Catalina Bravo');

INSERT INTO usuario (id_persona, email, contraseña, id_rol) VALUES
(1, 'juan.perez@usm.cl', '1234', 1),
(2, 'maria.soto@usm.cl', '1234', 2),
(3, 'carlos.jara@usm.cl', '1234', 1),
(4, 'ana.gonzalez@usm.cl', '1234', 2),
(5, 'roberto.munoz@usm.cl', '1234', 1),
(6, 'claudia.rojas@usm.cl', '1234', 2),
(7, 'felipe.diaz@usm.cl', '1234', 1),
(8, 'valentina.lagos@usm.cl', '1234', 2),
(9, 'patricio.silva@usm.cl', '1234', 1),
(10, 'lorena.fuentes@usm.cl', '1234', 2),
(11, 'ana.rios@usm.cl', '1234', 1),
(12, 'luis.paz@usm.cl', '1234', 2),
(13, 'florencia.vidal@usm.cl', '1234', 1),
(14, 'diego.aras@usm.cl', '1234', 2),
(15, 'elena.sol@usm.cl', '1234', 1),
(16, 'matias.vera@usm.cl', '1234', 2),
(17, 'camila.torres@usm.cl', '1234', 1),
(18, 'sebastian.mora@usm.cl', '1234', 2),
(19, 'isadora.nunez@usm.cl', '1234', 1),
(20, 'gonzalo.pinto@usm.cl', '1234', 2),
(21, 'javiera.castro@usm.cl', '1234', 1),
(22, 'andres.leal@usm.cl', '1234', 2),
(23, 'fernanda.ramos@usm.cl', '1234', 1),
(24, 'tomas.ibanez@usm.cl', '1234', 2),
(25, 'admin@usm.cl', 'admin123', 3);

-- Postulacion 1
INSERT INTO postulacion_persona (id_postulacion, id_persona, id_tipo_persona, id_sede, email, telefono, rol, departamento_area) VALUES
(1, 1, 1, 1, 'juan.perez@usm.cl',        '+56912345001', 'Director',      'Informática'),
(1, 2, 1, 1, 'maria.soto@usm.cl',        '+56912345002', 'Investigador',  'Electrónica'),
(1, 3, 1, 1, 'carlos.jara@usm.cl',       '+56912345003', 'Asesor',        'Matemáticas'),
(1, 11,2, 1, 'ana.rios@sansano.usm.cl',  '+56912345011', 'Desarrollador', 'Informática'),
(1, 12,2, 1, 'luis.paz@sansano.usm.cl',  '+56912345012', 'Tester',        'Informática'),
(1, 13,2, 1, 'flo.vidal@sansano.usm.cl', '+56912345013', 'Analista',      'Industrial'),
(1, 14,2, 1, 'diego.aras@sansano.usm.cl','+56912345014', 'Documentador',  'Informática'),
(1, 15,2, 1, 'elena.sol@sansano.usm.cl', '+56912345015', 'Apoyo',         'Eléctrica');

-- Postulacion 2
INSERT INTO postulacion_persona (id_postulacion, id_persona, id_tipo_persona, id_sede, email, telefono, rol, departamento_area) VALUES
(2, 4, 1, 2, 'ana.gonzalez@usm.cl',           '+56912345004', 'Director',       'Computación'),
(2, 5, 1, 2, 'roberto.munoz@usm.cl',           '+56912345005', 'Investigador',   'Informática'),
(2, 6, 1, 2, 'claudia.rojas@usm.cl',           '+56912345006', 'Co-investigador','Electrónica'),
(2, 16,2, 2, 'matias.vera@sansano.usm.cl',     '+56912345016', 'Desarrollador',  'Informática'),
(2, 17,2, 2, 'camila.torres@sansano.usm.cl',   '+56912345017', 'Tester',         'Informática'),
(2, 18,2, 2, 'sebastian.mora@sansano.usm.cl',  '+56912345018', 'Analista',       'Industrial'),
(2, 19,2, 2, 'isadora.nunez@sansano.usm.cl',   '+56912345019', 'Diseñador',      'Diseño'),
(2, 20,2, 2, 'gonzalo.pinto@sansano.usm.cl',   '+56912345020', 'Apoyo',          'Eléctrica');

-- Postulacion 3
INSERT INTO postulacion_persona (id_postulacion, id_persona, id_tipo_persona, id_sede, email, telefono, rol, departamento_area) VALUES
(3, 7, 1, 3, 'felipe.diaz@usm.cl',            '+56912345007', 'Director',      'Computación'),
(3, 8, 1, 3, 'valentina.lagos@usm.cl',         '+56912345008', 'Investigador',  'Matemáticas'),
(3, 9, 1, 3, 'patricio.silva@usm.cl',          '+56912345009', 'Asesor',        'Informática'),
(3, 21,2, 3, 'javiera.castro@sansano.usm.cl',  '+56912345021', 'Desarrollador', 'Informática'),
(3, 22,2, 3, 'andres.leal@sansano.usm.cl',     '+56912345022', 'Tester',        'Informática'),
(3, 23,2, 3, 'fernanda.ramos@sansano.usm.cl',  '+56912345023', 'Analista',      'Industrial'),
(3, 24,2, 3, 'tomas.ibanez@sansano.usm.cl',    '+56912345024', 'Documentador',  'Informática'),
(3, 25,2, 3, 'catalina.bravo@sansano.usm.cl',  '+56912345025', 'Apoyo',         'Eléctrica');

-- Postulacion 4
INSERT INTO postulacion_persona (id_postulacion, id_persona, id_tipo_persona, id_sede, email, telefono, rol, departamento_area) VALUES
(4, 1, 1, 4, 'juan.perez2@usm.cl',            '+56912345031', 'Director',      'Informática'),
(4, 4, 1, 4, 'ana.gonzalez2@usm.cl',           '+56912345032', 'Investigador',  'Computación'),
(4, 7, 1, 4, 'felipe.diaz2@usm.cl',            '+56912345033', 'Asesor',        'Computación'),
(4, 11,2, 4, 'ana.rios2@sansano.usm.cl',       '+56912345034', 'Desarrollador', 'Informática'),
(4, 12,2, 4, 'luis.paz2@sansano.usm.cl',       '+56912345035', 'Tester',        'Informática'),
(4, 16,2, 4, 'matias.vera2@sansano.usm.cl',    '+56912345036', 'Analista',      'Industrial'),
(4, 17,2, 4, 'camila.torres2@sansano.usm.cl',  '+56912345037', 'Diseñador',     'Diseño'),
(4, 21,2, 4, 'javiera.castro2@sansano.usm.cl', '+56912345038', 'Apoyo',         'Eléctrica');

-- Postulacion 5
INSERT INTO postulacion_persona (id_postulacion, id_persona, id_tipo_persona, id_sede, email, telefono, rol, departamento_area) VALUES
(5, 2, 1, 5, 'maria.soto2@usm.cl',             '+56912345041', 'Director',       'Electrónica'),
(5, 5, 1, 5, 'roberto.munoz2@usm.cl',           '+56912345042', 'Investigador',   'Informática'),
(5, 8, 1, 5, 'valentina.lagos2@usm.cl',         '+56912345043', 'Co-investigador','Matemáticas'),
(5, 13,2, 5, 'flo.vidal2@sansano.usm.cl',       '+56912345044', 'Desarrollador',  'Industrial'),
(5, 14,2, 5, 'diego.aras2@sansano.usm.cl',      '+56912345045', 'Tester',         'Informática'),
(5, 18,2, 5, 'sebastian.mora2@sansano.usm.cl',  '+56912345046', 'Analista',       'Industrial'),
(5, 22,2, 5, 'andres.leal2@sansano.usm.cl',     '+56912345047', 'Documentador',   'Informática'),
(5, 23,2, 5, 'fernanda.ramos2@sansano.usm.cl',  '+56912345048', 'Apoyo',          'Eléctrica');

-- Postulacion 6
INSERT INTO postulacion_persona (id_postulacion, id_persona, id_tipo_persona, id_sede, email, telefono, rol, departamento_area) VALUES
(6, 3, 1, 1, 'carlos.jara2@usm.cl',            '+56912345051', 'Director',      'Matemáticas'),
(6, 6, 1, 1, 'claudia.rojas2@usm.cl',           '+56912345052', 'Investigador',  'Electrónica'),
(6, 9, 1, 1, 'patricio.silva2@usm.cl',          '+56912345053', 'Asesor',        'Informática'),
(6, 15,2, 1, 'elena.sol2@sansano.usm.cl',       '+56912345054', 'Desarrollador', 'Eléctrica'),
(6, 19,2, 1, 'isadora.nunez2@sansano.usm.cl',   '+56912345055', 'Tester',        'Diseño'),
(6, 20,2, 1, 'gonzalo.pinto2@sansano.usm.cl',   '+56912345056', 'Analista',      'Eléctrica'),
(6, 24,2, 1, 'tomas.ibanez2@sansano.usm.cl',    '+56912345057', 'Documentador',  'Informática'),
(6, 25,2, 1, 'catalina.bravo2@sansano.usm.cl',  '+56912345058', 'Apoyo',         'Eléctrica');

-- Postulacion 7
INSERT INTO postulacion_persona (id_postulacion, id_persona, id_tipo_persona, id_sede, email, telefono, rol, departamento_area) VALUES
(7, 10,1, 2, 'lorena.fuentes@usm.cl',           '+56912345061', 'Director',      'Informática'),
(7, 1, 1, 2, 'juan.perez3@usm.cl',              '+56912345062', 'Investigador',  'Informática'),
(7, 2, 1, 2, 'maria.soto3@usm.cl',              '+56912345063', 'Asesor',        'Electrónica'),
(7, 11,2, 2, 'ana.rios3@sansano.usm.cl',        '+56912345064', 'Desarrollador', 'Informática'),
(7, 12,2, 2, 'luis.paz3@sansano.usm.cl',        '+56912345065', 'Tester',        'Informática'),
(7, 13,2, 2, 'flo.vidal3@sansano.usm.cl',       '+56912345066', 'Analista',      'Industrial'),
(7, 14,2, 2, 'diego.aras3@sansano.usm.cl',      '+56912345067', 'Documentador',  'Informática'),
(7, 15,2, 2, 'elena.sol3@sansano.usm.cl',       '+56912345068', 'Apoyo',         'Eléctrica');

-- Postulacion 8
INSERT INTO postulacion_persona (id_postulacion, id_persona, id_tipo_persona, id_sede, email, telefono, rol, departamento_area) VALUES
(8, 4, 1, 5, 'ana.gonzalez3@usm.cl',            '+56912345071', 'Director',       'Computación'),
(8, 5, 1, 5, 'roberto.munoz3@usm.cl',            '+56912345072', 'Investigador',   'Informática'),
(8, 6, 1, 5, 'claudia.rojas3@usm.cl',            '+56912345073', 'Co-investigador','Electrónica'),
(8, 16,2, 5, 'matias.vera3@sansano.usm.cl',      '+56912345074', 'Desarrollador',  'Informática'),
(8, 17,2, 5, 'camila.torres3@sansano.usm.cl',    '+56912345075', 'Tester',         'Informática'),
(8, 18,2, 5, 'sebastian.mora3@sansano.usm.cl',   '+56912345076', 'Analista',       'Industrial'),
(8, 19,2, 5, 'isadora.nunez3@sansano.usm.cl',    '+56912345077', 'Diseñador',      'Diseño'),
(8, 20,2, 5, 'gonzalo.pinto3@sansano.usm.cl',    '+56912345078', 'Apoyo',          'Eléctrica');

-- Postulacion 9
INSERT INTO postulacion_persona (id_postulacion, id_persona, id_tipo_persona, id_sede, email, telefono, rol, departamento_area) VALUES
(9, 7, 1, 3, 'felipe.diaz3@usm.cl',             '+56912345081', 'Director',      'Computación'),
(9, 8, 1, 3, 'valentina.lagos3@usm.cl',          '+56912345082', 'Investigador',  'Matemáticas'),
(9, 9, 1, 3, 'patricio.silva3@usm.cl',           '+56912345083', 'Asesor',        'Informática'),
(9, 21,2, 3, 'javiera.castro3@sansano.usm.cl',   '+56912345084', 'Desarrollador', 'Informática'),
(9, 22,2, 3, 'andres.leal3@sansano.usm.cl',      '+56912345085', 'Tester',        'Informática'),
(9, 23,2, 3, 'fernanda.ramos3@sansano.usm.cl',   '+56912345086', 'Analista',      'Industrial'),
(9, 24,2, 3, 'tomas.ibanez3@sansano.usm.cl',     '+56912345087', 'Documentador',  'Informática'),
(9, 25,2, 3, 'catalina.bravo3@sansano.usm.cl',   '+56912345088', 'Apoyo',         'Eléctrica');

-- Postulacion 10
INSERT INTO postulacion_persona (id_postulacion, id_persona, id_tipo_persona, id_sede, email, telefono, rol, departamento_area) VALUES
(10,3, 1, 1, 'carlos.jara3@usm.cl',             '+56912345091', 'Director',      'Matemáticas'),
(10,10,1, 1, 'lorena.fuentes2@usm.cl',           '+56912345092', 'Investigador',  'Informática'),
(10,1, 1, 1, 'juan.perez4@usm.cl',               '+56912345093', 'Asesor',        'Informática'),
(10,11,2, 1, 'ana.rios4@sansano.usm.cl',         '+56912345094', 'Desarrollador', 'Informática'),
(10,12,2, 1, 'luis.paz4@sansano.usm.cl',         '+56912345095', 'Tester',        'Informática'),
(10,16,2, 1, 'matias.vera4@sansano.usm.cl',      '+56912345096', 'Analista',      'Industrial'),
(10,17,2, 1, 'camila.torres4@sansano.usm.cl',    '+56912345097', 'Diseñador',     'Diseño'),
(10,21,2, 1, 'javiera.castro4@sansano.usm.cl',   '+56912345098', 'Apoyo',         'Eléctrica');

INSERT INTO cronograma (id_postulacion) VALUES (1),(2),(3),(4),(5),(6),(7),(8),(9),(10);

-- 1
INSERT INTO etapa (nombre, semanas, entregable, id_cronograma) VALUES
('Análisis de Requerimientos', 4,  'Documento de Requerimientos', 1),
('Desarrollo',                 12, 'Código Fuente v1.0',          1),
('Pruebas y QA',               4,  'Informe de Pruebas',          1);

-- 2
INSERT INTO etapa (nombre, semanas, entregable, id_cronograma) VALUES
('Levantamiento',              6,  'Informe de Diagnóstico',      2),
('Desarrollo Blockchain',      14, 'Prototipo Funcional',         2),
('Integración',                6,  'Sistema Integrado',           2),
('Cierre',                     4,  'Informe Final',               2);

-- 3
INSERT INTO etapa (nombre, semanas, entregable, id_cronograma) VALUES
('Análisis',                   4,  'Documento de Alcance',        3),
('Desarrollo App',             10, 'Aplicación Móvil Beta',       3),
('Testing',                    5,  'Informe de QA',               3),
('Despliegue',                 3,  'App publicada en stores',     3);

-- 4
INSERT INTO etapa (nombre, semanas, entregable, id_cronograma) VALUES
('Análisis Ambiental',         5,  'Línea Base Ambiental',        4),
('Implementación Sensores',    12, 'Red de Sensores Instalada',   4),
('Calibración y Pruebas',      6,  'Informe de Calibración',      4),
('Capacitación',               5,  'Manual de Usuario',           4);

-- 5
INSERT INTO etapa (nombre, semanas, entregable, id_cronograma) VALUES
('Diagnóstico PYME',           6,  'Informe de Diagnóstico',      5),
('Configuración RPA',          16, 'Flujos Automatizados',        5),
('Integración ERP',            8,  'Módulo Integrado',            5),
('Capacitación y Cierre',      6,  'Manual y Certificados',       5);

-- 6
INSERT INTO etapa (nombre, semanas, entregable, id_cronograma) VALUES
('Diseño Instruccional',       4,  'Diseño de Cursos',            6),
('Desarrollo LMS',             10, 'Plataforma E-learning',       6),
('Piloto y Ajustes',           4,  'Informe Piloto',              6);

-- 7
INSERT INTO etapa (nombre, semanas, entregable, id_cronograma) VALUES
('Recopilación de Datos',      5,  'Dataset Histórico Pesca',     7),
('Desarrollo Data Warehouse',  15, 'DW Implementado',             7),
('Modelos BI',                 8,  'Dashboards BI',               7),
('Validación con Expertos',    6,  'Informe de Validación',       7),
('Despliegue Productivo',      8,  'Sistema en Producción',       7);

-- 8
INSERT INTO etapa (nombre, semanas, entregable, id_cronograma) VALUES
('Auditoría de Seguridad',     6,  'Informe de Brechas',          8),
('Implementación SIEM',        14, 'SIEM Configurado',            8),
('Monitoreo OT/IT',            6,  'Alertas Configuradas',        8),
('Simulacro de Incidentes',    6,  'Informe Simulacro',           8),
('Cierre y Documentación',     8,  'Manual de Operaciones',       8);

-- 9
INSERT INTO etapa (nombre, semanas, entregable, id_cronograma) VALUES
('Diseño Portal',              4,  'Wireframes y Prototipos',     9),
('Desarrollo Frontend/Backend',8,  'Portal Funcional',            9),
('Integración Matching',       4,  'Algoritmo Implementado',      9),
('Lanzamiento',                4,  'Portal en Producción',        9);

-- 10
INSERT INTO etapa (nombre, semanas, entregable, id_cronograma) VALUES
('Adquisición de Datos',       4,  'Dataset de Sensores',         10),
('Entrenamiento Modelos',      12, 'Modelos Predictivos',         10),
('Integración SCADA',          10, 'Sistema Integrado',           10),
('Validación en Terreno',      6,  'Informe de Validación',       10),
('Documentación Final',        8,  'Manual Técnico y Operacional',10);

SELECT 'region' AS tabla, COUNT(*) AS total FROM region UNION ALL
SELECT 'sede',                COUNT(*) FROM sede UNION ALL
SELECT 'rol',                 COUNT(*) FROM rol UNION ALL
SELECT 'empresa',             COUNT(*) FROM empresa UNION ALL
SELECT 'postulacion',         COUNT(*) FROM postulacion UNION ALL
SELECT 'persona',             COUNT(*) FROM persona UNION ALL
SELECT 'postulacion_persona', COUNT(*) FROM postulacion_persona UNION ALL
SELECT 'cronograma',          COUNT(*) FROM cronograma UNION ALL
SELECT 'etapa',               COUNT(*) FROM etapa UNION ALL
SELECT 'usuario',             COUNT(*) FROM usuario;

-- =========================
-- VERIFICACIÓN DE CATÁLOGOS
-- =========================

SELECT * FROM region;
SELECT * FROM sede;
SELECT * FROM tamano_empresa;
SELECT * FROM estado_postulacion;
SELECT * FROM tipo_iniciativa;
SELECT * FROM tipo_persona;
SELECT * FROM rol;

-- =========================
-- VERIFICACIÓN DE ENTIDADES PRINCIPALES
-- =========================

SELECT * FROM empresa;
SELECT * FROM representante_empresa;
SELECT * FROM persona;
SELECT * FROM iniciativa;
SELECT * FROM postulacion;
SELECT * FROM postulacion_persona;
SELECT * FROM cronograma;
SELECT * FROM etapa;
SELECT * FROM usuario;

-- =========================
-- VERIFICACIÓN DE RELACIONES CLAVE
-- =========================

-- Empresa con su tamaño
SELECT e.nombre AS empresa, t.nombre AS tamano
FROM empresa e
JOIN tamano_empresa t ON e.id_tamano = t.id_tamano;

-- Representante por empresa
SELECT e.nombre AS empresa, r.nombre AS representante, r.email
FROM representante_empresa r
JOIN empresa e ON r.id_empresa = e.id_empresa;

-- Postulaciones con información completa
SELECT 
    p.codigo,
    i.nombre AS iniciativa,
    e.nombre AS empresa,
    s.nombre AS sede,
    re.nombre AS region_ejecucion,
    ri.nombre AS region_impacto,
    ep.nombre AS estado
FROM postulacion p
JOIN empresa e ON p.id_empresa = e.id_empresa
JOIN iniciativa i ON p.id_iniciativa = i.id_iniciativa
JOIN sede s ON p.id_sede = s.id_sede
JOIN region re ON p.id_region_ejecucion = re.id_region
JOIN region ri ON p.id_region_impacto = ri.id_region
JOIN estado_postulacion ep ON p.id_estado = ep.id_estado;

-- Integrantes por postulacion
SELECT 
    p.codigo,
    per.nombre AS persona,
    tp.nombre AS tipo_persona,
    pp.rol,
    pp.departamento_area
FROM postulacion_persona pp
JOIN postulacion p ON pp.id_postulacion = p.id_postulacion
JOIN persona per ON pp.id_persona = per.id_persona
JOIN tipo_persona tp ON pp.id_tipo_persona = tp.id_tipo_persona;

-- Cronograma con etapas
SELECT 
    p.codigo,
    et.nombre AS etapa,
    et.semanas,
    et.entregable
FROM etapa et
JOIN cronograma c ON et.id_cronograma = c.id_cronograma
JOIN postulacion p ON c.id_postulacion = p.id_postulacion;

-- =========================
-- NUEVAS VALIDACIONES (USUARIO + ROL)
-- =========================

-- Usuarios con su rol
SELECT 
    u.id_usuario,
    per.nombre AS persona,
    u.email,
    r.nombre AS rol
FROM usuario u
JOIN persona per ON u.id_persona = per.id_persona
JOIN rol r ON u.id_rol = r.id_rol;

-- Usuarios responsables (ejemplo funcional)
SELECT 
    per.nombre,
    u.email
FROM usuario u
JOIN persona per ON u.id_persona = per.id_persona
WHERE u.id_rol = 1;

-- Usuarios evaluadores
SELECT 
    per.nombre,
    u.email
FROM usuario u
JOIN persona per ON u.id_persona = per.id_persona
WHERE u.id_rol = 2;

-- Usuario administrador
SELECT 
    per.nombre,
    u.email
FROM usuario u
JOIN persona per ON u.id_persona = per.id_persona
WHERE u.id_rol = 3;

-- =========================
-- INTEGRACIÓN USUARIO - POSTULACIONES
-- =========================

-- Postulaciones donde participa un usuario (a través de persona)
SELECT 
    per.nombre AS usuario,
    u.email,
    p.codigo,
    pp.rol AS rol_en_proyecto
FROM usuario u
JOIN persona per ON u.id_persona = per.id_persona
JOIN postulacion_persona pp ON per.id_persona = pp.id_persona
JOIN postulacion p ON pp.id_postulacion = p.id_postulacion;