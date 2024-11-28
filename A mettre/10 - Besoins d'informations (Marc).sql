/* 1er Besoin d’informations 
	- Vue
    - Le gérant peut afficher les profits du centre pour chaque mois dans la dernière année.
*/
	GO
	CREATE OR ALTER VIEW ProfitsDuCentreParMoisDerniereAnnee
	AS
		SELECT 
			dbo.Capitaliser(r.Mois) AS Mois,
			CONCAT(r.RevenuBrut - p.Payes, ' $') AS Profit
		FROM 
			dbo.fnCalculerRevenuBrutMensuelsDeAnnee(2024) r
		LEFT JOIN 
			dbo.fnCalculerPayesMensuelsDeAnnee(2024) p ON r.Mois = p.Mois;
	GO

	SELECT Mois, Profit AS [Profit ou perte] FROM ProfitsDuCentreParMoisDerniereAnnee

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
			
	SELECT [Nom des parcours actuellement installés] FROM AfficherParcoursActuellementInstalle ORDER BY [Nom des parcours actuellement installés] ASC



/* 3ème Besoin d’informations 
   - Vue
   - Les employées peuvent afficher la quantité de parcours créés pour chaque type. (le niveau de difficulté ce dit : V0 à V12, avec le 'V') 
*/
	GO
	CREATE OR ALTER VIEW AfficherQuantiteTypeParcoursCreee
	AS
		SELECT
			TypeDeParcours AS [Type de parcours],
			CONCAT('V', NiveauDifficulte) AS [Niveau de difficulté],
			COUNT(NomDuParcours) AS [Nombre de parcours]
		FROM 
			Parcours
		GROUP BY 
			NiveauDifficulte, TypeDeParcours
	GO

	SELECT [Type de parcours], [Niveau de difficulté], [Nombre de parcours] FROM AfficherQuantiteTypeParcoursCreee ORDER BY [Type de parcours] ASC

/* 4ème Besoin d’informations 
   - Vue
   - Les employées peuvent afficher la quantité de parcours créés pour chaque difficulté.
*/
	GO
	CREATE OR ALTER VIEW AfficherQuantiteParcoursParDifficulte
	AS
		SELECT
			CONCAT('V', FORMAT(NiveauDifficulte, '00')) AS [Niveau de difficulté],
			COUNT(NomDuParcours) AS [Nombre de parcours]
		FROM
			Parcours
		GROUP BY
			NiveauDifficulte
	GO

	SELECT [Niveau de difficulté], [Nombre de parcours] FROM AfficherQuantiteParcoursParDifficulte ORDER BY SUBSTRING([Niveau de difficulté], 2, LEN([Niveau de difficulté])) ASC

/* 5ème Besoin d’informations 
   - Vue
   - Le gérant peut afficher la liste des client qui ont visité le centre d'escalade dans la dernière année.
*/
	GO
	CREATE OR ALTER VIEW AfficherListeClientsAyantVisitesDerniereAnnee
	AS 
		SELECT 
			Prenom,
			Nom,
			FORMAT(MAX(HeureSortie), 'dd MMMM') AS  [Dernière visite]
		FROM
			Visites
		INNER JOIN
			Clients ON Visites.VisiteID = Clients.ClientID
		INNER JOIN
			Personnes ON Clients.ClientID = Personnes.PersonneID
		GROUP BY 
			Prenom,
			Nom
		HAVING
			DATEPART(YEAR, FORMAT(MAX(HeureSortie), 'yyyy-MM-dd')) = YEAR(GETDATE()) 
	GO

	SELECT Prenom, Nom, [Dernière visite] FROM AfficherListeClientsAyantVisitesDerniereAnnee