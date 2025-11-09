# Guide de Déploiement sur Fly.io

Fly.io est une autre excellente option pour déployer EverShop rapidement.

## 🚀 Déploiement Rapide

### Étape 1 : Installer Fly CLI

```bash
# Windows (PowerShell)
iwr https://fly.io/install.ps1 -useb | iex

# Ou téléchargez depuis https://fly.io/docs/hands-on/install-flyctl/
```

### Étape 2 : Se connecter

```bash
fly auth login
```

### Étape 3 : Déployer

```bash
# Dans le dossier du projet
fly launch

# Fly va vous poser quelques questions :
# - App name: evershop (ou votre nom)
# - Region: iad (ou la région la plus proche)
# - PostgreSQL: Oui
# - Redis: Non (optionnel)
```

### Étape 4 : Configurer PostgreSQL

Fly crée automatiquement PostgreSQL. Les variables sont injectées automatiquement.

### Étape 5 : Initialiser la base de données

```bash
fly ssh console
npm run setup
```

## ✅ Avantages Fly.io

- ✅ **Gratuit** - Plan gratuit généreux
- ✅ **Rapide** - Déploiement en quelques minutes
- ✅ **Global** - Déploiement dans plusieurs régions
- ✅ **Simple** - Configuration automatique

## 📚 Documentation

- [Documentation Fly.io](https://fly.io/docs)

