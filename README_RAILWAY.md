# Déploiement EverShop sur Railway.app

## 🚀 Déploiement Ultra-Rapide

### Méthode 1 : Déploiement Automatique (Recommandé)

1. **Allez sur [railway.app](https://railway.app)**
2. **Connectez-vous avec GitHub**
3. **Cliquez sur "New Project" → "Deploy from GitHub repo"**
4. **Sélectionnez `ILYESS24/evershop2`**
5. **C'est tout !** Railway configure tout automatiquement

### Méthode 2 : Via Railway CLI

```bash
# Installer Railway CLI
npm i -g @railway/cli

# Se connecter
railway login

# Initialiser le projet
railway init

# Déployer
railway up
```

## 📋 Après le Déploiement

1. **Ajoutez PostgreSQL** :
   - Dans votre projet Railway, cliquez sur "+ New"
   - Sélectionnez "Database" → "Add PostgreSQL"

2. **Initialisez la base de données** :
   - Allez dans "View Logs" ou "Open Terminal"
   - Exécutez : `npm run setup`

3. **Accédez à votre application** :
   - Railway génère automatiquement une URL
   - Admin : `https://votre-url.up.railway.app/admin`

## ⚙️ Configuration

Railway détecte automatiquement :
- ✅ Type d'application (Node.js)
- ✅ Commandes de build
- ✅ Variables d'environnement PostgreSQL

Le fichier `railway.json` est déjà configuré pour optimiser le déploiement.

## 📚 Documentation Complète

Voir [GUIDE_RAILWAY.md](./GUIDE_RAILWAY.md) pour plus de détails.

---

**Railway est la solution la plus simple pour déployer EverShop ! 🎉**

