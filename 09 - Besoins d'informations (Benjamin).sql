USE [Bloc_9.81]
GO

/*1er Besoin d'information 
-- Les employer peuvent afficher les informations des clients actifs 
*/
	SELECT 
		Prenom, 
		Nom, 
		Email, 
		ParcoursEnCours 
	FROM Clients
		INNER JOIN Personnes
			ON Clients.PersonneID = Personnes.PersonneID
		WHERE ClientEstActif = 1

/*2e Besoin d'information (VUE)
--L'employer peut afficher les infos des parcours.
*/
	GO
	CREATE OR ALTER VIEW InfoParcoursActif
	AS
	SELECT 
		NiveauDifficulte AS [Niveau de difficulté], 
		NomDuParcours AS [Nom du parcours], 
		TypeDeParcours AS [Type du parcours], 
		CASE 
			WHEN EstInstalle = 1 THEN 'oui'
			ELSE 'non'
		END AS [Le parcours est installé]
	FROM Parcours;
	GO

	SELECT * FROM InfoParcoursActif

/*3e Besoin d'information 
--Le gérant peut afficher les infos important des employées
*/
	GO
	CREATE OR ALTER VIEW AfficherInfosDesEmployees
	AS
		SELECT 
			Prenom + ' ' + nom AS [Nom employee], 
			FORMAT(DateEngagement, 'yyyy-MM-dd') AS [Date d'engagement], 
			TauxHoraire 
		FROM Employees 
			INNER JOIN Personnes
				ON Employees.PersonneID = Personnes.PersonneID
	GO

	SELECT * FROM AfficherInfosDesEmployees ORDER BY [Date d'engagement]

/*4e Besoin d'information
--Le gérant peut obtenir la première visite de chaque clients
*/
	SELECT 
		Prenom + ' ' + nom AS [Nom personne], 
		(FORMAT(MIN(HeureEntree), 'yyyy-MM-dd')) AS [La première visite]
	FROM Personnes
		INNER JOIN Clients
			ON Personnes.PersonneID = Clients.PersonneID
		INNER JOIN Visites
			ON Clients.ClientID = Visites.ClientID
		GROUP BY Prenom, Nom
		ORDER BY [La première visite]

/*5e Besoin d'information (VUE)
--Les employées peuvent savoir le nombre de temps que le client est en visite
*/
	GO
	CREATE OR ALTER VIEW AfficherTempsVisiteClient
	AS
	SELECT 
		FORMAT(HeureEntree, 'd', 'fr_CA') AS [Journée de la visite],
		(DATEDIFF(MINUTE, HeureEntree, HeureSortie))/60.0 AS [Nombre d'heure rester],
		Prenom + ' ' + nom AS [Nom du client]
	FROM Visites 
	INNER JOIN Clients
		ON Visites.ClientID = Clients.ClientID
	INNER JOIN Personnes
		ON Clients.PersonneId = Personnes.PersonneID
	GO

	SELECT * FROM AfficherTempsVisiteClient

