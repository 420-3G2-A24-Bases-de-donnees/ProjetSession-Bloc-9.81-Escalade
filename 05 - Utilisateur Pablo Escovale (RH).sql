--RH
USE [Bloc_9.81]
CREATE USER [Pablo Escovale] FOR LOGIN [Bloc9.81];

use [Bloc_9.81]
GO
GRANT INSERT ON [dbo].[Personnes] TO [Pablo Escovale] WITH GRANT OPTION 
GO
use [Bloc_9.81]
GO
GRANT ALTER ON [dbo].[Personnes] TO [Pablo Escovale] WITH GRANT OPTION 
GO
use [Bloc_9.81]
GO
DENY SELECT ON [dbo].[Personnes] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Personnes] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
GRANT INSERT ON [dbo].[Transactions] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
GRANT ALTER ON [dbo].[Transactions] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY SELECT ON [dbo].[Transactions] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Transactions] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
GRANT INSERT ON [dbo].[Payes] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
GRANT ALTER ON [dbo].[Payes] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY SELECT ON [dbo].[Payes] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Payes] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY INSERT ON [dbo].[Clients] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY ALTER ON [dbo].[Clients] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY SELECT ON [dbo].[Clients] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Clients] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
GRANT INSERT ON [dbo].[Employees] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
GRANT ALTER ON [dbo].[Employees] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY SELECT ON [dbo].[Employees] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Employees] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY INSERT ON [dbo].[Parcours] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY ALTER ON [dbo].[Parcours] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY SELECT ON [dbo].[Parcours] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Parcours] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY INSERT ON [dbo].[Visites] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY ALTER ON [dbo].[Visites] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY SELECT ON [dbo].[Visites] TO [Pablo Escovale]
GO
use [Bloc_9.81]
GO
DENY DELETE ON [dbo].[Visites] TO [Pablo Escovale]
GO

DROP USER [Pablo Escovale]
