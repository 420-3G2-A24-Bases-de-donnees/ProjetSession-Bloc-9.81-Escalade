# ProjetSession-Bloc-9.81-Escalade
Projet de session - Sujet : Gestion du centre d'escalade Bloc 9.81


# Gestion du Bloc 9.81 (Centre d'Escalade)

## Tables et Structures de Données

### 1. **Clients**
- **Champs** : 
  - ID
  - IDPersonne
  - ClientEstActif
  - NumeroCarteBancaire
  - Email
  - IDParcoursEnCours

### 2. **Personnes**
- **Champs** : 
  - ID
  - Nom
  - Prenom
  - DateNaissance

### 3. **Employees**
- **Champs** : 
  - ID
  - IDPersonne
  - DateEngagement
  - TauxHoraire
  - NumeroCompteBancaire

### 4. **Payes**
- **Champs** : 
  - ID
  - IDTransaction
  - EmployeeID

### 5. **Transactions**
- **Champs** : 
  - ID
  - MontantTransaction
  - Date

### 6. **Visites**
- **Champs** : 
  - ID
  - IDClient
  - HeureEntree
  - HeureSortie
  - IDTransaction

### 7. **Parcours**
- **Champs** : 
  - ID
  - NomDuParcours
  - NiveauDifficulte
  - TypeDeParcours
  - EstInstalle

### Données sensibles et encryptées/chiffrées :
- **Souligné** = Donnée sensible ET encryptée/chiffrée.

---

## Division des Tâches

- **Ben**  
- **Marc**

---

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
