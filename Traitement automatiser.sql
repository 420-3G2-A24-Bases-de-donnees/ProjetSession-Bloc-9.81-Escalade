--Fonctions pour créer savoir les nombres de parcours utiliser
CREATE OR ALTER FUNCTION GetNBDeParcourUtiliser()
RETURNS @ParcoursUtiliser TABLE ([Parcours en cours] int, [Nombre de clients] int)
AS
BEGIN
	INSERT INTO @ParcoursUtiliser([Parcours en cours], [Nombre de clients])
	SELECT ParcoursEnCours, COUNT(*) FROM Clients INNER JOIN Parcours
	ON Clients.ParcoursEnCours = Parcours.ParcoursID
	WHERE EstInstalle = 1
	GROUP BY ParcoursEnCours
	RETURN
END

SELECT * FROM GetNBDeParcourUtiliser()