--Chiffrement "Clients"(NumeroCarteBancaire) + "Transactions"(MontantTransaction)

--Clients (Cl�s sym�triques) "CHIFFREMENT"

ALTER TABLE Clients
ALTER COLUMN NumeroCarteBancaire) VARBINARY

CREATE ASYMMETRIC KEY ClientsKeK WITH ALGORITHM = RSA_4096

CREATE SYMMETRIC KEY ClientsKey WITH ALGORITHM = AES_192
ENCRYPTION BY ASYMMETRIC KEY ClientsKek

OPEN SYMMETRIC KEY ClientsKey DDECRYPTION BY ASYMMETRIC KEY ClientsKeK;

INSERT INTO Clients (ClientID, NumeroCarteBancaire)
VALUES (1, ENCRYPTBYKEY(KEY_GUID('ClientsKey'), '1234-5678-9012-3456', 1, 'salt'))

CLOSE SYSMMETRIC KEY ClientsKey



--Clients (Cl�s asym�triques) "D�CHIFFREMENT"



--Transactions (Cl�s asym�triques)