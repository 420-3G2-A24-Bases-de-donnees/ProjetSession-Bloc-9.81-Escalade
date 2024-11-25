--Chiffrement "Clients"(NumeroCarteBancaire) + "Transactions"(MontantTransaction)



--Clients (Clés symétriques) "CHIFFREMENT"



ALTER TABLE Clients
ALTER COLUMN NumeroCarteBancaire VARBINARY(256)

CREATE ASYMMETRIC KEY ClientKEK WITH ALGORITHM = RSA_2048

CREATE SYMMETRIC KEY ClientKey WITH ALGORITHM = AES_256
ENCRYPTION BY ASYMMETRIC KEY ClientKEK





--Clients (Clés symétriques) "DÉCHIFFREMENT"



--Transactions (Clés asymétriques)