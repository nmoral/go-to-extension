# 🚀 Configuration GitHub pour l'Extension Code Navigator Pro

Ce dossier contient les scripts pour automatiser la création des tâches GitHub à partir du plan de développement de l'extension Code Navigator Pro.

## 📋 Prérequis

### 1. Token GitHub
Vous devez créer un token d'accès personnel GitHub avec les permissions suivantes :

1. Allez sur [GitHub Settings > Developer settings > Personal access tokens](https://github.com/settings/tokens)
2. Cliquez sur "Generate new token (classic)"
3. Donnez un nom : `Cursor Extension Development`
4. Sélectionnez les permissions :
   - ✅ `repo` (accès complet aux repositories)
   - ✅ `workflow` (pour les actions GitHub)
   - ✅ `write:packages` (optionnel, pour publier des packages)
5. Cliquez sur "Generate token"
6. **IMPORTANT** : Copiez le token immédiatement (vous ne pourrez plus le voir après)

### 2. Repository GitHub
Assurez-vous que votre repository GitHub existe et que vous avez les droits d'écriture.

### 3. Outils requis
- `curl` (pour les requêtes HTTP)
- `bash` (pour exécuter les scripts)

## 🎯 Scripts disponibles

### 1. `run_github_setup.sh` (Script principal)
**Utilisation recommandée** - Orchestre tout le processus automatiquement.

```bash
chmod +x run_github_setup.sh
./run_github_setup.sh
```

Ce script va :
1. Configurer votre token GitHub et repository
2. Créer les labels pour organiser les tâches
3. Créer toutes les tâches du plan de développement

### 2. `setup_github_tasks.sh` (Configuration)
Configure votre token GitHub et repository de manière interactive.

```bash
chmod +x setup_github_tasks.sh
./setup_github_tasks.sh
```

### 3. `create_labels.sh` (Création des labels)
Crée automatiquement tous les labels nécessaires pour organiser les tâches.

```bash
chmod +x create_labels.sh
./create_labels.sh
```

### 4. `create_github_tasks.sh` (Création des tâches)
Crée toutes les tâches GitHub à partir du plan de développement.

```bash
chmod +x create_github_tasks.sh
./create_github_tasks.sh
```

## 🏷️ Labels créés

### Labels par phase
- `phase-1` à `phase-9` : Organisation par phase de développement

### Labels par type de fonctionnalité
- `infrastructure` : Infrastructure et configuration
- `detection` : Système de détection des technologies
- `plugin-system` : Système de plugins
- `api` : API et interfaces
- `registry` : Registry et gestion des plugins
- `marketplace` : Marketplace et catalogue
- `analysis` : Analyse de code
- `navigation` : Navigation et recherche
- `metrics` : Métriques et visualisation
- `collaboration` : Collaboration et partage
- `refactoring` : Refactoring et amélioration
- `ui` : Interface utilisateur
- `testing` : Tests et qualité
- `documentation` : Documentation

### Labels par priorité
- `high-priority` : Haute priorité
- `medium-priority` : Priorité moyenne
- `low-priority` : Basse priorité

### Labels par type de tâche
- `core-feature` : Fonctionnalité principale
- `feature` : Nouvelle fonctionnalité
- `enhancement` : Amélioration
- `bug` : Bug à corriger
- `good first issue` : Bon point de départ pour les contributeurs

### Labels par technologie
- `javascript` : JavaScript/TypeScript
- `php` : PHP
- `go` : Go
- `python` : Python
- `rust` : Rust
- `java` : Java

## 📝 Tâches créées

Le script créera **12 tâches principales** couvrant toutes les phases du plan de développement :

### Phase 1 : Architecture Plugin-Based et Infrastructure
1. **Configuration de l'environnement moderne**
   - Mise à jour des dépendances
   - Configuration TypeScript 5.x
   - Intégration des outils de développement
   - Configuration des tests

2. **Système de détection automatique des technologies**
   - Interface TechnologyDetector
   - Détection par écosystème

3. **Système de chargement dynamique de plugins**
   - Interface PluginLoader
   - Gestion des versions

4. **API de base pour les plugins**
   - Interface Plugin
   - Système d'événements

5. **Registry de plugins avec support multi-repositories**
   - Classe PluginRegistry
   - Gestion des dépendances

### Phase 2 : Système de Plugins Déportés et Marketplace
6. **Système de détection avancé**
   - Détection par fichiers de configuration
   - Détection par structure de projet

7. **Plugin Marketplace avancé**
   - Catalogue centralisé de plugins
   - Système de notation et commentaires
   - Installation/désinstallation en un clic

### Phase 3 : Moteur d'Analyse Intelligent par Plugin
8. **Analyseurs spécifiques par technologie**
   - Parser AST avec Tree-sitter
   - Analyseurs spécialisés par écosystème

### Phase 4 : Navigation Contextuelle par Plugin
9. **Smart Go-to-Definition par technologie**
   - Navigation adaptée par langage
   - Intégration avec les LSP existants

### Phase 5 : Analyse et Métriques par Plugin
10. **Métriques de code par technologie**
    - Complexité cyclomatique adaptée
    - Couverture de code par écosystème

### Phase 6 : Collaboration et Partage par Plugin
11. **Annotations de code par technologie**
    - Système d'annotations adapté
    - Synchronisation avec versioning

### Phase 7 : Automatisation et IA par Plugin
12. **Suggestions de refactoring par technologie**
    - Détection d'opportunités
    - Intégration avec outils de refactoring

### Phase 8 : Interface Utilisateur et Gestion des Plugins
13. **Interface de gestion des plugins déportés**
    - Dashboard de plugins actifs
    - Configuration par plugin
    - Gestion des mises à jour

### Phase 9 : Tests, Documentation et Publication
14. **Tests complets par plugin**
    - Tests unitaires
    - Tests d'intégration par technologie
    - Tests de performance

15. **Documentation complète**
    - Guide utilisateur
    - Documentation API
    - Guide de création de plugins

## 🔧 Configuration manuelle

Si vous préférez configurer manuellement, modifiez les variables dans les scripts :

```bash
# Dans create_github_tasks.sh et create_labels.sh
GITHUB_TOKEN="votre_token_ici"
REPO_OWNER="votre_username"
REPO_NAME="sources-extension"
```

## 🚨 Dépannage

### Erreur "Token invalide"
- Vérifiez que le token a les bonnes permissions
- Assurez-vous que le token n'a pas expiré
- Vérifiez que vous avez les droits sur le repository

### Erreur "Repository non trouvé"
- Vérifiez l'URL du repository
- Assurez-vous que le repository existe
- Vérifiez vos droits d'accès

### Erreur "curl not found"
- Installez curl : `sudo apt install curl` (Ubuntu/Debian)
- Ou : `brew install curl` (macOS)

## 📊 Résultat attendu

Après exécution du script, vous aurez :
- ✅ **15+ labels** pour organiser les tâches
- ✅ **15 tâches principales** avec checklists détaillées
- ✅ **Organisation par phase** et par type de fonctionnalité
- ✅ **Priorités définies** pour guider le développement

## 🎯 Prochaines étapes

1. **Vérifiez les tâches** créées sur GitHub
2. **Organisez en milestones** si nécessaire
3. **Assignez les tâches** aux membres de l'équipe
4. **Commencez le développement** en suivant les phases

## 💡 Conseils d'utilisation

- Utilisez les **labels** pour filtrer et organiser vos tâches
- Créez des **milestones** pour chaque phase
- Utilisez les **projects GitHub** pour le suivi visuel
- Activez les **notifications** pour suivre les mises à jour

---

**Dernière mise à jour :** $(date)
**Version :** 1.0
