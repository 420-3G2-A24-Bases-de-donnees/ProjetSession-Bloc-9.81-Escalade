USE [Bloc_9.81]
GO

/*1er traitement automatique (Fonction)
--Les employers peuvent savoir quel parcours sont utiliser par des clients et combien l'utilise
*/
	GO
	CREATE OR ALTER FUNCTION GetNBDeParcourUtiliser()
		RETURNS @ParcoursUtilisé TABLE ([Parcours en cours] int, [Nombre de clients] int)
	AS
	BEGIN
		INSERT INTO @ParcoursUtilisé([Parcours en cours], [Nombre de clients])
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
	GO

	SELECT * FROM GetNBDeParcourUtiliser()
/*2e traitement automatique (Déclancheur)
--Lorsque qu'un employer installe un nouveau parcours il est directement installer sur le murs (EstInstaller = 1) ou renvoit un message d'erreur si le max est atteint
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

	--Celui qui marche
	SET IDENTITY_INSERT Parcours ON
	INSERT INTO Parcours (ParcoursID, NomDuParcours, NiveauDifficulte, TypeDeParcours, EstInstalle)
	VALUES
	(555, 'Jurassic Parc', 7, 'Dino', 1)

	--Celui qui ne va pas marcher
	SET IDENTITY_INSERT Parcours ON
	INSERT INTO Parcours (ParcoursID, NomDuParcours, NiveauDifficulte, TypeDeParcours, EstInstalle)
	VALUES
	(556, 'la pause de l olympe', 12, 'Bouldering', 1)


/*3e traitement automatique (Procèdure stockée)
--Permet à un employée de désintaller un ancient parcours (EstInstaller = 0)
*/

	GO
	CREATE PROCEDURE DesintallerParcours
	(
		@ParcoursID int
	)
	AS
	BEGIN
		IF @ParcoursID != NULL
			UPDATE Parcours
			SET EstInstalle = 0
			WHERE ParcoursID = @ParcoursID
			PRINT('Parcours désinstallé !')
		END

	EXEC DesintallerParcours
		@ParcoursID = 0
