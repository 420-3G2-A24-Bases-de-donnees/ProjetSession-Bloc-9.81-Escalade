USE [Bloc_9.81]
GO
--Premier besoin
/* Les employees peuvent afficher le nombre de Clients actif "ClientsEstActif" = 1 ou "ClientsEstActif" = 0*/
SELECT Prenom, Nom, DateNaissance, Email FROM Clients INNER JOIN Personnes
ON Clients.PersonneID = Personnes.PersonneID
WHERE ClientEstActif = 1

SELECT Prenom, Nom, DateNaissance, Email FROM Clients INNER JOIN Personnes
ON Clients.PersonneID = Personnes.PersonneID
WHERE ClientEstActif = 0

--Deuxi�me besoin
/* L'employer peut afficher les infos des parcours installer*/
-- Changer les NULL pour zero

SELECT NomDuParcours, NiveauDifficulte, TypeDeParcours FROM Parcours
WHERE EstInstalle = 1
ORDER BY NiveauDifficulte


--Troisi�me besoin
/*Le g�rant peuvent afficher les info important des employers selon leur ancient�s*/
SELECT Prenom + ' ' + nom AS [Nom employee], FORMAT(DateEngagement, 'yyyy-MM-dd') AS [Date d'engagement], TauxHoraire FROM Employees INNER JOIN Personnes
ON Employees.PersonneID = Personnes.PersonneID
ORDER BY [Date d'engagement]

--Quatri�me besoin
/*Le DB administrateur peut voir le profit fait selon les journ�e*/

--Cinqui�me besoin
/*Le g�rant peut changer le taux d'horaire d'un employee*/


