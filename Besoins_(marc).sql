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
