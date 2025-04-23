# 🦈 Projet Hardware : Transformer un routeur en outil d’attaque réseau portable

![image](https://github.com/user-attachments/assets/87e78e21-912a-41bb-8adc-98dc40cffa53)

## 🎯 Présentation 

Ce projet a pour ambition de concevoir une solution **autonome et facilement transportable**, inspirée d’outils reconnus comme le **Flipper Zero** ou le **Shark Jack** de Hak5. Elle doit permettre l’exécution d’attaques réseau légères à des fins de test de sécurité, dans des environnements variés, de manière simple et efficace.

Pour cela, nous utiliserons **JabberJaw**, une réécriture en open-source du firmware Shark Jack, conçue pour transformer n’importe quel routeur compatible **OpenWrt** en plateforme d’attaque réseau mobile. 

Là où JabberJaw se distingue, c’est qu’il s’agit d’un projet open source déjà développé, ce qui nous évite d’avoir à créer un firmware personnalisé de zéro. Il tire également parti de la connectivité Wi-Fi intégrée du routeur pour simplifier son utilisation : un point d’accès est généré automatiquement et sert de mode de configuration. Quant à l’exécution des payloads, elle se lance automatiquement dès qu’un port Ethernet est connecté à un autre appareil ou réseau.

Enfin, en raison des limitations de mémoire propres aux routeurs de voyage ou aux modèles compacts de ce type, aucune interface graphique ne sera mise en place. L’ensemble de l’administration se fera exclusivement en ligne de commande via SSH.

## ✅ Objectifs

### 1. **Recherche et exploration des possibilités**

- **Objectif principal** : Identifier les composants matériels adaptés et les vecteurs d’attaque exploitables pour poser les bases du projet.
- **Tâches** :
  - Étudier les solutions existantes (Flipper Zero, Shark Jack) pour en extraire les fonctionnalités clés.
  - Identifier les composants nécessaires : routeurs OpenWrt, modules Wi-Fi, Bluetooth, alimentation, etc.
  - Sélectionner et valider 3 modèles de routeurs selon leur compatibilité, coût et disponibilité.
  - Préparer un dossier d’achat à soumettre à Ynov.
  - Recherche de vecteurs d’attaque : DoS, injection, sniffing passif, etc., en tenant compte de leur faisabilité embarquée et de leur cadre légal.
- **Livrables attendus** :
  - Fiche de validation des matériels.
  - Synthèse des recherches techniques et juridiques.
- **Échéance prévue** : Fin 2024.

---

### 2. **Développement des payloads**

- **Objectif principal** : Créer des scripts / payloads d’attaque simples et modulaires pour la reconnaissance réseau et l’analyse de vulnérabilités.
- **Tâches** :
  - Développer 3 payloads en Python :
    - Scan Wi-Fi (détection des SSID ouverts, intensité du signal).
    - Découverte d’hôtes sur un réseau local (ARP ou ping sweep).
    - Test de vulnérabilités sur des protocoles comme HTTP, SMB, etc.
  - Intégrer et automatiser le lancement des payloads sur le matériel sélectionné.
  - Valider le fonctionnement dans un environnement de test contrôlé.
- **Livrables attendus** :
  - Scripts commentés.
  - Résultats de tests.
- **Échéance prévue** : Payloads prêts pour janvier 2025.

---

### 3. **Prototypage et intégration**

- **Objectif principal** : Assembler le prototype matériel et y intégrer un firmware allégé basé sur JabberJaw.
- **Tâches** :
  - Réaliser l’assemblage physique : routeur, batterie et câblage dans un format compact.
  - Déployer le firmware personnalisé basé sur OpenWrt.
  - Effectuer des tests d’intégration (autonomie, stabilité, exécution des payloads).
- **Livrables attendus** :
  - Prototype physique.
  - Documentation technique.
- **Échéance prévue** : Prototype fonctionnel pour mars 2025 (3 semaines d’intégration prévues).

---

### 4. **Proof of Concept (POC)**

- **Objectif principal** : Démontrer la viabilité de la solution dans un environnement contrôlé avec supervision automatisée.
- **Tâches** :
  - Automatiser le lancement des payloads au démarrage du dispositif.
  - Mettre en place un envoi sécurisé des résultats via webhook (ex. Discord).
  - Réaliser des tests dans différents contextes réseau (Wi-Fi public, LAN restreint).
  - Suivre la consommation énergétique et les performances globales.
- **Livrables attendus** :
  - Tableau de logs d’exécution.
  - Dossier de validation du POC.
- **Échéance prévue** : Démonstration finale en mai 2025.

---


### 🧩 Gestion de projet

- **Planification** : Utilisation d’outils collaboratifs (Discord, MS365) avec jalons, suivis de tâches et indicateurs d’avancement.
- **Budget** : Élaboration et suivi d’un budget prévisionnel, validé par l’établissement.
- **Documentation continue** : Mise à jour régulière d’un dossier partagé comprenant inspirations, choix techniques, tests et documentation utilisateur.
- **Organisation d’équipe** : Répartition des rôles et points de coordination réguliers pour assurer un bon déroulement.
- **Amélioration continue** : Bilan à chaque étape (REX) pour ajuster la démarche et renforcer la qualité finale de la solution.

---

## 🧰 Matériel utilisé

- 🛜 **Routeur GL-MT300N-V2 (Mango)**.

  ![image](https://github.com/user-attachments/assets/d273a34d-5c2c-4d40-aaa7-115ea8371979)
  
- 🔋 **Batterie USB externe** – pour une alimentation autonome.
- 🔌 **Câble micro-USB** – pour connecter la batterie au routeur.
- 💻 **PC sous Linux / WSL** – utilisé pour construire et déployer l’image OpenWrt modifiée.
- 📶 **Connexion Internet** – requise pour l’installation initiale des paquets.
- 📎 **Accessoires optionnels** :
  - Adaptateur Ethernet USB – pour une connexion filaire directe.
  - Clé USB – pour étendre le stockage si besoin.

  
