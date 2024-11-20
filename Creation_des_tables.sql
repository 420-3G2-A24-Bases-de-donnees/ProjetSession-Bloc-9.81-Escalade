USE [Bloc_9.81]
GO

DROP TABLE IF EXISTS Clients
DROP TABLE IF EXISTS Personnes
DROP TABLE IF EXISTS Transactions
DROP TABLE IF EXISTS Parcours

--Cr�ation de la table "Clients"
CREATE TABLE Clients(
	--Cr�ation des colonnes
	ClientID int IDENTITY (1,1) NOT NULL,
	PersonneID int NOT NULL,
		-- (Oui ou Non?)
	ClientEstActif bit NULL DEFAULT 1,
		--Nombre de num�ro dans une carte? + Parler avec la prof pour NULL ou NOT NULL. + DOIT �TRE CHIFFRER
	NumeroCarteBancaire nvarchar(16) NOT NULL,
	Email nvarchar(50) NOT NULL,
		--Je dois tu l'appeler IDParcour ou IDParcourEnCours
	ParcoursEnCours int NULL,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Clients"
		PRIMARY KEY CLUSTERED ("ClientID"),
	--Cr�ation des cl�s �trang�re
	CONSTRAINT "FK_Clients_Parcours"
		FOREIGN KEY ("ParcoursEnCours")
		REFERENCES "dbo"."Clients" ("ClientID"),
	CONSTRAINT "FK_Clients_Personnes"
		FOREIGN KEY ("PersonneID")
		REFERENCES "dbo"."Clients" ("ClientID"),
	--V�rification pour que l'addresse courriel soit valide
	CONSTRAINT "CK_Email"
		CHECK (Email LIKE '%@%')
	)

--Cr�ation de la table "Personnes"
CREATE TABLE Personnes(
	--Cr�ation des colonnes
	PersonneID int IDENTITY (1,1) NOT NULL,
	Nom nvarchar(20) NOT NULL,
	Prenom nvarchar(20) NOT NULL,
	DateNaissance datetime NULL,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Personnes"
		PRIMARY KEY CLUSTERED ("PersonneID"),
	--V�rifier si la date de naissance est possible
	CONSTRAINT "CK_DateNaissance"
		CHECK (DateNaissance < GETDATE()),
	CONSTRAINT "CK_Adulte"
		CHECK (DATEDIFF(year, GETDATE(), DateNaissance) < 18)
	)

--Cr�ation de la table "Transactions"
CREATE TABLE Transactions(
	transactionID int IDENTITY (1,1) NOT NULL,
	-- DOIT �TRE CHIFFRER
	MontantTransaction decimal NOT NULL,
	DateTransaction datetime NULL,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Transactions"
		PRIMARY KEY CLUSTERED ("TransactionID")
	)

--Cr�ation de la table "Parcours"
CREATE TABLE Parcours(
	--Cr�ations des colonnes
	ParcoursID int IDENTITY (1,1) NOT NULL,
	NomDuParcours nvarchar(20) NOT NULL,
	NiveauDifficulte int NULL,
		--On le met tu NULL, parce ce qu'on va set les types de parcours?
	TypeDeParcours nvarchar(10) NOT NULL,
		--NULL pour le oui ou non
	EstInstalle bit NULL DEFAULT 1,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Parcours"
		PRIMARY KEY CLUSTERED ("ParcoursID")
	--Validation pour que le niveau de difficulte ne soit pas n�gatiff ???
	)