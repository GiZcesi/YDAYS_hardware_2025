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
  - Sélectionner et valider un modèle de routeur selon sa compatibilité, coût et disponibilité.
  - Préparer un dossier d’achat à soumettre à Ynov.
  - Recherche de vecteurs d’attaque : DoS, injection, sniffing passif, etc., en tenant compte de leur faisabilité embarquée et de leur cadre légal.
- **Livrables attendus** :
  - Fiche de validation des matériels.
  - Synthèse des recherches techniques et juridiques.
- **Échéance prévue** : Fin 2024.

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

## 1. **Recherche et exploration des possibilités**
  
  - **Ressources utilisées** :
  - [Shark Jack de Hak5](https://www.hak5.org/sharkjack/)
  - [GitLab de JabberJaw](https://gitlab.com/jabberjaw-project)
  - [Blog Samy Link sur JabberJaw](https://samy.link/blog/jabberjaw-convert-your-router-in-portable-network-attack-dev)

### A. Analyse des solutions existantes

**Flipper Zero :**
- Fonctionnalités clés : Multi-outil portable (RFID/NFC, radio 433/868MHz, infrarouge, Bluetooth LE, GPIO)
- Points forts : Compact, batterie intégrée, interface intuitive avec écran
- Limitations : Puissance limitée, Wi-Fi via module externe uniquement

**Shark Jack (Hak5) :**
- Fonctionnalités clés : Capture réseau automatisée, déploiement rapide (plug-and-play)
- Points forts : Automatisation d'attaques, stockage intégré, indicateurs LED
- Limitations : Fonctionnalités centrées sur l'Ethernet uniquement

**JabberJaw :**
- Concept : Conversion de routeurs en plateformes d'attaque réseau portables
- Avantages : Utilisation de matériel existant, personnalisable, économique

### B. Composants validés

**Routeur/Plateforme de base :**
- **GL.iNet GL-MT300N-V2 (Mango)**
  ![image](https://github.com/user-attachments/assets/d273a34d-5c2c-4d40-aaa7-115ea8371979)
  
  - Compatible OpenWrt (natif)
  - Processeur : MediaTek MT7628NN 580MHz
  - RAM : 128 Mo
  - Stockage : 16 Mo Flash
  - Coût approximatif : 25-30€
  - Avantages : Format compact, alimentation USB, port Ethernet

**Alimentation mobile :**
- Batterie USB externe (PowerBank)
- Câble micro-USB pour connexion

**Accessoires optionnels :**
- Clé USB pour extension de stockage

**Environnement de développement :**
- PC sous Linux/WSL pour compiler et déployer l'image OpenWrt
- Connexion Internet pour l'installation des paquets

**Budget estimatif total : 50-70€** (hors PC de développement)

### C. Vecteurs d'attaque potentiels

**Attaques Wi-Fi :**
- **Déauthentification Wi-Fi** : Déconnexion forcée de clients
  - *Faisabilité embarquée* : Élevée
  - *Cadre légal* : Autorisé uniquement sur réseaux possédés/autorisés
- **Capture de handshakes WPA/WPA2**
  - *Faisabilité embarquée* : Moyenne
  - *Cadre légal* : Légal en passif, autorisation requise pour déchiffrement
- **Evil Twin / Rogue AP**
  - *Faisabilité embarquée* : Moyenne
  - *Cadre légal* : Nécessite consentement des utilisateurs

**Attaques filaires :**
- **Capture automatisée de données réseau** (style Shark Jack)
  - *Faisabilité embarquée* : Élevée
  - *Cadre légal* : Légal sur réseaux autorisés uniquement

**Autres vecteurs :**
- **Reconnaissance passive** : Analyse des réseaux environnants
  - *Faisabilité embarquée* : Élevée
  - *Cadre légal* : Légal en mode non-intrusif

### D. Considérations juridiques

**Cadre d'utilisation légitime :**
   - Tests avec autorisation au préalable
   - Audits sur infrastructure personnelle ou autorisé
   - Recherche en environnement contrôlé

### E. Dossier d'achat / Liste de matériel pour Ynov

| Composant | Quantité | Prix unitaire | Total |
|-----------|----------|---------------|-------|
| Routeur GL.iNet GL-MT300N-V2 (Mango) | 1 | 30€ | 30€ |
| Batterie externe USB 5000mAh | 1 | 20€ | 20€ |
| Câble micro-USB | 1 | 5€ | 5€ |
| Clé USB 32GB (optionnelle) | 1 | 15€ | 15€ |
| **TOTAL** | | | **70€** |


---


## 2. **Développement des payloads**

### A. Payload 1: Scanner Wi-Fi

**Fonctionnalités:**
  - Détection des réseaux Wi-Fi environnants (SSID)
  - Analyse de la force du signal (RSSI)
  - Identification des réseaux ouverts vs sécurisés
  - Classification des types de chiffrement (WEP, WPA, WPA2, WPA3)

**Dépendances:**
  - `iw` / `iwlist` (outils natifs OpenWrt)
  - `wireless-tools`
  - `grep`
  - `awk`
  - `sed`
  - `coreutils`

**Voir Script `scanner_wifi.sh` dans le rep**

### B. Payload 2: Découverte d'hôtes réseau

**Fonctionnalités:**
- Scan ARP du réseau local
- Identification des hôtes actifs
- Résolution des adresses MAC
- Détection des types d'appareils courants

**Dépendances:**
- `arp-scan`
- `coreutils`
- `grep`
- `awk`
- `sed`

**Voir Script `discover.sh` dans le rep**

### C. Payload 3: Test de vulnérabilités basiques

**Fonctionnalités:**
- Détection de services courants (HTTP, SSH, Telnet, SMB)
- Analyse des versions de services
- Tests de vulnérabilités basiques (ports ouverts, authentification défaut)
- Génération de rapports synthétiques

**Dépendances:**
- `nmap`
- `coreutils`
- `grep`
- `awk`
- `sed`

**Voir Script `vuln.py` dans le rep**

Exemple du rapport fin de script :

Rapport de scan - Tue May 14 14:00:00 CEST 2025

192.168.1.10: 22/tcp open  ssh     OpenSSH 7.9
192.168.1.20: 80/tcp open  http    lighttpd 1.4.53
192.168.1.30: 445/tcp open microsoft-ds Windows 7 Professional 7601

Analyse des services sensibles :
22/tcp open ssh OpenSSH 7.9
⚠ Port SSH ouvert — vérifier les identifiants !
80/tcp open http lighttpd 1.4.53
⚠ Port HTTP ouvert — vérifier les interfaces web non sécurisées !
445/tcp open microsoft-ds Windows 7 Professional 7601
⚠ Port SMB ouvert — attention aux partages non protégés !

### D. Stratégie de déploiement sous JabberJaw

**Prérequis :**
- Installation d'OpenWrt custom jabberjaw
- Installation des dépendances : `iwlist`, `arp-scan`, `arping`, etc.

**Structure des fichiers:**
```
/root/
└── payloads/
    ├── scanner_wifi.py
    ├── discover.py
    ├── vuln.py
    ├── launcher.py
    └── results/
        ├── Scanner_wifi_results.json
        ├── discover_results.json
        └── vuln_results.json
```

## 3. **Prototypage et intégration**

Lors de la présentation, je montrerai la maquette physique du prototype, qui permettra de visualiser concrètement l’assemblage compact du dispositif, intégrant le routeur, la batterie et le câblage.
Malheureusement, il ne sera pas possible de lancer les scripts initialement prévus en raison d’un manque de stockage sur le système. 
L’autonomie et la stabilité du prototype seront néanmoins satisfaisantes et démontrées.

Des premiers tests auront été réalisés avec succès, mais le groupe aura dû réinitialiser plusieurs fois la maquette à cause de l’installation répétée de programmes trop volumineux.
Pour résoudre ce problème, trois scripts auront été réécrits en Shell avec des dépendances légères, afin qu’ils puissent être supportés par le système à l’avenir. 
Par manque de temps, ces scripts n’auront pas encore été intégrés au prototype au moment de la démonstration.

## 4. **Proof of Concept (POC)**

L’objectif principal de cette phase est de démontrer la viabilité de la solution dans un environnement contrôlé, avec une supervision automatisée. 
Plusieurs tâches étaient prévues, notamment l’automatisation du lancement des payloads au démarrage, l’envoi sécurisé des résultats via webhook (par exemple vers Discord), ainsi que des tests dans différents environnements réseau (Wi-Fi public, LAN restreint). 
Le suivi de la consommation énergétique et des performances faisait également partie des objectifs.

Cependant, par manque de temps, cette phase n’a pas pu être entièrement réalisée sur un environnement de test dédié. 
Les éléments prévus, comme l’intégration complète de l’automatisation et la validation dans des contextes variés, seront à approfondir dans une suite éventuelle du projet.

Les livrables attendus pour cette phase – notamment le tableau de logs d’exécution et le dossier de validation du POC – n’ont pas pu être finalisés dans les délais, mais les bases ont été posées pour permettre leur mise en œuvre ultérieure.

---

## CONCLUSION

### Contexte et défis

Ce projet partait d'une idée pertinente et prometteuse, mais s'est heurté à plusieurs défis majeurs :

- **Définition initiale insuffisante** : Le besoin / matériel a été mal défini (mal scopé), entraînant des retards en cascade
- **Retard matériel** : Livraison tardive du matériel en janvier
- **Ressources humaines limitées** : Absences pour raisons personnelles du chef de projet
- **Contraintes de temps** : Objectifs trop ambitieux par rapport au calendrier disponible

### Adaptations effectuées

Face à ces difficultés, plusieurs mesures ont été prises :
- Ajustement des objectifs et KPI en début d'année
- Alignement du planning sur la date réelle de réception du matériel

### Résultats

Bien que la présentation finale ait été impactée par l'absence des membres B1/B2 lors du dernier jour des YDAYS, le projet a abouti à :

- Un prototype fonctionnel, bien que partiellement achevé
- Un dispositif léger, flexible et personnalisable
- Une base technique comparable à un mini-PC sous Linux

### Perspectives futures

Ce premier prototype ouvre des possibilités pour l'avenir :

- **Réutilisation possible** : Le matériel peut être adapté à d'autres cas d'usage
- **Continuité potentielle** : Un autre groupe pourrait reprendre et améliorer le projet
- **Fondations solides** : Les bases techniques sont posées pour des développements futurs

## Conclusion

Bien que n'ayant pas atteint tous ses objectifs initiaux, ce projet constitue une première étape significative qui pourra être capitalisée dans le cadre de travaux ultérieurs.
