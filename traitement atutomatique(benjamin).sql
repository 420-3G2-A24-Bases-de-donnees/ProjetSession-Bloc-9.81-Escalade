USE [Bloc_9.81]
GO

/*1er traitement automatique (Fonction)
--Les employers peuvent savoir quel parcours sont utiliser par des clients et combien l'utilise
*/
	CREATE OR ALTER FUNCTION GetNBDeParcourUtiliser()
		RETURNS @ParcoursUtiliser TABLE ([Parcours en cours] int, [Nombre de clients] int)
	AS
	BEGIN
		INSERT INTO @ParcoursUtiliser([Parcours en cours], [Nombre de clients])
		SELECT
			ParcoursEnCours, 
			COUNT(*) 
		FROM Clients 
			INNER JOIN Parcours
				ON Clients.ParcoursEnCours = Parcours.ParcoursID
			WHERE EstInstalle = 1
			GROUP BY ParcoursEnCours
		RETURN
	END

	SELECT * FROM GetNBDeParcourUtiliser()
/*2e traitement automatique (Déclancheur)
--Lorsque qu'un employer installer un nouveaux parcours il est directement installer sur le murs (EstInstaller = 1) et renvoit un message d'erreur si le max est atteint
*/

/*3e traitement automatique (Procèdure sctoké)
--Permet à un employer de désintaller un ancient parcours (EstInstaller = 0)
*/