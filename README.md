# Gestion du Bloc 9.81 (Centre d'Escalade)
Exécuter les fichiers dans l'ordre indiqué. Ex : Executer en premier **`01 - Création de Base de données`**

## Schéma entités relations





## GROUPE UTILISATEURS

- **`Gerant`**
	Mot de passe = Lk8Jy2!
- **`Employees`**
	Mot de passe = JgtsGs2!
- **`RH`**
	Mot de passe = Ok4A2da!
- **`DBAdmin`**
	Mot de passe = GKiksjI1$


## Tables et Structures de Données
### **Clients**
  - ClientID
  - PersonneID
  - ClientEstActif
  - **NumeroCarteBancaire** (Sensible)
  - Email
  - ParcoursEnCours

### 2. **Personnes**
  - PersonneID
  - Nom
  - Prenom
  - DateNaissance

### 3. **Employees**
  - EmployeeID
  - PersonneID
  - DateEngagement
  - TauxHoraire
  - **NumeroCompteBancaire** (Sensible)

### 4. **Payes**
  - PayeID
  - TransactionID
  - EmployeeID

### 5. **Transactions**
  - TransactionID
  - **MontantTransaction** (Sensible)
  - DateTransaction

### 6. **Visites**
  - VisiteID
  - ClientID
  - HeureEntree
  - HeureSortie
  - TransactionID

### 7. **Parcours**
  - ParcoursID
  - NomDuParcours
  - NiveauDifficulte
  - TypeDeParcours
  - EstInstalle

### Données sensibles et encryptées/chiffrées :
**Italique gras** = Donnée sensible ET encryptée/chiffrée.

---

## Division des Tâches
### **Ben**
   - Clients
   - Personnes
   - Transactions
   - Parcours 
### **Marc**
   - Employees
   - Payes
   - Visites


---
## PLAN DE MAINTENANCE
![image](https://github.com/user-attachments/assets/800efccd-2f3d-4656-99a3-4532360be8b0)
- Mode de récupération = Complet
- RTO = 1 jour MAX
- RPO = 1 jour MAX
- Stratégie =  
	- Copies de sauvegarde complètes au 7 jours 
	- Copies de sauvegarde différentielle par jour
	- Journaux de transactions aux 30 minutes (Le jour)



## Groupes de Personnes et Privilèges pour Chaque Table
![image](https://github.com/user-attachments/assets/4de96344-fb05-458e-b0cb-5087884c4c4d)
