-- PRIMER EJERCICO
SELECT TOP (200) DisplayName, Location, Reputation
FROM Users
ORDER BY Reputation DESC;

-- SEGUNDO EJERCICIO
SELECT TOP (200) Posts.Title, Users.DisplayName
FROM Posts
INNER JOIN Users ON Posts.OwnerUserId = Users.Id
Where Posts.OwnerUserId IS NOT NULL AND Posts.Title IS NOT NULL;

-- TERCER EJERCICIO
--EXPLICITA
SELECT TOP (200) Users.DisplayName, AVG(Posts.Score) AS AverageScore
FROM Posts
INNER JOIN Users ON Posts.OwnerUserId = Users.Id
WHERE Posts.OwnerUserId IS NOT NULL
GROUP BY Users.DisplayName
ORDER BY AverageScore DESC;


-- CUARTO EJERCICIO
SELECT TOP (200) Users.DisplayName
FROM Users
WHERE Users.Id IN (
    SELECT Comments.UserId
    FROM Comments
    GROUP BY Comments.UserId
    HAVING COUNT(Comments.Id) > 100
)
ORDER BY Users.DisplayName, Users.Id;

-- QUINTO EJERCICIO
UPDATE Users
SET Location = 'Desconocido'
WHERE Location IS NULL OR Location = '';
-- Mostrar mensaje de confirmación
PRINT 'La actualización se realizó correctamente.';    

-- PODES VER
SELECT TOP (200) Id, DisplayName, Location
FROM Users
WHERE Location = 'Desconocido';


-- SEXTO EJERCICIO
-- Eliminar comentarios realizados por usuarios con menos de 100 de reputación
DELETE Comments
FROM Comments
JOIN Users ON Comments.UserId = Users.Id
WHERE Users.Reputation < 100;

-- Mostrar mensaje de confirmación con número de filas eliminadas
PRINT 'Número de comentarios eliminados: ' + CAST(@@ROWCOUNT AS NVARCHAR(10));



-- SEPTIMO EJERCICO
-- Seleccionar el DisplayName del usuario y contar el número de posts, comentarios y medallas
SELECT TOP 200
    u.DisplayName,
    (SELECT COUNT(*) FROM Posts WHERE OwnerUserId = u.Id) AS TotalPosts,
    (SELECT COUNT(*) FROM Comments WHERE UserId = u.Id) AS TotalComments,
    (SELECT COUNT(*) FROM Badges WHERE UserId = u.Id) AS TotalBadges
FROM 
    Users u
ORDER BY 
    TotalPosts DESC, u.DisplayName;

-- OCTAVO EJERCICIO
SELECT TOP 10
    Title,
    Score
FROM 
    Posts
WHERE 
    Title IS NOT NULL
ORDER BY 
    Score DESC

-- NOVENO EJERCICIO

SELECT TOP 5 Text, CreationDate
  FROM Comments
  ORDER BY 
    CreationDate DESC
