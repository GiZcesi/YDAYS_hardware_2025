#!/bin/sh

# Interface Wi-Fi à utiliser (à adapter si besoin, ex: wlan1)
INTERFACE="wlan0"

echo "🔍 Scan des réseaux Wi-Fi avec l'interface $INTERFACE..."
echo ""

# Lancer un scan Wi-Fi
iwinfo $INTERFACE scan | while read -r line; do
    case "$line" in
        "Cell "*)
            # Nouvelle cellule détectée, reset des valeurs
            SSID=""
            SIGNAL=""
            ENC=""
            ;;
        *ESSID:*)
            # Extraction du nom du réseau (SSID)
            SSID=$(echo "$line" | sed -n 's/.*ESSID: "\(.*\)"/\1/p')
            ;;
        *Signal:*)
            # Extraction de la puissance du signal
            SIGNAL=$(echo "$line" | sed -n 's/.*Signal: \([-0-9]*\).*/\1 dBm/p')
            ;;
        *Encryption:*)
            # Détection du type de chiffrement
            ENC=$(echo "$line" | sed -n 's/.*Encryption: //p')
            ;;
        *WPA2*)
            ENC_TYPE="WPA2"
            ;;
        *WPA3*)
            ENC_TYPE="WPA3"
            ;;
        *WPA*)
            ENC_TYPE="WPA"
            ;;
        *WEP*)
            ENC_TYPE="WEP"
            ;;
        *"not encrypted"*)
            ENC_TYPE="Ouvert (aucun chiffrement)"
            ;;
        "")
            # Si ligne vide => afficher les infos collectées
            if [ -n "$SSID" ]; then
                echo " SSID      : $SSID"
                echo "  Signal  : $SIGNAL"
                echo "  Sécurité : $ENC_TYPE"
                echo ""
            fi
            ;;
    esac
done
