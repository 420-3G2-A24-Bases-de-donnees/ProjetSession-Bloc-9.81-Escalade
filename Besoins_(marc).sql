-- Premier besoin
/*Les employées peuvent installer/désinstaller des parcours*/


--Deuxième besoin (Fonction ET Vue) FAIT
/*Le gérant peut obtenir les profits du centre*/ 

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



GO
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


GO
-- VIEW qui permet d'Obtenir les profits du centre pour chaque mois 
CREATE OR ALTER VIEW ProfitsDuCentreParMoisDerniereAnnee
AS
	SELECT 
		dbo.Capitaliser(r.Mois) AS Mois,
		CONCAT(r.RevenuBrut - p.Payes, ' $') AS Profit
	FROM 
		fnCalculerRevenuBrutMensuelsDeAnnee(2024) r
	LEFT JOIN 
		fnCalculerPayesMensuelsDeAnnee(2024) p ON r.Mois = p.Mois;
GO
SELECT * FROM ProfitsDuCentreParMois

SELECT * FROM VISITEs INNER JOIN Transactions ON Visites.TransactionID = transactions.transactionID
GO
CREATE OR ALTER FUNCTION Capitaliser(@chaine nvarchar(256))
RETURNS nvarchar(256)
AS
BEGIN;
    IF @chaine IS NULL OR @chaine = ''
        RETURN @chaine;
    RETURN CONCAT(UPPER(LEFT(@chaine, 1)), LOWER(SUBSTRING(@chaine, 2, LEN(@chaine) - 1)));
END;

SELECT * FROM fnCalculerRevenuBrutMensuelsDeAnnee(2024)


		-- DÉCLENCHEUR
		-- à l'ajout d'un parcours mettre ACTIF

-- Troisième besoin
/*Les ressources humaines peuvent créer des payes*/

-- Quatrième besoin
/*Les employees peuvent obtenir les parcours actifs. (VUE)*/
--aussi avec colonne actif depuis quand


-- Cinquième besoin
/*Le DB admin peut faire quelque chose



-- DÉCLENCHEUR quand un parcours n'est pas installé, les client associé sont remis a aucun

obtenir le nombre de parcours par difficulté