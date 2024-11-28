/* 1er Besoin d�informations 
	- Vue
    - Le g�rant peut afficher les profits du centre pour chaque mois dans la derni�re ann�e.
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
			
	SELECT [Nom des parcours actuellement install�s] FROM AfficherParcoursActuellementInstalle ORDER BY [Nom des parcours actuellement install�s] ASC



/* 3�me Besoin d�informations 
   - Vue
   - Les employ�es peuvent afficher la quantit� de parcours cr��s pour chaque type. (le niveau de difficult� ce dit : V0 � V12, avec le 'V') 
*/
	GO
	CREATE OR ALTER VIEW AfficherQuantiteTypeParcoursCreee
	AS
		SELECT
			TypeDeParcours AS [Type de parcours],
			CONCAT('V', NiveauDifficulte) AS [Niveau de difficult�],
			COUNT(NomDuParcours) AS [Nombre de parcours]
		FROM 
			Parcours
		GROUP BY 
			NiveauDifficulte, TypeDeParcours
	GO

	SELECT [Type de parcours], [Niveau de difficult�], [Nombre de parcours] FROM AfficherQuantiteTypeParcoursCreee ORDER BY [Type de parcours] ASC

/* 4�me Besoin d�informations 
   - Vue
   - Les employ�es peuvent afficher la quantit� de parcours cr��s pour chaque difficult�.
*/
	GO
	CREATE OR ALTER VIEW AfficherQuantiteParcoursParDifficulte
	AS
		SELECT
			CONCAT('V', FORMAT(NiveauDifficulte, '00')) AS [Niveau de difficult�],
			COUNT(NomDuParcours) AS [Nombre de parcours]
		FROM
			Parcours
		GROUP BY
			NiveauDifficulte
	GO

	SELECT [Niveau de difficult�], [Nombre de parcours] FROM AfficherQuantiteParcoursParDifficulte ORDER BY SUBSTRING([Niveau de difficult�], 2, LEN([Niveau de difficult�])) ASC

/* 5�me Besoin d�informations 
   - Vue
   - Le g�rant peut afficher la liste des client qui ont visit� le centre d'escalade dans la derni�re ann�e.
*/
	GO
	CREATE OR ALTER VIEW AfficherListeClientsAyantVisitesDerniereAnnee
	AS 
		SELECT 
			Prenom,
			Nom,
			FORMAT(MAX(HeureSortie), 'dd MMMM') AS  [Derni�re visite]
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

	SELECT Prenom, Nom, [Derni�re visite] FROM AfficherListeClientsAyantVisitesDerniereAnnee