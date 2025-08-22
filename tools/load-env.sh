#!/bin/bash

# Script pour charger les variables d'environnement
# Usage: source scripts/load-env.sh

ENV_FILE=".env"

if [ -f "$ENV_FILE" ]; then
    echo "📁 Chargement des variables d'environnement depuis $ENV_FILE"
    
    # Charger les variables d'environnement
    while IFS= read -r line; do
        # Ignorer les lignes vides et les commentaires
        if [[ ! -z "$line" && ! "$line" =~ ^# ]]; then
            export "$line"
            echo "✅ Variable chargée: ${line%%=*}"
        fi
    done < "$ENV_FILE"
    
    echo "✅ Variables d'environnement chargées avec succès"
else
    echo "⚠️  Fichier $ENV_FILE non trouvé"
    echo "📝 Créez le fichier avec vos variables d'environnement"
fi
