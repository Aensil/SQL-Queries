-- Obtener el número de tupla sin un orden en particular --
SELECT ROW_NUMBER() OVER() AS row_id, *
FROM platzi.alumnos;

-- Obtener el número de tupla cuando ordenamos por fecha de incorporacion --
SELECT ROW_NUMBER() OVER(ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

-- Obtener el valor de un atributo de la primera tupla del window frame actual (global por default) --
SELECT FIRST_VALUE(colegiatura) OVER() AS row_id, *
FROM platzi.alumnos;

-- Obtener el valor de un atributo de la primera tupla del window frame actual --
-- La colegiatura de la persona que se inscribió primero por carrera --
SELECT FIRST_VALUE(colegiatura) OVER(PARTITION BY carrera_id ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

-- Obtener el valor de un atributo de la ultima tupla del window frame actual --
-- La colegiatura de la persona que se inscribió al final por carrera --
SELECT LAST_VALUE(colegiatura) OVER(PARTITION BY carrera_id ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

-- Obtener el valor de un atributo de la tupla numero n = 3 del window frame actual --
-- La colegiatura de la persona que se inscribió en lugar 3 por carrera --
SELECT nth_value(colegiatura, 3) OVER(PARTITION BY carrera_id ORDER BY fecha_incorporacion) AS row_id, *
FROM platzi.alumnos;

-- Rank Simple: Por cada elemento cuenta 1 generando espacios en el rank --
SELECT 	*,
		RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
FROM	platzi.alumnos
ORDER BY carrera_id, brand_rank;

-- Rank Simple: Por cada grupo de lementos iguales cuenta 1 generando rank "denso" --
SELECT 	*,
		DENSE_RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura DESC) AS brand_rank
FROM	platzi.alumnos
ORDER BY carrera_id, brand_rank;

-- Percent Rank: Genera una distribución percentual siguiendo la fórmula (rank - 1) / (total rows - 1) --
SELECT 	*,
		PERCENT_RANK() OVER (PARTITION BY carrera_id ORDER BY colegiatura ASC) AS brand_rank
FROM	platzi.alumnos
ORDER BY carrera_id, brand_rank;

