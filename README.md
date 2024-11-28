# Gestion du Bloc 9.81 (Centre d'Escalade)
Exécuter les fichiers dans l'ordre indiqué. Ex : Executer en premier ```01 - Création de Base de données```

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

| Table        | Employée      | D.B. admin | Gérant      | R.H. / Comptabilité |
|--------------|---------------|------------|-------------|---------------------|
| **Clients**  | Écriture      | Écriture   | Écriture    | AUCUN               |
|              | Lecture       | Lecture    | Lecture     | Écriture (clients)  |
| **Personnes**| AUCUN         | Écriture   | Écriture    | AUCUN               |
|              | AUCUN         | Lecture    | Lecture     | Écriture (employées)|
| **Employees**| AUCUN         | Écriture   | Écriture    | AUCUN               |
|              | AUCUN         | Lecture    | Lecture     | Écriture (employées)|
| **Payes**    | AUCUN         | Écriture   | Écriture    | AUCUN               |
|              | AUCUN         | Lecture    | Lecture     | Écriture            |
| **Transactions**| AUCUN      | Écriture   | Écriture    | Écriture            |
|              | AUCUN         | Lecture    | Lecture     | Écriture            |
| **Visites**  | AUCUN         | Écriture   | Écriture    | Écriture            |
|              | AUCUN         | Lecture    | Lecture     | Écriture            |
| **Parcours** | AUCUN         | Écriture   | Écriture    | AUCUN               |
|              | AUCUN         | Lecture    | Lecture     | AUCUN               |
