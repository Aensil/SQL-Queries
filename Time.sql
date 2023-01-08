-- Not in subquery --
SELECT  *
FROM platzi.alumnos
WHERE id NOT IN (
    SELECT id
    FROM platzi.alumnos
    WHERE tutor_id = 30
);

/**
  * Get part of a DAY
  */

-- Con EXTRACT --
SELECT EXTRACT(YEAR FROM fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

-- Con DATE_PART --
SELECT DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
FROM platzi.alumnos;

SELECT  DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
        DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion,
        DATE_PART('DAY', fecha_incorporacion) AS dia_incorporacion,
		DATE_PART('HOUR', fecha_incorporacion) AS hour_incorporacion,
		DATE_PART('SECOND', fecha_incorporacion) AS segundo_incorporacion
FROM platzi.alumnos;

