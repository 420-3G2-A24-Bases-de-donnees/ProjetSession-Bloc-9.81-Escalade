-- Voir si la Database Master Key est définie (DMK)
SELECT name, key_algorithm, key_length
FROM sys.symmetric_keys
WHERE name = '##MS_DatabaseMasterKey##'

-- La créer
CREATE MASTER KEY ENCRYPTION BY PASSWORD = 'UnPasswordSecurise';

-- En faire une sauvegarde
BACKUP MASTER KEY TO FILE = 'D:\data\master_key'  
ENCRYPTION BY PASSWORD = 'UnAutrePasswordSecurise'

-- Voir si la service master key (SMK) est définie
SELECT name, key_algorithm, key_length
FROM master.sys.symmetric_keys

-- En faire une sauvegarde
BACKUP SERVICE MASTER KEY TO FILE = 'D:\data\sql2022_smk'  
ENCRYPTION BY PASSWORD = 'UnAutrePasswordSecurise'



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

CREATE OR ALTER
