#!/bin/bash

# Script pour créer une Pull Request pour la Phase 1.2
# Usage: ./create-pr.sh [GITHUB_TOKEN]

# Charger les variables d'environnement depuis .env si le fichier existe
if [ -f ".env" ]; then
    export $(cat .env | grep -v '^#' | xargs)
fi

GITHUB_TOKEN=${1:-$GITHUB_TOKEN}
REPO="nmoral/go-to-extension"
BASE_BRANCH="main"
HEAD_BRANCH="feature/phase-1.2-plugin-system"

if [ -z "$GITHUB_TOKEN" ]; then
    echo "❌ Erreur: Token GitHub requis"
    echo "Usage: ./create-pr.sh [GITHUB_TOKEN]"
    echo "Ou définissez la variable d'environnement GITHUB_TOKEN"
    exit 1
fi

echo "🚀 Création de la Pull Request pour la Phase 1.2..."

# Données de la Pull Request
PR_BODY=$(cat << 'EOF'
# Phase 1.2 - Architecture Plugin-Based Déportée

## 🎯 Objectifs

Cette PR implémente l'architecture plugin-based déportée qui permet à l'extension Code Navigator Pro de s'adapter automatiquement aux technologies présentes dans le projet en chargeant dynamiquement les plugins appropriés depuis des repositories externes.

## ✅ Fonctionnalités Implémentées

### 1. Système de Détection Automatique des Technologies
- Détection par fichiers de configuration (package.json, composer.json, go.mod, etc.)
- Détection par extensions de fichiers (.js, .ts, .php, .go, .py, .rs, etc.)
- Détection par structure de projet (node_modules, vendor, target, etc.)
- Support de 15+ technologies principales
- Calcul de niveau de confiance pour chaque technologie

### 2. Système de Chargement Dynamique de Plugins
- Téléchargement depuis GitHub/GitLab
- Validation d'intégrité des plugins (checksums)
- Gestion de cache local
- Gestion des erreurs et fallback
- Installation automatique avec gestion des dépendances

### 3. Registry de Plugins Multi-Repositories
- Enregistrement/désenregistrement de plugins
- Résolution de conflits de versions
- Synchronisation avec repositories distants
- Gestion des dépendances entre plugins
- Persistance de l'état du registry

### 4. Système d'Événements Inter-Plugins
- Pattern publication/abonnement
- Middleware pour filtrage et validation
- Historique des événements
- Statistiques de performance
- Événements standardisés du système

### 5. Système de Logging et Monitoring
- Logs multi-niveaux (DEBUG, INFO, WARN, ERROR)
- Mesure de performance des opérations
- Persistance dans des fichiers avec rotation
- Export des logs pour debugging
- Statistiques de performance

## 📁 Fichiers Ajoutés/Modifiés

### Nouveaux Fichiers
- `src/types/plugin.ts` - Interfaces TypeScript pour le système de plugins
- `src/core/plugin-system/detector/technology-detector.ts` - Détection automatique des technologies
- `src/core/plugin-system/loader/plugin-loader.ts` - Chargement dynamique de plugins
- `src/core/plugin-system/registry/plugin-registry.ts` - Registry multi-repositories
- `src/core/plugin-system/api/event-bus.ts` - Système d'événements inter-plugins
- `src/core/plugin-system/index.ts` - Exports principaux du système
- `src/utils/logger.ts` - Système de logging structuré
- `plugins/example-javascript/` - Exemple de plugin JavaScript
- `docs/PHASE_1_2_PLUGIN_SYSTEM.md` - Documentation complète
- `PHASE_1_2_SUMMARY.md` - Résumé des accomplissements

### Fichiers Modifiés
- `src/extension.ts` - Intégration du système de plugins

## 🔧 Architecture

L'architecture plugin-based déportée comprend :

1. **Détection Automatique** : Identifie les technologies du projet
2. **Chargement Dynamique** : Télécharge les plugins appropriés
3. **Registry Centralisé** : Gère les plugins et leurs dépendances
4. **Communication Événementielle** : Coordination entre composants
5. **Monitoring Complet** : Logging et métriques de performance

## 🚀 Utilisation

L'extension détecte automatiquement les technologies au démarrage et charge les plugins appropriés. Les développeurs peuvent également :

- Utiliser les commandes VS Code pour gérer les plugins
- Synchroniser avec les repositories de plugins
- Consulter les logs et métriques de performance

## 📊 Métriques

- **Lignes de code :** ~3,400 lignes
- **Fichiers créés :** 12 fichiers
- **Tests :** Structure de base (à compléter)
- **Documentation :** ✅ Complète
- **Compilation :** ✅ Sans erreurs

## 🔄 Prochaines Étapes

Cette PR pose les fondations pour :
- **Phase 2** : Marketplace et plugins officiels
- **Phase 3** : Moteur d'analyse intelligent par plugin
- **Phase 4** : Navigation contextuelle par plugin

## 🧪 Tests

- ✅ Compilation TypeScript sans erreurs
- ✅ Structure de base des tests en place
- ⏳ Tests unitaires à implémenter dans les phases suivantes

## 📝 Notes

- L'architecture est extensible et modulaire
- Le système de plugins est sécurisé avec validation d'intégrité
- La documentation est complète et détaillée
- L'exemple de plugin JavaScript démontre l'utilisation du système

---

**Type :** feature
**Breaking Changes :** Non
**Tests :** Structure de base
**Documentation :** ✅ Complète
EOF
)

# Créer le JSON pour l'API
PR_DATA=$(cat << EOF
{
  "title": "feat: Phase 1.2 - Architecture Plugin-Based Déportée",
  "body": $(echo "$PR_BODY" | jq -Rs .),
  "head": "$HEAD_BRANCH",
  "base": "$BASE_BRANCH",
  "draft": false
}
EOF
)

# Créer la Pull Request
RESPONSE=$(curl -s -X POST \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Content-Type: application/json" \
  -d "$PR_DATA" \
  "https://api.github.com/repos/$REPO/pulls")

# Vérifier la réponse
if echo "$RESPONSE" | grep -q '"number"'; then
    PR_NUMBER=$(echo "$RESPONSE" | grep -o '"number":[0-9]*' | cut -d':' -f2)
    PR_URL=$(echo "$RESPONSE" | grep -o '"html_url":"[^"]*"' | cut -d'"' -f4)
    
    echo "✅ Pull Request créée avec succès !"
    echo "📋 Numéro: #$PR_NUMBER"
    echo "🔗 URL: $PR_URL"
    
    # Ajouter des labels
    curl -s -X POST \
      -H "Authorization: token $GITHUB_TOKEN" \
      -H "Accept: application/vnd.github.v3+json" \
      -d '{"labels":["phase-1.2", "plugin-system", "architecture", "feature"]}' \
      "https://api.github.com/repos/$REPO/issues/$PR_NUMBER/labels" > /dev/null
    
    echo "🏷️ Labels ajoutés: phase-1.2, plugin-system, architecture, feature"
    
else
    echo "❌ Erreur lors de la création de la Pull Request:"
    echo "$RESPONSE"
    exit 1
fi
