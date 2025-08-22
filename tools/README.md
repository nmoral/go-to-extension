# 🛠️ Outils de Configuration

Ce dossier contient les outils pour configurer et utiliser le projet de manière sécurisée.

## 🔐 Configuration Sécurisée

### Fichier .env

Le fichier `.env` contient les variables d'environnement sensibles (comme le token GitHub) et n'est **jamais commité** dans Git.

**Contenu typique :**
```bash
# Configuration GitHub
GITHUB_TOKEN=votre_token_ici

# Configuration de l'extension
EXTENSION_NAME=code-navigator-pro
EXTENSION_VERSION=0.2.0

# Configuration des repositories
DEFAULT_REPOSITORY=nmoral/go-to-extension
```

## 📁 Scripts Disponibles

### 1. `setup-env.sh` - Configuration Initiale

Configure le fichier `.env` de manière sécurisée.

**Usage :**
```bash
./tools/setup-env.sh
```

**Fonctionnalités :**
- Demande le token GitHub de manière interactive
- Crée le fichier `.env` avec les bonnes permissions
- Vérifie que le fichier est dans `.gitignore`
- Affiche des instructions de sécurité

### 2. `load-env.sh` - Chargement des Variables

Charge les variables d'environnement depuis le fichier `.env`.

**Usage :**
```bash
source tools/load-env.sh
```

**Fonctionnalités :**
- Charge automatiquement toutes les variables du fichier `.env`
- Ignore les commentaires et lignes vides
- Affiche les variables chargées
- Gère les erreurs si le fichier n'existe pas

## 🚀 Utilisation

### Première Configuration

1. **Configurer l'environnement :**
   ```bash
   ./tools/setup-env.sh
   ```

2. **Charger les variables :**
   ```bash
   source tools/load-env.sh
   ```

3. **Vérifier que tout fonctionne :**
   ```bash
   echo $GITHUB_TOKEN
   ```

### Utilisation Quotidienne

Pour charger les variables d'environnement dans chaque session :

```bash
# Ajouter à votre ~/.bashrc ou ~/.zshrc
source /chemin/vers/projet/tools/load-env.sh
```

Ou charger manuellement quand nécessaire :

```bash
source tools/load-env.sh
```

## 🔒 Sécurité

### Bonnes Pratiques

- ✅ **Le fichier `.env` est dans `.gitignore`**
- ✅ **Le token GitHub n'est jamais exposé dans Git**
- ✅ **Les scripts vérifient les permissions**
- ✅ **Les variables sont chargées de manière sécurisée**

### Vérifications

Pour vérifier que votre configuration est sécurisée :

```bash
# Vérifier que .env n'est pas dans Git
git status .env

# Vérifier que .env est dans .gitignore
grep -q "^\.env$" .gitignore && echo "✅ .env est dans .gitignore" || echo "❌ .env n'est pas dans .gitignore"

# Vérifier les permissions du fichier .env
ls -la .env
```

## 🐛 Dépannage

### Problèmes Courants

1. **Token GitHub invalide**
   - Vérifiez que le token a les bonnes permissions
   - Régénérez le token si nécessaire

2. **Fichier .env non trouvé**
   - Exécutez `./tools/setup-env.sh` pour le créer

3. **Variables non chargées**
   - Utilisez `source tools/load-env.sh` (pas `./tools/load-env.sh`)

4. **Permissions refusées**
   - Vérifiez les permissions du fichier `.env`
   - Utilisez `chmod 600 .env` si nécessaire

## 📝 Exemples

### Créer une Pull Request

```bash
# Charger les variables
source tools/load-env.sh

# Créer la PR
./create-pr.sh
```

### Utiliser l'API GitHub

```bash
# Charger les variables
source tools/load-env.sh

# Utiliser l'API
curl -H "Authorization: token $GITHUB_TOKEN" \
     -H "Accept: application/vnd.github.v3+json" \
     "https://api.github.com/repos/nmoral/go-to-extension"
```

---

**Note :** Ces outils sont conçus pour être sécurisés et ne jamais exposer vos tokens ou informations sensibles dans Git.
