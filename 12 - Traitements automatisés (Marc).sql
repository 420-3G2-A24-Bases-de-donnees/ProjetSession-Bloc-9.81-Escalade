/* 1er traitement automatisé 
   - Déclencheur
   - Déclenché quand un parcours devient non installé (EstInstalle=0), il l'enlève aux client qui avaient ce parcours en cours.
*/
	GO
	CREATE TRIGGER MettreParcoursEnCoursClientNULL
	ON Parcours AFTER UPDATE
	AS
	BEGIN
		UPDATE Clients
		SET ParcoursEnCours = NULL
		WHERE ParcoursEnCours IN ( 
			SELECT ParcoursID 
			FROM inserted 
			WHERE inserted.EstInstalle = 0
		);
	END
	GO

	UPDATE Parcours
	SET EstInstalle = 0
	WHERE ParcoursID = 8 

/* 2ème traitement automatisé 
   - Fonction
   - Une fonction qui permet de formater une chaine de caractères avec une majuscule au début et le reste en minuscule.
*/
	GO
	CREATE OR ALTER FUNCTION Capitaliser(@chaine nvarchar(256))
	RETURNS nvarchar(256)
	AS
	BEGIN;
		IF @chaine IS NULL OR @chaine = ''
			RETURN @chaine;
		RETURN CONCAT(UPPER(LEFT(@chaine, 1)), LOWER(SUBSTRING(@chaine, 2, LEN(@chaine) - 1)));
	END;
	GO

	SELECT dbo.Capitaliser('aLlO') AS [Chaine formaté]


/* 3ème traitement automatisé 
   - Fonction
   - Une fonction qui permet de calculer le montant total de payes des employées par mois pour l'année donnée en paramètre sinon par défaut l'année actuelle.
*/
	GO
	CREATE OR ALTER FUNCTION fnCalculerPayesMensuelsDeAnnee(@Annee int = 0)
	RETURNS @PayesMensuel TABLE (Mois nvarchar(20), Payes decimal)
	AS
	BEGIN;
		IF @Annee = 0
		BEGIN 
			SET @Annee = DATEPART(YEAR, GETDATE())
		END
		INSERT INTO @PayesMensuel (Mois, Payes)
		SELECT 
			DATENAME(MONTH, DATEADD(MONTH, MONTH(DateTransaction) - 1, 0)) AS Mois,
			SUM(MontantTransaction) AS Payes
		FROM 
			Payes
		INNER JOIN 
			Transactions ON Payes.TransactionID = Transactions.TransactionID
		WHERE 
			YEAR(DateTransaction) = @Annee
		GROUP BY 
			MONTH(DateTransaction);
		DECLARE @mois int = 1;
		WHILE @mois <= 12
		BEGIN
			IF NOT EXISTS (SELECT 1 FROM @PayesMensuel WHERE Mois = DATENAME(MONTH, DATEADD(MONTH, @mois - 1, 0)))
			BEGIN
				INSERT INTO @PayesMensuel (Mois, Payes) VALUES (DATENAME(MONTH, DATEADD(MONTH, @mois - 1, 0)), 0);
			END
			SET @mois = @mois + 1;
		END
		RETURN
	END;
	Go

	SELECT Mois, Payes AS [Payes ($)] FROM fnCalculerPayesMensuelsDeAnnee(0)
	SELECT Mois, Payes AS [Payes ($)] FROM fnCalculerPayesMensuelsDeAnnee(2023)

/* 4ème traitement automatisé 
   - Fonction
   - Une fonction qui permet de calculer le montant total des revenu brut par mois pour l'année donnée en paramètre sinon par défaut l'année actuelle.
*/
	GO
	CREATE OR ALTER FUNCTION fnCalculerRevenuBrutMensuelsDeAnnee(@Annee int = 0)
	RETURNS @RevenuBrutMensuelsDeAnnee TABLE (Mois nvarchar(20), RevenuBrut decimal)
	AS
	BEGIN;
		IF @Annee = 0
		BEGIN
			SET @Annee = YEAR(GETDATE())
		END
		INSERT INTO @RevenuBrutMensuelsDeAnnee (Mois, RevenuBrut)
		SELECT 
			DATENAME(MONTH, DATEADD(MONTH, MONTH(DateTransaction) - 1, 0)) AS Mois,
			SUM(MontantTransaction) AS RevenuBrut
		FROM 
			Transactions
		WHERE 
			TransactionID NOT IN (SELECT TransactionID FROM Payes)
			AND YEAR(DateTransaction) = @Annee
		GROUP BY 
			MONTH(DateTransaction)
    
		DECLARE @mois int = 1;
		WHILE @mois <= 12
		BEGIN
			IF NOT EXISTS (SELECT 1 FROM @RevenuBrutMensuelsDeAnnee WHERE Mois = DATENAME(MONTH, DATEADD(MONTH, @mois - 1, 0)))
			BEGIN
				INSERT INTO @RevenuBrutMensuelsDeAnnee (Mois, RevenuBrut) VALUES (DATENAME(MONTH, DATEADD(MONTH, @mois - 1, 0)), 0);
			END
			SET @mois = @mois + 1;
		END
		RETURN
	END;
	GO

	SELECT Mois, RevenuBrut AS [RevenuBrut ($)] FROM fnCalculerRevenuBrutMensuelsDeAnnee(0)
	SELECT Mois, RevenuBrut AS [RevenuBrut ($)] FROM fnCalculerRevenuBrutMensuelsDeAnnee(2023)