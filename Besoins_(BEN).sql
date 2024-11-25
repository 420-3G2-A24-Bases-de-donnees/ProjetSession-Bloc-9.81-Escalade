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
/* Le g�rant peut ajouter un employee dans la table "Employees"*/


--Troisi�me besoin
/*Les employees peuvent enregistrer un nouveau client dans la table  "Clients"*/

--Quatri�me besoin
/*Les employees peuvent enregistrer une visite d'un client dans la table "Visites"*/

--Cinqui�me besoin
/*Le g�rant peut changer le taux d'horaire d'un employee*/


