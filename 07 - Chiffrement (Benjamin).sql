CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'MotDePasseSecure'

USE [Bloc_9.81]
GO


/*1er chiffrement
--Chiffrment du NumeroCarteBancaire de client
*/
ALTER TABLE Clients
	DROP COLUMN NumeroCarteBancaire

ALTER TABLE CLIENTS
	ADD NumeroCartebancaire VARBINARY(256)
--Création de l'asymmetric key pour Clients
CREATE ASYMMETRIC KEY ClientKEK WITH ALGORITHM = RSA_4096
--Création de la symmetric key pour Clients
CREATE SYMMETRIC KEY ClientKey WITH ALGORITHM = AES_256
	ENCRYPTION BY ASYMMETRIC KEY ClientKEK
--Chiffrement + Déchiffrement de NumeroCarteBancaire
OPEN SYMMETRIC KEY ClientKey
	DECRYPTION BY ASYMMETRIC KEY ClientKeK

SET IDENTITY_INSERT Clients ON
INSERT INTO Clients (ClientID, NumeroCarteBancaire)
	VALUES (664, EncryptByKey(Key_GUID('ClientKey'), '5678901234567890', 1, 'Nom'))

SELECT 
	ClientID, 
	CONVERT(varchar(100), 
	DecryptByKey(NumeroCarteBancaire, 1, 'Nom')) AS NumeroCarteBancaire
FROM Clients WHERE ClientID = 664



DELETE FROM Clients