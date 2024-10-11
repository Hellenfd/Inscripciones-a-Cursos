INSERT INTO estudiantes (id, nombre, edad) VALUES 
(1, 'Ana Gómez', 20),
(2, 'Carlos Díaz', 22),
(3, 'María López', 21),
(4, 'Pedro Jiménez', 23),
(5, 'Lucía Fernández', 19);

INSERT INTO cursos (id, nombre, duracion) VALUES 
(1, 'Matemáticas', 3),
(2, 'Historia', 2),
(3, 'Inglés', 4),
(4, 'Biología', 3);

INSERT INTO inscripciones (id_estudiantes, id_cursos) VALUES 
(1, 1), (1, 2), -- Ana Gómez inscrita en Matemáticas y Historia
(2, 1), (2, 3), -- Carlos Díaz inscrito en Matemáticas e Inglés
(3, 2), (3, 4), -- María López inscrita en Historia y Biología
(4, 1), (4, 4); -- Pedro Jiménez inscrito en Matemáticas y Biología

SELECT estudiantes.nombre AS estudiante, cursos.nombre AS curso
FROM estudiantes 
JOIN inscripciones  ON estudiantes.id = inscripciones.id_estudiantes
JOIN cursos ON inscripciones.id_cursos = cursos.id;

SELECT estudiantes.nombre AS estudiante
FROM estudiantes 
JOIN inscripciones ON estudiantes.id = inscripciones.id_estudiantes
JOIN cursos ON inscripciones.id_cursos = cursos.id
WHERE cursos.nombre = 'Matemáticas';

SELECT cursos.nombre AS curso
FROM cursos
JOIN inscripciones ON cursos.id = inscripciones.id_cursos
JOIN estudiantes ON inscripciones.id_estudiantes = estudiantes.id
WHERE estudiantes.nombre = 'Ana Gómez';

SELECT cursos.nombre AS curso, COUNT(inscripciones.id_estudiantes) AS numero_estudiantes
FROM cursos
LEFT JOIN inscripciones ON cursos.id = inscripciones.id_cursos
GROUP BY cursos.nombre;

SELECT nombre AS estudiante
FROM estudiantes
WHERE id NOT IN (SELECT id_estudiantes FROM inscripciones);

