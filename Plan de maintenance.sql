/* PLAN DE MAINTENANCE
Mode de récupération = Complet
RTO = 1 jour MAX
RPO = 1 jour MAX
Stratégie =  
	- Copies de sauvegarde complètes au 7 jours 


*/
-- Complète
ALTER DATABASE [Bloc_9.81] SET RECOVERY FULL;


BACKUP DATABASE [Bloc_9.81]
    TO  DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQL\MSSQL\Backup\Bloc981-full'
    WITH  RETAINDAYS = 20,
	NAME = 'Bloc 9.18 - Sauvegarde complète';
GO



DECLARE @NomDataBase NVARCHAR(255)
DECLARE @CheminBackup NVARCHAR(255)
DECLARE @Date NVARCHAR(20)

SET @CheminBackup = 'C:\Backups\' 
SET @Date = CONVERT(NVARCHAR(20), GETDATE(), 112) -- Format YYYYMMDD

-- Sauvegarde de toutes les bases de données
DECLARE db_cursor CURSOR FOR
SELECT name 
FROM sys.databases 
WHERE state_desc = 'ONLINE' AND name NOT IN ('master', 'tempdb', 'model', 'msdb')

OPEN db_cursor
FETCH NEXT FROM db_cursor INTO @NomDataBase

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Sauvegarde de la base de données
    DECLARE @BackupSQL NVARCHAR(MAX)
    SET @BackupSQL = 'BACKUP DATABASE [' + @NomDataBase + '] TO DISK = ''' + @CheminBackup + @NomDataBase + '_' + @Date + '.bak'' WITH NOFORMAT, NOINIT, NAME = ''' + @NomDataBase + ' Full Backup'', SKIP, NOREWIND, NOUNLOAD, STATS = 10'
    EXEC sp_executesql @BackupSQL

    -- Reconstruction des index
    DECLARE @RebuildSQL NVARCHAR(MAX)
    SET @RebuildSQL = 'USE [' + @NomDataBase + ']; EXEC sp_MSforeachtable ''ALTER INDEX ALL ON ? REBUILD'''
    EXEC sp_executesql @RebuildSQL

    -- Mise à jour des statistiques
    DECLARE @UpdateStatsSQL NVARCHAR(MAX)
    SET @UpdateStatsSQL = 'USE [' + @NomDataBase + ']; EXEC sp_updatestats'
    EXEC sp_executesql @UpdateStatsSQL

    FETCH NEXT FROM db_cursor INTO @NomDataBase
END

CLOSE db_cursor
DEALLOCATE db_cursor

PRINT 'Plan de maintenance terminé.'