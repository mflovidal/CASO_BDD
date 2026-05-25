CREATE DATABASE IF NOT EXISTS ct_usm_postulaciones;
USE ct_usm_postulaciones;

-- catalogos base (no tienen dependencias)
CREATE TABLE sede (
    id_sede INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE region (
    id_region INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE tamano_empresa (
    id_tamano INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE tipo_iniciativa (
    id_tipo INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE tipo_persona (
    id_tipo_persona INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE estado_postulacion (
    id_estado INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE rol (
    id_rol INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50)
) ENGINE=InnoDB;

-- Si se elimina el tamaño de empresa, se elimina la empresa asociada
CREATE TABLE empresa (
    id_empresa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    rut VARCHAR(20) NOT NULL UNIQUE,
    convenio_marco TINYINT(1) NOT NULL,
    id_tamano INT NOT NULL,
    FOREIGN KEY (id_tamano) REFERENCES tamano_empresa(id_tamano) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- si se elimina la empresa, se eliminan sus representantes
CREATE TABLE representante_empresa (
    id_representante INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    id_empresa INT NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE iniciativa (
    id_iniciativa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    objetivo VARCHAR(255) NOT NULL,
    descripcion_soluciones VARCHAR(255) NOT NULL,
    resultados_esperados VARCHAR(255) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE persona (
    id_persona INT AUTO_INCREMENT PRIMARY KEY,
    rut VARCHAR(20) NOT NULL UNIQUE,
    nombre VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

-- si se elimina una postulacion, se eliminan sus registros relacionados
CREATE TABLE postulacion (
    id_postulacion INT AUTO_INCREMENT PRIMARY KEY,
    numero_postulacion INT NOT NULL UNIQUE,
    codigo VARCHAR(50) NOT NULL UNIQUE,
    fecha DATE NOT NULL,
    presupuesto_total DECIMAL(12,2) NOT NULL,
    id_empresa INT NOT NULL,
    id_sede INT NOT NULL,
    id_region_ejecucion INT NOT NULL,
    id_region_impacto INT NOT NULL,
    id_tipo_iniciativa INT NOT NULL,
    id_estado INT NOT NULL,
    id_iniciativa INT NOT NULL,
    FOREIGN KEY (id_empresa) REFERENCES empresa(id_empresa) ON DELETE RESTRICT,
    FOREIGN KEY (id_sede) REFERENCES sede(id_sede) ON DELETE RESTRICT,
    FOREIGN KEY (id_region_ejecucion) REFERENCES region(id_region) ON DELETE RESTRICT,
    FOREIGN KEY (id_region_impacto) REFERENCES region(id_region) ON DELETE RESTRICT,
    FOREIGN KEY (id_tipo_iniciativa) REFERENCES tipo_iniciativa(id_tipo) ON DELETE RESTRICT,
    FOREIGN KEY (id_estado) REFERENCES estado_postulacion(id_estado) ON DELETE RESTRICT,
    FOREIGN KEY (id_iniciativa) REFERENCES iniciativa(id_iniciativa) ON DELETE CASCADE
) ENGINE=InnoDB;

-- l eliminar una postulacion o persona, se elimina su participación
CREATE TABLE postulacion_persona (
    id_postulacion INT NOT NULL,
    id_persona INT NOT NULL,
    id_tipo_persona INT NOT NULL,
    id_sede INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    telefono VARCHAR(20),
    rol VARCHAR(100) NOT NULL,
    departamento_area VARCHAR(100),
    PRIMARY KEY (id_postulacion, id_persona),
    FOREIGN KEY (id_postulacion) REFERENCES postulacion(id_postulacion) ON DELETE CASCADE,
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE,
    FOREIGN KEY (id_tipo_persona) REFERENCES tipo_persona(id_tipo_persona) ON DELETE RESTRICT,
    FOREIGN KEY (id_sede) REFERENCES sede(id_sede) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- El cronograma depende de la postulacion
CREATE TABLE cronograma (
    id_cronograma INT AUTO_INCREMENT PRIMARY KEY,
    id_postulacion INT NOT NULL,
    FOREIGN KEY (id_postulacion) REFERENCES postulacion(id_postulacion) ON DELETE CASCADE
) ENGINE=InnoDB;

-- Las etapas dependen del cronograma
CREATE TABLE etapa (
    id_etapa INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    semanas INT NOT NULL,
    entregable VARCHAR(255) NOT NULL,
    id_cronograma INT NOT NULL,
    FOREIGN KEY (id_cronograma) REFERENCES cronograma(id_cronograma) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE usuario (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    id_persona INT UNIQUE,
    email VARCHAR(100),
    contraseña VARCHAR(100),
    id_rol INT,
    FOREIGN KEY (id_persona) REFERENCES persona(id_persona) ON DELETE CASCADE,
    FOREIGN KEY (id_rol) REFERENCES rol(id_rol) ON DELETE RESTRICT
) ENGINE=InnoDB;

-- Un evaluador puede ser asignado a una o más postulaciones
CREATE TABLE asignacion_evaluador (
    id_asignacion INT AUTO_INCREMENT PRIMARY KEY,
    id_postulacion INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_asignacion DATE NOT NULL DEFAULT (CURDATE()),
    FOREIGN KEY (id_postulacion) REFERENCES postulacion(id_postulacion) ON DELETE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario) ON DELETE CASCADE
) ENGINE=InnoDB;