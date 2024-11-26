-- Premier besoin
/*Les employées peuvent installer/désinstaller des parcours*/


--Deuxième besoin (Fonction ET Vue)
/*Le gérant peut obtenir les profits du centre*/ 

CREATE OR ALTER FUNCTION fnCalculerProfitMensuel(@mois int)
RETURNS @ProfitMensuel TABLE (Mois int, Profit decimal)
AS
BEGIN;
	INSERT INTO @ProfitMensuel (Mois, Profit)
	SELECT DATEPART(MONTH, Transactions



-- Troisième besoin
/*Les ressources humaines peuvent créer des payes*/

-- Quatrième besoin
/*Les employees peuvent obtenir les parcours actifs. (VUE)*/

-- Cinquième besoin
/*Le DB admin peut faire quelque chose

