-- DEMANDE CHATGPT (généré des données)

---- Personnes : Donne moi 100 script qui seed dans cette base de données, donne moi 100 données de 'Personnes' pour cette base de donnée: 
	-- PersonneID int IDENTITY (1,1) NOT NULL,
	-- Nom nvarchar(20) NOT NULL,
	-- Prenom nvarchar(20) NOT NULL,
	-- DateNaissance datetime NULL)

---- Employees : 
	-- EmployeeID int IDENTITY(1,1) NOT NULL,
	-- PersonneID int NOT NULL,
	-- DateEngagement datetime NULL,
	-- TauxHoraire decimal NULL,
	-- NumeroCompteBancaire nvarchar(20) NULL,


--Donne moi 100 script qui seed dans cette base de données, donne moi 100 données de 'Personnes' pour cette base de donnée:  (le PersonneID doit commencer a 100)

--le format de NumeroCompteBancaire : xxxxx-xx-xxxxx (ou x = n'importe quel chiffre)

--il peu y avoir quelques données vides, à condition que la column le permet


---- Clients : Donne moi  un script de 100 seed (INSRT INTO) dans cette base de données 'Clients' pour cette base de donnée:
	-- ClientID int IDENTITY (1,1) NOT NULL,
	-- PersonneID int NOT NULL,
	-- ClientEstActif bit NULL DEFAULT 1,

	-- NumeroCarteBancaire nvarchar(16) NOT NULL,
	-- Email nvarchar(50) NOT NULL,
 	-- ParcoursEnCours int NULL 

--le format de NumeroCarteBancaire : xxxxxxxxxxxxxxxx (ou x = n'importe quel chiffre)
--il peu y avoir quelques données vides, à condition que la column le permet


---- Transactions : Donne moi  un script de 250 seed (INSRT INTO) dans cette base de données 'Transactions' pour cette base de donnée:
	-- transactionID int IDENTITY (1,1) NOT NULL,
	-- MontantTransaction decimal NOT NULL,
	-- DateTransaction datetime NULL

--il peut y avoir quelques données vide, à condition que la colum le permet
--le MontantTransaction ne peut pas dépasser 300.00


---- Parcours : Donne moi  un script de 100 seed (INSRT INTO) dans cette base de données 'Parcours' pour cette base de donnée:

	-- ParcoursID int IDENTITY (1,1) NOT NULL,
	-- NomDuParcours nvarchar(20) NOT NULL,
	-- NiveauDifficulte int NULL, 
	-- TypeDeParcours nvarchar(10) NOT NULL, 
	-- EstInstalle bit NULL DEFAULT 1,

--il peut y avoir quelques données vide, à condition que la colum le permet
--la valeur NiveauDifficulte ne peut pas être négatif
--la valeur TypeDeParcours doit être un de ces choix [Bouldering, Dino, Crimp, Stab, Dynamique, Statique]



--Donne moi 300 script qui seed dans cette base de données(INSRT TO), donne moi 300 données de 'Visites' pour cette base de donnée:

	--VisiteID int IDENTITY(1,1) NOT NULL,
	--ClientID int NOT NULL,
	--HeureEntree datetime2 NOT NULL,
	--HeureSortie datetime2 NOT NULL,
	--TransactionID int NOT NULL

--le format de HeureEntree : xxxx-xx-xx-xx-xx-xx (ou x = n'importe quel chiffre)
--le format de HaureSortie : xxxx-xx-xx-xx-xx-xx (ou x = n'importe quel chiffre)
--l'HeureEntree ne peut pas être plus petit que xxxx-xx-xx-08-00-00 (ou x = n'importe quel chiffre)
--l'HeureSortie ne peut pas être plus grand que xxxx-xx-xx-23-00-00 (ou x = n'importe quel chiffre)
--l'HeureEntree ne peut pas être plus petit que 2019-10-07-xx-xx-xx (ou x = n'importe quel chiffre)
--l'HeureEntree ne peut pas être plus grand que 2024-11-21-xx-xx-xx (ou x = n'importe quel chiffre)
--le TransactionID doit commencer a 1
--les HeureEntree et HeureSortie ne sont pas obligé de se suivre, tout en suivant les demandes de tantôt
--le ClientID doit être entre 1 et 98 et il peut ce repéter