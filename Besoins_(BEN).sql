USE [Bloc_9.81]
GO
--Premier besoin
/* Les employees peuvent afficher le nombre de Clients actif "ClientsEstActif" = 1 ou "ClientsEstActif" = 0*/
SELECT Prenom, Nom, FORMAT(DateNaissance, 'yyyy-MM-dd') AS [Date de naissance], Email, ParcoursEnCours FROM Clients INNER JOIN Personnes
ON Clients.PersonneID = Personnes.PersonneID
WHERE ClientEstActif = 1

SELECT Prenom, Nom, FORMAT(DateNaissance, 'yyyy-MM-dd') AS [Date de naissance], Email FROM Clients INNER JOIN Personnes
ON Clients.PersonneID = Personnes.PersonneID
WHERE ClientEstActif = 0

--Deuxième besoin
/* L'employer peut afficher les infos des parcours installer (VUES)*/
-- Changer les NULL pour zero
CREATE OR ALTER VIEW InfoParcoursActif
AS
	SELECT NiveauDifficulte AS [Niveau de difficulté], NomDuParcours AS [Nom du parcours], TypeDeParcours AS [Type du parcours] FROM Parcours
	WHERE EstInstalle = 1
	ORDER BY NiveauDifficulte DESC
GO


--Troisième besoin
/*Le gérant peuvent afficher les info important des employers selon leur ancientés*/
SELECT Prenom + ' ' + nom AS [Nom employee], FORMAT(DateEngagement, 'yyyy-MM-dd') AS [Date d'engagement], TauxHoraire FROM Employees INNER JOIN Personnes
ON Employees.PersonneID = Personnes.PersonneID
ORDER BY [Date d'engagement]

--Quatrième besoin
/*Le gérant peut obtinir les 10 plus anciens personne de la base de données*/
SELECT TOP 10 Prenom + ' ' + nom AS [Nom personne], (FORMAT(DateNaissance, 'yyyy-MM-dd')) AS [Date de naissance] FROM Personnes
ORDER BY [Date de naissance]


--Cinquième besoin
/*Les employers */


