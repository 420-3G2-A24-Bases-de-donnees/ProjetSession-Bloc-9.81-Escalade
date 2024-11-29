
-- Créer la clé
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'UnPasswordSecurise';



GO
ALTER TABLE Employees
ALTER COLUMN NumeroCompteBancaire VARBINARY(256)

CREATE ASYMMETRIC KEY NumeroCompteBancaireKEK WITH ALGORITHM = RSA_4096

CREATE SYMMETRIC KEY NumeroCompteBancaireKey WITH ALGORITHM = AES_256
ENCRYPTION BY ASYMMETRIC KEY NumeroCompteBancaireKEK;

OPEN SYMMETRIC KEY NumeroCompteBancaireKey
DECRYPTION BY ASYMMETRIC KEY NumeroCompteBancaireKEK
SET IDENTITY_INSERT Employees ON
INSERT INTO Employees (EmployeeID, PersonneID, NumeroCompteBancaire)
VALUES (991, 1, EncryptByKey(Key_GUID('NumeroCompteBancaireKey'), '12342-78-23332', 1, 'DateEngagement'))


OPEN SYMMETRIC KEY NumeroCompteBancaireKey
DECRYPTION BY ASYMMETRIC KEY NumeroCompteBancaireKEK
SELECT CONVERT(varchar(100), DecryptByKey(NumeroCompteBancaire, 1, 'DateEngagement'))
AS NumeroCompteBancaire
FROM Employees