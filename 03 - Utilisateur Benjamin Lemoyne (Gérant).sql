--Gérant
USE [Bloc_9.81]
CREATE USER [Benjamin Lemoyne] FOR LOGIN [Bloc9.81];

use [Bloc_9.81]
GO
GRANT INSERT ON [dbo].[Personnes] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT ALTER ON [dbo].[Personnes] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT SELECT ON [dbo].[Personnes] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Personnes] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT INSERT ON [dbo].[Transactions] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT ALTER ON [dbo].[Transactions] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT SELECT ON [dbo].[Transactions] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Transactions] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT INSERT ON [dbo].[Clients] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT ALTER ON [dbo].[Clients] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT SELECT ON [dbo].[Clients] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Clients] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT INSERT ON [dbo].[Parcours] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT ALTER ON [dbo].[Parcours] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT SELECT ON [dbo].[Parcours] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Parcours] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT INSERT ON [dbo].[Employees] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT ALTER ON [dbo].[Employees] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT SELECT ON [dbo].[Employees] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT DELETE ON [dbo].[Employees] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT INSERT ON [dbo].[Payes] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT ALTER ON [dbo].[Payes] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT SELECT ON [dbo].[Payes] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Payes] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT INSERT ON [dbo].[Visites] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT ALTER ON [dbo].[Visites] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
GRANT SELECT ON [dbo].[Visites] TO [Benjamin Lemoyne]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Visites] TO [Benjamin Lemoyne]
GO

DROP USER [Benjamin Lemoyne]