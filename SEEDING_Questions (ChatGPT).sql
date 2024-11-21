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

