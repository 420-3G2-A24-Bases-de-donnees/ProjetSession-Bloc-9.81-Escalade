--Chiffrement "Clients"(NumeroCarteBancaire) + "Transactions"(MontantTransaction)



--Clients (Cl�s sym�triques) "CHIFFREMENT"



ALTER TABLE Clients
ALTER COLUMN NumeroCarteBancaire VARBINARY(256)

CREATE ASYMMETRIC KEY ClientKEK WITH ALGORITHM = RSA_2048

CREATE SYMMETRIC KEY ClientKey WITH ALGORITHM = AES_256
ENCRYPTION BY ASYMMETRIC KEY ClientKEK





--Clients (Cl�s sym�triques) "D�CHIFFREMENT"



--Transactions (Cl�s asym�triques)