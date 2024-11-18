USE [Bloc_9.81]
GO

--Enlever la table "Clients" si elle existe
DROP TABLE IF EXISTS Clients

--Cr�ation de la table "Clients"
CREATE TABLE Clients(
	--Cr�ation des colonnes
	IDClient int IDENTITY (1,1) NOT NULL,
	IDPersonne int NOT NULL,
		-- (Oui ou Non?)
	ClientEstActif nvarchar(3) NULL,
		--Nombre de num�ro dans une carte? 
	NumeroCarteBancaire nvarchar(16) NOT NULL,
	Email nvarchar(50) NOT NULL,
		--Je dois tu l'appeler IDParcour ou IDParcourEnCours
	IDParcoursEnCours int NULL,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Clients"
		PRIMARY KEY CLUSTERED ("IDClient"),
	--Cr�ation des cl�s �trang�re
	CONSTRAINT "FK_Clients_Clients_1"
		FOREIGN KEY ("IDParcoursEnCours")
		REFERENCES "dbo"."Clients" ("IDClient"),
	CONSTRAINT "FK_Clients_Clients_2"
		FOREIGN KEY ("IDPersonne")
		REFERENCES "dbo"."Clients" ("IDClient")
	)

--Cr�ation de la table "Personnes"
CREATE TABLE Personnes(
	--Cr�ation des colonnes
	IDPersonne int IDENTITY (1,1) NOT NULL,
	Nom nvarchar(20) NOT NULL,
	Prenom nvarchar(20) NOT NULL,
	DateNaissance datetime NULL,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Personnes"
		PRIMARY KEY CLUSTERED ("IDPersonne"),
	--V�rifier si la date de naissance est possible
	CONSTRAINT "CK_DateNaissance"
		CHECK (DateNaissance < getDate())
	)

--Cr�ation de la table "Transactions"
CREATE TABLE Transactions(
	IDtransaction int IDENTITY (1,1) NOT NULL,
	MontantTransaction nvarchar(5) NOT NULL,
	DateTransaction datetime NULL,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Transactions"
		PRIMARY KEY CLUSTERED ("IDTransaction"),
	--V�rifier si la date de transaction est possible
	CONSTRAINT "CK_DateTransaction"
		CHECK (DateTransaction < getDate())
	)

--Cr�ation de la table "Parcours"
CREATE TABLE Parcours(
	--Cr�ations des colonnes
	IDParcours int IDENTITY (1,1) NOT NULL,
	NomDuParcours nvarchar(20) NOT NULL,
	NiveauDifficulte nvarchar(2) NULL,
		--On le met tu NULL, parce ce qu'on va set les types de parcours?
	TypeDeParcours nvarchar(10) NOT NULL,
		--NULL pour le oui ou non
	EstInstalle nvarchar(3) NULL,
	--Cr�ation de la cl� primaire
	CONSTRAINT "PK_Parcours"
		PRIMARY KEY CLUSTERED ("IDParcours")
	)