/**
  * Filtrar los alumnos que se inscribieron en 2019
  */

-- Filtro EXTRACT --
SELECT *
FROM platzi.alumnos
WHERE (EXTRACT(YEAR FROM fecha_incorporacion)) = 2020;

-- Filtro DATE_PART --
SELECT *
FROM platzi.alumnos
WHERE (DATE_PART('YEAR', fecha_incorporacion)) = 2019;

-- Filtro subquery DATE_PART --
SELECT	*
FROM (
	SELECT	*,
			DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion
	FROM platzi.alumnos
) AS alumnos_con_anio_mes
WHERE	anio_incorporacion = 2019;

--Challengue
SELECT	*
FROM (
	SELECT	*,
			DATE_PART('YEAR', fecha_incorporacion) AS anio_incorporacion,
			DATE_PART('MONTH', fecha_incorporacion) AS Month_incorporacion
	FROM platzi.alumnos
) AS alumnos_con_anio_mes
WHERE	(anio_incorporacion = 2019) AND (Month_incorporacion = 5);