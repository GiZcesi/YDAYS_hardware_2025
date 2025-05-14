#!/bin/bash

WEBHOOK_URL="https://discord.com/api/webhooks/1356897371593900072/keP8xmXUyyIUI6cbSi3Uj5PHs2RCMdypMshNKfGJA9Pvni5VVNzRHzyh9xJTaFUq0Qvp"
MESSAGE="Voici le fichier de log :"
LOG_FILE="/home/johann/Desktop/fichier.log"

# Vérifier si le fichier existe
if [ ! -f "$LOG_FILE" ]; then
    echo "Erreur : $LOG_FILE n'existe pas."
    exit 1
fi

# Envoyer le fichier avec un message
curl -F "content=$MESSAGE" \
     -F "file=@$LOG_FILE" \
     "$WEBHOOK_URL"