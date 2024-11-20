USE [Bloc_9.81]
GO

DROP TABLE IF EXISTS Employees

CREATE TABLE Employees(
	EmployeeID int IDENTITY(1,1) NOT NULL,
	PersonneID int NOT NULL,
	DateEngagement datetime NULL,
	TauxHoraire decimal NULL,
	NumeroCompteBancaire nvarchar(20) NULL,

	CONSTRAINT "PK_Employees"
		PRIMARY KEY CLUSTERED ("EmployeeID"),

	CONSTRAINT "FK_Employees_Personnes"
		FOREIGN KEY ("PersonneID")
		REFERENCES "dbo"."Personnes" ("PersonneID"),

	CONSTRAINT "CK_DateEngagement"
		CHECK (DateEngagement BETWEEN '07-10-2020' AND GETDATE()),

	CONSTRAINT "CK_NumeroCompteBancaire"  
		CHECK (NumeroCompteBancaire LIKE '[0-9]{5}-[0-9]{2}-[0-9]{5}')
)


DROP TABLE IF EXISTS Payes

CREATE TABLE Payes(
	PayeID int IDENTITY(1,1) NOT NULL,
	TransactionID decimal NOT NULL,
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


DROP TABLE IF EXISTS Visites

CREATE TABLE Visites(
	VisiteID int IDENTITY(1,1) NOT NULL,
	ClientID int NOT NULL,
	HeureEntree datetime NULL, -- À Vérifier
	HeureSortie datetime NULL, -- À Vérifier
	TransactionID decimal NULL, -- À Vérifier

	CONSTRAINT "PK_Visites"
		PRIMARY KEY CLUSTERED ("VisiteID"),

	CONSTRAINT "FK_Visites_Clients"
		FOREIGN KEY ("ClientID")
		REFERENCES "dbo"."Clients" ("ClientID"),

	CONSTRAINT "FK_Visites_Transactions"
		FOREIGN KEY ("TransactionID")
		REFERENCES "dbo"."Transactions" ("TransactionID"),
)