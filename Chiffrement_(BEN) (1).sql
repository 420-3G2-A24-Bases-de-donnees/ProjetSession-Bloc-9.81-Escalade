--Service Master KEY (Doit changer le mot de passe)

CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'Password'

--Clients (Clés symétriques) "CHIFFREMENT"

ALTER TABLE Clients
ALTER COLUMN NumeroCarteBancaire VARBINARY(256)

CREATE ASYMMETRIC KEY ClientKEK WITH ALGORITHM = RSA_2048

CREATE SYMMETRIC KEY ClientKey WITH ALGORITHM = AES_256
ENCRYPTION BY ASYMMETRIC KEY ClientKEK


--Transactions (Clés asymétriques) "CHIFFREMENT"

ALTER TABLE Transactions
ALTER COLUMN MontantTransaction VARBINARY(256)
CREATE ASYMMETRIC KEY TransactionKey WITH ALGORITHM = RSA_2048

--Chiffrement "Clients"(NumeroCarteBancaire) + "Transactions"(MontantTransaction)

SET IDENTITY_INSERT Clients ON
INSERT INTO Clients (ClientID, NumeroCarteBancaire)
VALUES (1, EncryptByKey(Key_GUID('ClientKey'), '5678901234567890', 1, 'Nom'))

UPDATE Transactions
SET MontantTransaction = ENCRYPTBYASYMKEY(ASYMKEY_ID('TransactionKey'), MontantTransaction)


--Clients (Clés symétriques) "DÉCHIFFREMENT"

SELECT DateTransaction, CONVERT(decimal, DECRYPTBYASYMKEY(ASYMKEY_ID('TransactionKey'), MontantTransaction)) AS MontantTransaction FROM Transactions	


--Transactions (Clés asymétriques) "DÉCHIFFREMENT"
OPEN SYMMETRIC KEY ClientKey
DECRYPTION BY ASYMMETRIC KEY ClientKeK

SELECT ClientID, CONVERT(varbinary(16), DecryptByKey(NumeroCarteBancaire, 1, 'Nom'))
AS NumeroCarteBancaire
FROM Clients


SELECT * FROM Clients