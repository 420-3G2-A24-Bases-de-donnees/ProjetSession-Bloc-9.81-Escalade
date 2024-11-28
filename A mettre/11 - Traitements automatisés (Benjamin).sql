USE [Bloc_9.81]
GO

/*1er traitement automatique (Fonction)
--Les employers peuvent savoir quel parcours sont utiliser par des clients et combien l'utilise
*/
	GO
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
	GO
	CREATE TRIGGER LimiteParcours
	ON Parcours
	INSTEAD OF INSERT
	AS
	BEGIN
		IF (SELECT COUNT(*) FROM Parcours WHERE EstInstalle = 1) <= 50
			BEGIN
			INSERT INTO  Parcours(ParcoursID, NomDuParcours, NiveauDifficulte, TypeDeParcours, EstInstalle)
			SELECT
				ParcoursID, NomDuParcours, NiveauDifficulte, TypeDeParcours, EstInstalle 
			FROM inserted
			END
		ELSE
			BEGIN
				RAISERROR('Le maximum de parcours (50) est atteint.', 16, 1);
			END
	END

	SET IDENTITY_INSERT Parcours ON
	INSERT INTO Parcours (NomDuParcours, NiveauDifficulte, TypeDeParcours, EstInstalle)
	VALUES
	('Jurassic Parc', 7, 'Dino', 1)


/*3e traitement automatique (Procèdure sctoké)
--Permet à un employer de désintaller un ancient parcours (EstInstaller = 0)
*/

	GO
	CREATE PROCEDURE DesintallerParcours
	(
		@ParcoursID int,
		@EstInstalle bit
	)
	AS
	BEGIN
		IF @EstInstalle = 1
			UPDATE Parcours
			SET EstInstalle = 0
			WHERE ParcoursID = @ParcoursID
			PRINT('Désintallation au mur du parcours demandé.')
		END

	EXEC DesintallerParcours
		@ParcoursID = 0,
		@EstInstalle = 1