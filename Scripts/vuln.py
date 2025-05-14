#!/bin/sh

# Interface réseau à utiliser
INTERFACE="br-lan"
# IP cible ou plage (par défaut : le réseau local entier)
CIBLES="192.168.1.0/24"

# Fichier rapport
RAPPORT="/tmp/rapport_reseau.txt"
echo "📄 Rapport de scan - $(date)" > "$RAPPORT"

echo " Scan du réseau : $CIBLES"
echo "  Interface utilisée : $INTERFACE"
echo " Rapport : $RAPPORT"
echo ""

# Lancer un scan nmap (détection des ports, services, versions)
nmap -sS -sV -O --open "$CIBLES" -e "$INTERFACE" -p 22,23,80,139,445 > /tmp/scan_tmp.txt

# Extraire les hôtes actifs et leurs services
cat /tmp/scan_tmp.txt | awk '
/Nmap scan report for/ { ip=$NF }
/open/ { print ip ": " $0 }
' >> "$RAPPORT"

# Chercher des services à risque connus (authentifications par défaut connues)
echo "\n Analyse des services sensibles :" >> "$RAPPORT"
grep -E "22/tcp.*open.*ssh|23/tcp.*open.*telnet|80/tcp.*open.*http|445/tcp.*open.*microsoft-ds" /tmp/scan_tmp.txt | while read -r line; do
    echo "$line" >> "$RAPPORT"
    case "$line" in
        *ssh*)
            echo "⚠  Port SSH ouvert — vérifier les identifiants !" >> "$RAPPORT"
            ;;
        *telnet*)
            echo "⚠  Port Telnet ouvert — très vulnérable si mot de passe par défaut !" >> "$RAPPORT"
            ;;
        *http*)
            echo "⚠  Port HTTP ouvert — vérifier les interfaces web non sécurisées !" >> "$RAPPORT"
            ;;
        *microsoft-ds*)
            echo "⚠  Port SMB ouvert — attention aux partages non protégés !" >> "$RAPPORT"
            ;;
    esac
done

echo "\n Scan terminé. Rapport disponible ici : $RAPPORT"
