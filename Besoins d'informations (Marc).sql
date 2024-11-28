/* 1er Besoin d’informations 
	- Vue
    - Le gérant peut afficher les profits du centre pour chaque mois dans la dernière année.
*/
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

/* 2ème Besoin d’informations 
	- Vue
    - Les employées peuvent obtenir les parcours actifs.
*/
	GO
	CREATE OR ALTER VIEW AfficherParcoursActuellementInstalle
	AS
		SELECT 
			NomDuParcours AS [Nom des parcours actuellement installés]
		FROM 
			Parcours
		WHERE
			EstInstalle = 1
	GO
			
	SELECT * FROM AfficherParcoursActuellementInstalle ORDER BY [Nom des parcours actuellement installés] ASC



/* 3ème Besoin d’informations 
   - Vue
   - Les employées peuvent afficher la quantité de parcours créés pour chaque type. (le niveau de difficulté ce dit : V0 à V12, avec le 'V') 
*/
	GO
	CREATE OR ALTER VIEW AfficherQuantiteTypeParcoursCreee
	AS
		SELECT
			CONCAT('V', NiveauDifficulte) AS [Niveau de difficulté],
			TypeDeParcours AS [Type de parcours],
			COUNT(NomDuParcours) AS [Nombre de parcours]
		FROM 
			Parcours
		GROUP BY 
			NiveauDifficulte, TypeDeParcours
	GO

	SELECT * FROM AfficherQuantiteTypeParcoursCreee ORDER BY [Type de parcours] ASC

/* 4ème Besoin d’informations 
   - Vue
   - Les employées peuvent afficher la quantité de parcours créés pour chaque difficulté.
*/



/* 5ème Besoin d’informations 
   - Vue
   - Le gérant peut afficher la liste des client qui ont visité le centre d'escalade dans la dernière année.
*/