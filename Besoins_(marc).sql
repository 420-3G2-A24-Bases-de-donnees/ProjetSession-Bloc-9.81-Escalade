-- Premier besoin
/*Les employ�es peuvent installer/d�sinstaller des parcours*/


--Deuxi�me besoin (Fonction ET Vue)
/*Le g�rant peut obtenir les profits du centre*/ 

CREATE OR ALTER FUNCTION fnCalculerProfitMensuel(@mois int)
RETURNS @ProfitMensuel TABLE (Mois int, Profit decimal)
AS
BEGIN;
	INSERT INTO @ProfitMensuel (Mois, Profit)
	SELECT DATEPART(MONTH, Transactions



-- Troisi�me besoin
/*Les ressources humaines peuvent cr�er des payes*/

-- Quatri�me besoin
/*Les employees peuvent obtenir les parcours actifs. (VUE)*/

-- Cinqui�me besoin
/*Le DB admin peut faire quelque chose

