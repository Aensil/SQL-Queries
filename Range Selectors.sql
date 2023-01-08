/**
  * RETO: Borrar registros duplicados
  */

-- Borrado de arreglo de ID por partición por todos los campos --
DELETE FROM platzi.alumnos
WHERE id IN
    (
	SELECT	id
	FROM (
		SELECT id,
		ROW_NUMBER() OVER(
			PARTITION BY
				nombre,
				apellido,
				email,
				colegiatura,
				fecha_incorporacion,
				carrera_id,
				tutor_id
			ORDER BY id asc
		) AS row
		FROM platzi.alumnos
	) duplicados
	WHERE duplicados.row > 1
);

/**
  * Rangos y solapes
  */

-- Ejemplos iniciales --
SELECT *
FROM platzi.alumnos
WHERE tutor_id IN (11,12,13,14,15,16,17,18,19,20);

SELECT *
FROM platzi.alumnos
WHERE tutor_id >= 1
    AND tutor_id <= 10;

SELECT *
FROM platzi.alumnos
WHERE tutor_id BETWEEN 1 AND 10;

-- ¿En rango? --
SELECT int4range(10, 20) @> 3;

-- ¿Se solapan? --
SELECT numrange(11.1, 22.2) && numrange(20.0, 30.0);

-- Obtener el límite superior --
SELECT upper(int8range(15, 25));
--LOWER

-- Calcular la intersección --
SELECT int4range(10, 20) * int4range(15, 25);

-- ¿Rango vacío?
SELECT isempty(numrange(1, 5));

-- Filtrar alumnos cuyo tutor_id esté entre 1 y 10 --
SELECT *
FROM platzi.alumnos
WHERE int4range(10, 20) @> tutor_id;

--Challange
SELECT *
FROM platzi.alumnos
WHERE tutor_id IN (
		SELECT carrera_id
		FROM platzi.alumnos
);
--WRONG