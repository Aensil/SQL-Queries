-- Extract --
SELECT *
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2018
	AND (EXTRACT(MONTH FROM fecha_incorporacion)) = 5;

-- Subquery Date_Part --
SELECT	*
FROM (
	SELECT	*,
			DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
			DATE_PART('MONTH', fecha_incorporacion) AS mes_incorporacion
	FROM platzi.alumnos
) AS alumnos_con_anio_mes
WHERE	anio_incorporacion = 2018
	AND	mes_incorporacion = 5;

/**
  * Delete duplicates from table
  */

/**
  ADD a duplicate with the code:
  
  insert into platzi.alumnos (id, nombre, apellido, email, colegiatura, fecha_incorporacion, carrera_id, tutor_id) 
  values (1001, 'Pamelina', null, 'pmylchreestrr@salon.com', 4800, '2020-04-26 10:18:51', 12, 16)
  */

-- Subquery by id --
SELECT	*
FROM 	platzi.alumnos AS ou
WHERE (
	SELECT	COUNT(*)
	FROM	platzi.alumnos AS inr
	WHERE	inr.id = ou.id
) > 1;

-- Hash text --
SELECT (platzi.alumnos.*)::text, COUNT(*)
FROM platzi.alumnos
GROUP BY platzi.alumnos.*
HAVING COUNT(*) > 1;

-- Hash excluyendo ID --

-- ::text Becomes everything to text
SELECT (
	platzi.alumnos.nombre,
	platzi.alumnos.apellido,
	platzi.alumnos.email,
	platzi.alumnos.colegiatura,
	platzi.alumnos.fecha_incorporacion,
	platzi.alumnos.carrera_id,
	platzi.alumnos.tutor_id
)::text, COUNT(*)
FROM platzi.alumnos
GROUP BY platzi.alumnos.nombre,
	platzi.alumnos.apellido,
	platzi.alumnos.email,
	platzi.alumnos.colegiatura,
	platzi.alumnos.fecha_incorporacion,
	platzi.alumnos.carrera_id,
	platzi.alumnos.tutor_id
HAVING COUNT(*) > 1;

-- Partición por todos los campos excepto ID --
SELECT	*
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
	) AS row,
	*
	FROM platzi.alumnos
) AS duplicados
WHERE duplicados.row > 1;