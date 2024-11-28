/* 1er Besoin d�informations 
	- Vue
    - Le g�rant peut afficher les profits du centre pour chaque mois dans la derni�re ann�e.
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

/* 2�me Besoin d�informations 
	- Vue
    - Les employ�es peuvent obtenir les parcours actifs.
*/
	GO
	CREATE OR ALTER VIEW AfficherParcoursActuellementInstalle
	AS
		SELECT 
			NomDuParcours AS [Nom des parcours actuellement install�s]
		FROM 
			Parcours
		WHERE
			EstInstalle = 1
	GO
			
	SELECT * FROM AfficherParcoursActuellementInstalle ORDER BY [Nom des parcours actuellement install�s] ASC



/* 3�me Besoin d�informations 
   - Vue
   - Les employ�es peuvent afficher la quantit� de parcours cr��s pour chaque type. (le niveau de difficult� ce dit : V0 � V12, avec le 'V') 
*/
	GO
	CREATE OR ALTER VIEW AfficherQuantiteTypeParcoursCreee
	AS
		SELECT
			CONCAT('V', NiveauDifficulte) AS [Niveau de difficult�],
			TypeDeParcours AS [Type de parcours],
			COUNT(NomDuParcours) AS [Nombre de parcours]
		FROM 
			Parcours
		GROUP BY 
			NiveauDifficulte, TypeDeParcours
	GO

	SELECT * FROM AfficherQuantiteTypeParcoursCreee ORDER BY [Type de parcours] ASC

/* 4�me Besoin d�informations 
   - Vue
   - Les employ�es peuvent afficher la quantit� de parcours cr��s pour chaque difficult�.
*/



/* 5�me Besoin d�informations 
   - Vue
   - Le g�rant peut afficher la liste des client qui ont visit� le centre d'escalade dans la derni�re ann�e.
*/