/* 1er traitement automatis� 
   - D�clencheur
   - D�clench� quand un parcours devient non install� (EstInstalle=0), il l'enl�ve aux client qui avaient ce parcours en cours.
*/



/* 2�me traitement automatis� 
   - Fonction
   - Une fonction qui permet de formatter une chaine de caract�res avec une majuscule au d�but et le reste en minuscule.
*/
	CREATE OR ALTER FUNCTION Capitaliser(@chaine nvarchar(256))
	RETURNS nvarchar(256)
	AS
	BEGIN;
		IF @chaine IS NULL OR @chaine = ''
			RETURN @chaine;
		RETURN CONCAT(UPPER(LEFT(@chaine, 1)), LOWER(SUBSTRING(@chaine, 2, LEN(@chaine) - 1)));
	END;


/* 3�me traitement automatis� 
   - Fonction
   - Une fonction qui permet de calculer le montant total de payes des employ�es par mois pour l'ann�e donn�e en param�tre sinon par d�faut l'ann�e actuelle.
*/
	CREATE OR ALTER FUNCTION fnCalculerPayesMensuelsDeAnnee(@Annee int = null)
	RETURNS @PayesMensuel TABLE (Mois nvarchar(20), Payes decimal)
	AS
	BEGIN;
		IF @Annee = null
		BEGIN 
			SET @Annee = YEAR(GETDATE())
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

/* 3�me traitement automatis� 
   - Fonction
   - Une fonction qui permet de calculer le montant total des revenu par mois pour l'ann�e donn�e en param�tre sinon par d�faut l'ann�e actuelle.
*/

	CREATE OR ALTER FUNCTION fnCalculerRevenuBrutMensuelsDeAnnee(@Annee int=null)
	RETURNS @RevenuBrutMensuelsDeAnnee TABLE (Mois nvarchar(20), RevenuBrut decimal)
	AS
	BEGIN;
		IF @Annee = null
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
