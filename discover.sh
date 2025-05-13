#!/bin/sh

# Interface réseau à utiliser (ex : br-lan ou eth0 selon la config OpenWrt)
INTERFACE="br-lan"

# S'assurer que l'interface existe
if ! ip link show "$INTERFACE" >/dev/null 2>&1; then
  echo "❌ Interface $INTERFACE introuvable."
  exit 1
fi

echo "🔍 Scan ARP sur le réseau local via $INTERFACE..."
echo ""

# Lancer le scan ARP
arp-scan --interface="$INTERFACE" --localnet | grep -v "Starting" | grep -v "Ending" | grep -v "^Interface" | while read -r IP MAC VENDOR; do
    # IP = première colonne
    # MAC = deuxième colonne
    # VENDOR = reste (constructeur ou type de périphérique)

    # Extraire les champs
    IP_ADDR=$(echo "$IP" | awk '{print $1}')
    MAC_ADDR=$(echo "$MAC" | awk '{print $1}')
    DEVICE_TYPE=$(echo "$VENDOR" | cut -d ' ' -f1-3)

    echo "💻 IP        : $IP_ADDR"
    echo "🔗 MAC       : $MAC_ADDR"
    echo "🏷️  Type      : $DEVICE_TYPE"
    echo ""
done
