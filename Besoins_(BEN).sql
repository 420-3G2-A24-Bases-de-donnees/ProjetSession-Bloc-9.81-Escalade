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

--Deuxième besoin
/* Le gérant peut ajouter un employee dans la table "Employees"*/


--Troisième besoin
/*Les employees peuvent enregistrer un nouveau client dans la table  "Clients"*/

--Quatrième besoin
/*Les employees peuvent enregistrer une visite d'un client dans la table "Visites"*/

--Cinquième besoin
/*Le gérant peut changer le taux d'horaire d'un employee*/


