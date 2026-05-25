USE ct_usm_postulaciones;

-- ============================================================
-- 1. VIEW: Vista resumen de postulaciones
--    Usada en la página principal (listado general y búsqueda)
-- ============================================================

CREATE OR REPLACE VIEW vista_postulaciones AS
SELECT
    p.id_postulacion,
    p.numero_postulacion,
    p.codigo,
    p.fecha,
    p.presupuesto_total,
    i.nombre                        AS iniciativa,
    e.nombre                        AS empresa,
    e.rut                           AS rut_empresa,
    te.nombre                       AS tamano_empresa,
    e.convenio_marco,
    s.nombre                        AS sede,
    re.nombre                       AS region_ejecucion,
    ri.nombre                       AS region_impacto,
    ti.nombre                       AS tipo_iniciativa,
    ep.nombre                       AS estado
FROM postulacion p
JOIN iniciativa          i   ON p.id_iniciativa        = i.id_iniciativa
JOIN empresa             e   ON p.id_empresa            = e.id_empresa
JOIN tamano_empresa      te  ON e.id_tamano             = te.id_tamano
JOIN sede                s   ON p.id_sede               = s.id_sede
JOIN region              re  ON p.id_region_ejecucion   = re.id_region
JOIN region              ri  ON p.id_region_impacto     = ri.id_region
JOIN tipo_iniciativa     ti  ON p.id_tipo_iniciativa    = ti.id_tipo
JOIN estado_postulacion  ep  ON p.id_estado             = ep.id_estado;

-- Ejemplo de uso (búsqueda por texto):
-- SELECT * FROM vista_postulaciones WHERE iniciativa LIKE '%IA%' OR empresa LIKE '%IA%' OR codigo LIKE '%IA%';


-- ============================================================
-- 2. FUNCTION: Calcula el total de semanas de un cronograma
--    Usada al mostrar el detalle del cronograma de una postulación
-- ============================================================

DELIMITER $$

CREATE FUNCTION total_semanas_postulacion(p_id_postulacion INT)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
    DECLARE total INT DEFAULT 0;

    SELECT COALESCE(SUM(et.semanas), 0)
    INTO total
    FROM etapa et
    JOIN cronograma c ON et.id_cronograma = c.id_cronograma
    WHERE c.id_postulacion = p_id_postulacion;

    RETURN total;
END$$

DELIMITER ;

-- Ejemplo de uso:
-- SELECT codigo, total_semanas_postulacion(id_postulacion) AS semanas_totales FROM postulacion;


-- ============================================================
-- 3. STORED PROCEDURE: Cambia el estado de una postulación
--    Usado por el Evaluador (ROL 2) al registrar una evaluación
-- ============================================================

DELIMITER $$

CREATE PROCEDURE cambiar_estado_postulacion(
    IN  p_id_postulacion  INT,
    IN  p_nuevo_estado    VARCHAR(50),
    OUT p_resultado       VARCHAR(100)
)
BEGIN
    DECLARE v_id_estado INT DEFAULT NULL;

    -- Buscar el id del estado por nombre
    SELECT id_estado INTO v_id_estado
    FROM estado_postulacion
    WHERE nombre = p_nuevo_estado
    LIMIT 1;

    IF v_id_estado IS NULL THEN
        SET p_resultado = 'ERROR: Estado no existe';
    ELSE
        UPDATE postulacion
        SET id_estado = v_id_estado
        WHERE id_postulacion = p_id_postulacion;

        IF ROW_COUNT() = 0 THEN
            SET p_resultado = 'ERROR: Postulacion no encontrada';
        ELSE
            SET p_resultado = CONCAT('OK: Estado actualizado a "', p_nuevo_estado, '"');
        END IF;
    END IF;
END$$

DELIMITER ;

-- Ejemplo de uso:
-- CALL cambiar_estado_postulacion(1, 'Aprobada', @res);
-- SELECT @res;


-- ============================================================
-- 4. TRIGGER: Registra en log cuando se cambia el estado
--             de una postulación (auditoría básica)
-- ============================================================

-- Tabla de log necesaria para el trigger
CREATE TABLE IF NOT EXISTS log_cambio_estado (
    id_log        INT AUTO_INCREMENT PRIMARY KEY,
    id_postulacion INT NOT NULL,
    estado_anterior VARCHAR(50),
    estado_nuevo    VARCHAR(50),
    fecha_cambio    DATETIME DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;

DELIMITER $$

CREATE TRIGGER trg_log_cambio_estado
AFTER UPDATE ON postulacion
FOR EACH ROW
BEGIN
    -- Solo registra si realmente cambió el estado
    IF OLD.id_estado <> NEW.id_estado THEN
        INSERT INTO log_cambio_estado (id_postulacion, estado_anterior, estado_nuevo)
        VALUES (
            NEW.id_postulacion,
            (SELECT nombre FROM estado_postulacion WHERE id_estado = OLD.id_estado),
            (SELECT nombre FROM estado_postulacion WHERE id_estado = NEW.id_estado)
        );
    END IF;
END$$

DELIMITER ;

-- Ejemplo de uso (el trigger se dispara automáticamente al hacer UPDATE):
-- CALL cambiar_estado_postulacion(1, 'Aprobada', @res);
-- SELECT * FROM log_cambio_estado;