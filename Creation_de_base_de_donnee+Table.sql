--Cr�ation de la base de donn�e "Bloc_9.81"
GO
CREATE DATABASE [Bloc_9.81]
COLLATE French_CI_AS
;
GO

--2
USE [Bloc_9.81]
GO

--3
DROP TABLE IF EXISTS Personnes

--Cr�ation de la table "Personnes"
CREATE TABLE Personnes(
	--Cr�ation des colonnes
	PersonneID int IDENTITY (1,1) NOT NULL,
	Nom nvarchar(20) NOT NULL,
	Prenom nvarchar(20) NOT NULL,
	DateNaissance datetime2 NULL,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Personnes"
		PRIMARY KEY CLUSTERED ("PersonneID"),
	--V�rifier si la date de naissance est possible
	CONSTRAINT "CK_DateNaissance"
		CHECK (DateNaissance < GETDATE()),
	CONSTRAINT "CK_Adulte"
		CHECK (DATEDIFF(year, GETDATE(), DateNaissance) < 18)
)

--4
DROP TABLE IF EXISTS Employees

CREATE TABLE Employees(
	EmployeeID int IDENTITY(1,1) NOT NULL,
	PersonneID int NOT NULL,
	DateEngagement datetime2 NULL,
	TauxHoraire decimal NULL,
	NumeroCompteBancaire nvarchar(20) NULL,

	CONSTRAINT "PK_Employees"
		PRIMARY KEY CLUSTERED ("EmployeeID"),

	CONSTRAINT "FK_Employees_Personnes"
		FOREIGN KEY ("PersonneID")
		REFERENCES "dbo"."Personnes" ("PersonneID"),

	CONSTRAINT "CK_DateEngagement"
		CHECK (DateEngagement BETWEEN '2019-10-07' AND GETDATE()),

	CONSTRAINT "CK_NumeroCompteBancaire"  
		CHECK (NumeroCompteBancaire LIKE '[0-9][0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9][0-9][0-9][0-9]')
)

--5

DROP TABLE IF EXISTS Parcours

--Cr�ation de la table "Parcours"
CREATE TABLE Parcours(
	--Cr�ations des colonnes
	ParcoursID int IDENTITY (1,1) NOT NULL,
	NomDuParcours nvarchar(100) NOT NULL,
	NiveauDifficulte int NULL,
		--On le met tu NULL, parce ce qu'on va set les types de parcours?
	TypeDeParcours nvarchar(100) NOT NULL,
		--NULL pour le oui ou non
	EstInstalle bit NULL DEFAULT 1,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Parcours"
		PRIMARY KEY CLUSTERED ("ParcoursID")
	--Validation pour que le niveau de difficulte ne soit pas n�gatiff ???
)

--6


DROP TABLE IF EXISTS Clients

--Cr�ation de la table "Clients"
CREATE TABLE Clients(
	--Cr�ation des colonnes
	ClientID int IDENTITY (1,1) NOT NULL,
	PersonneID int NOT NULL,
	ClientEstActif bit NULL DEFAULT 1,
	NumeroCarteBancaire nvarchar(16) NOT NULL,
	Email nvarchar(50) NOT NULL,
	ParcoursEnCours int NULL,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Clients"
		PRIMARY KEY CLUSTERED ("ClientID"),
	--Cr�ation des cl�s �trang�re
	CONSTRAINT "FK_Clients_Parcours"
		FOREIGN KEY ("ParcoursEnCours")
		REFERENCES "dbo"."Parcours" ("ParcoursID"),
	CONSTRAINT "FK_Clients_Personnes"
		FOREIGN KEY ("PersonneID")
		REFERENCES "dbo"."Personnes" ("PersonneID"),
	--V�rification pour que l'addresse courriel soit valide
	CONSTRAINT "CK_Email"
		CHECK (Email LIKE '[a-Z0-9-_.]%@[a-Z0-9-_]%.[a-Z]%')
)

--7

DROP TABLE IF EXISTS Transactions

--Cr�ation de la table "Transactions"
CREATE TABLE Transactions(
	transactionID int IDENTITY (1,1) NOT NULL,
	-- DOIT �TRE CHIFFRER
	MontantTransaction decimal NOT NULL,
	DateTransaction datetime2 NULL,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Transactions"
		PRIMARY KEY CLUSTERED ("TransactionID")
)

--8

DROP TABLE IF EXISTS Payes

CREATE TABLE Payes(
	PayeID int IDENTITY(1,1) NOT NULL,
	TransactionID int NOT NULL,
	
	-- POBAblement qu'il faudrait mettre UNIQUE sur le transactionID
	EmployeeID int NOT NULL,

	CONSTRAINT "PK_Payes"
		PRIMARY KEY CLUSTERED ("PayeID"),

	CONSTRAINT "FK_Payes_Transactions"
		FOREIGN KEY ("TransactionID")
		REFERENCES "dbo"."Transactions" ("TransactionID"),

	CONSTRAINT "FK_Payes_Employees"
		FOREIGN KEY ("EmployeeID")
		REFERENCES "dbo"."Employees" ("EmployeeID"),
)

--9

DROP TABLE IF EXISTS Visites

CREATE TABLE Visites(
	VisiteID int IDENTITY(1,1) NOT NULL,
	ClientID int NOT NULL,
	HeureEntree datetime2 NOT NULL,
	HeureSortie datetime2 NOT NULL,
	TransactionID int NOT NULL,

	CONSTRAINT "PK_Visites"
		PRIMARY KEY CLUSTERED ("VisiteID"),

	CONSTRAINT "FK_Visites_Clients"
		FOREIGN KEY ("ClientID")
		REFERENCES "dbo"."Clients" ("ClientID"),

	CONSTRAINT "FK_Visites_Transactions"
		FOREIGN KEY ("TransactionID")
		REFERENCES "dbo"."Transactions" ("TransactionID"),
)
