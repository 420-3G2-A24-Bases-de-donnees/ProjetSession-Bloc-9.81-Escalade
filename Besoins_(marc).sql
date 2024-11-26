-- Premier besoin
/*Les employées peuvent installer/désinstaller des parcours*/


--Deuxième besoin (Fonction ET Vue)
/*Le gérant peut obtenir les profits du centre*/ 

CREATE OR ALTER FUNCTION fnCalculerRevenuBrutMensuel()
RETURNS @RevenuBrutMensuels TABLE (Mois nvarchar(20), RevenuBrut decimal)
AS
BEGIN;
	INSERT INTO @RevenuBrutMensuels (Mois, RevenuBrut)
    SELECT 
        DATENAME(MONTH, DATEADD(MONTH, MONTH(DateTransaction) - 1, 0)) AS Mois,
        SUM(MontantTransaction) AS RevenuBrut
    FROM 
        Transactions
    WHERE 
        TransactionID NOT IN (SELECT TransactionID FROM Payes)
    GROUP BY 
        MONTH(DateTransaction)
    
    DECLARE @mois int = 1;
    WHILE @mois <= 12
    BEGIN
        IF NOT EXISTS (SELECT 1 FROM @RevenuBrutMensuels WHERE Mois = DATENAME(MONTH, DATEADD(MONTH, @mois - 1, 0)))
        BEGIN
            INSERT INTO @RevenuBrutMensuels (Mois, RevenuBrut) VALUES (DATENAME(MONTH, DATEADD(MONTH, @mois - 1, 0)), 0);
        END
        SET @mois = @mois + 1;
    END
    RETURN
END;

GO
CREATE OR ALTER FUNCTION fnCalculerPayesMensuel()
RETURNS @PayesMensuel TABLE (Mois nvarchar(20), Payes decimal)
AS
BEGIN;
    INSERT INTO @PayesMensuel (Mois, Payes)
    SELECT 
        DATENAME(MONTH, DATEADD(MONTH, MONTH(DateTransaction) - 1, 0)) AS Mois,
        SUM(MontantTransaction) AS Payes
    FROM 
        Payes
	INNER JOIN 
        Transactions ON Payes.TransactionID = Transactions.TransactionID
    GROUP BY 
        MONTH(DateTransaction)
    
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
CREATE OR ALTER VIEW ProfitsDuCentreParMois
AS
	SELECT 
		r.Mois,
		FORMAT(r.RevenuBrut - p.Payes, 'C', 'fr-CA') AS Profit
	FROM 
		fnCalculerRevenuBrutMensuel() r
	LEFT JOIN 
		fnCalculerPayesMensuel() p ON r.Mois = p.Mois;
GO


SELECT * FROM ProfitsDuCentreParMois


-- Troisième besoin
/*Les ressources humaines peuvent créer des payes*/

-- Quatrième besoin
/*Les employees peuvent obtenir les parcours actifs. (VUE)*/

-- Cinquième besoin
/*Le DB admin peut faire quelque chose

