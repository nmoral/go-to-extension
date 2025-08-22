#!/bin/bash

# Script pour configurer les variables d'environnement
# Usage: ./scripts/setup-env.sh

ENV_FILE=".env"

echo "🔐 Configuration des variables d'environnement"
echo "=============================================="

# Vérifier si le fichier .env existe déjà
if [ -f "$ENV_FILE" ]; then
    echo "⚠️  Le fichier $ENV_FILE existe déjà"
    read -p "Voulez-vous le remplacer ? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "❌ Configuration annulée"
        exit 1
    fi
fi

# Demander le token GitHub
echo ""
echo "🔑 Token GitHub"
echo "---------------"
read -p "Entrez votre token GitHub (ou appuyez sur Entrée pour utiliser le token actuel): " GITHUB_TOKEN_INPUT

if [ -z "$GITHUB_TOKEN_INPUT" ]; then
    GITHUB_TOKEN_INPUT="$GITHUB_TOKEN"
fi

if [ -z "$GITHUB_TOKEN_INPUT" ]; then
    echo "❌ Token GitHub requis"
    exit 1
fi

# Créer le fichier .env
cat > "$ENV_FILE" << EOF
# Configuration GitHub
GITHUB_TOKEN=$GITHUB_TOKEN_INPUT

# Configuration de l'extension
EXTENSION_NAME=code-navigator-pro
EXTENSION_VERSION=0.2.0

# Configuration des repositories
DEFAULT_REPOSITORY=nmoral/go-to-extension
EOF

echo ""
echo "✅ Fichier $ENV_FILE créé avec succès"
echo "📁 Contenu du fichier:"
echo "======================"
cat "$ENV_FILE" | sed 's/GITHUB_TOKEN=.*/GITHUB_TOKEN=***HIDDEN***/'

echo ""
echo "🔒 Sécurité:"
echo "- Le fichier .env est dans .gitignore"
echo "- Le token ne sera pas commité dans Git"
echo "- Utilisez 'source scripts/load-env.sh' pour charger les variables"

echo ""
echo "🚀 Pour utiliser les variables d'environnement:"
echo "source scripts/load-env.sh"
echo "ou"
echo "export \$(cat .env | xargs)"
