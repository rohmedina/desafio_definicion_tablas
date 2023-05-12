-- 1. Crear una base de datos llamada películas.
create database bbdd_peliculas;

-- 2. Cargar ambos archivos a su tabla correspondiente y aplicar el truncado de estas.

-- Se cargan archivos scv

-- Visualizar las tablas agregadas

select *
from peliculas p
;

select *
from reparto r
;


-- 3. Obtener el ID de la película “Titanic”.

select p.id
from peliculas p
where p.pelicula = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic".

SELECT reparto.column2
FROM reparto
 JOIN peliculas ON reparto.column1 = peliculas.id
WHERE peliculas.pelicula = 'Titanic';


-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford.

SELECT COUNT(*) AS total_peliculas
FROM reparto
 JOIN peliculas ON reparto.column1  = peliculas.id
WHERE reparto.column2 = 'Harrison Ford';


-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente.
SELECT pelicula
FROM peliculas
WHERE "Año estreno" BETWEEN 1990 AND 1999
ORDER BY peliculas ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”.

SELECT peliculas 
AS pelicula, LENGTH(pelicula) 
AS longitud_titulo
FROM peliculas;


-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.

SELECT MAX(LENGTH(pelicula)) AS longitud_maxima
FROM peliculas;

-- Si quiero saber cual es la pelicula y el Id

SELECT id, pelicula, LENGTH(pelicula) AS longitud
FROM peliculas
WHERE LENGTH(pelicula) = (
    SELECT MAX(LENGTH(pelicula))
FROM peliculas
);