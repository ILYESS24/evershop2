# Guide de Déploiement sur Railway.app

Railway est la solution la plus simple pour déployer EverShop. Tout est automatique !

## 🚀 Déploiement en 5 minutes

### Étape 1 : Créer un compte Railway

1. Allez sur [railway.app](https://railway.app)
2. Cliquez sur "Start a New Project"
3. Connectez-vous avec GitHub

### Étape 2 : Déployer depuis GitHub

1. Cliquez sur "New Project"
2. Sélectionnez "Deploy from GitHub repo"
3. Choisissez votre repository : `ILYESS24/evershop2`
4. Railway détecte automatiquement que c'est une app Node.js

### Étape 3 : Ajouter PostgreSQL

1. Dans votre projet Railway, cliquez sur "+ New"
2. Sélectionnez "Database" → "Add PostgreSQL"
3. Railway crée automatiquement la base de données

### Étape 4 : Configurer les Variables d'Environnement

Railway injecte automatiquement les variables PostgreSQL ! Mais vous pouvez vérifier :

1. Allez dans votre service web
2. Onglet "Variables"
3. Vérifiez que ces variables sont présentes (elles devraient être automatiques) :

```
NODE_ENV=production
DB_HOST=<automatique>
DB_PORT=<automatique>
DB_USER=<automatique>
DB_PASSWORD=<automatique>
DB_NAME=<automatique>
DB_SSLMODE=no-verify
```

### Étape 5 : Configurer le Build (si nécessaire)

1. Allez dans votre service web
2. Onglet "Settings"
3. Vérifiez les commandes :
   - **Build Command** : `npm install && npm run compile:db && npm run compile && npm run build`
   - **Start Command** : `npm run start`

### Étape 6 : Déployer

Railway déploie automatiquement ! Attendez quelques minutes.

## 🔧 Configuration Post-Déploiement

### Initialiser la Base de Données

Une fois déployé :

1. Allez dans votre service web sur Railway
2. Cliquez sur "View Logs" ou "Open Terminal"
3. Exécutez :
   ```bash
   npm run setup
   ```
4. Suivez les instructions pour créer votre utilisateur admin

### Seed de Données (Optionnel)

```bash
npm run seed
```

## ✅ Avantages de Railway

- ✅ **Configuration automatique** - Détecte Node.js automatiquement
- ✅ **PostgreSQL inclus** - Création automatique de la base de données
- ✅ **Variables automatiques** - Injection automatique des variables DB_*
- ✅ **Déploiement automatique** - Déploie à chaque push sur GitHub
- ✅ **Plan gratuit** - $5 de crédit gratuit par mois
- ✅ **Simple** - Pas besoin de configuration complexe

## 🔍 Vérification

1. **Logs** : Allez dans "View Logs" pour voir les logs en temps réel
2. **URL** : Railway génère automatiquement une URL (ex: `https://votre-app.up.railway.app`)
3. **Admin** : Accédez à `https://votre-url.up.railway.app/admin`

## 🐛 Dépannage

### L'application ne démarre pas
- Vérifiez les logs dans Railway
- Vérifiez que toutes les variables d'environnement sont présentes
- Vérifiez que PostgreSQL est bien connecté

### Erreur de connexion à la base de données
- Vérifiez que PostgreSQL est créé et en cours d'exécution
- Vérifiez que `DB_SSLMODE=no-verify` est défini

### Build échoue
- Vérifiez que les commandes de build sont correctes
- Vérifiez les logs de build

## 📚 Ressources

- [Documentation Railway](https://docs.railway.app)
- [Documentation EverShop](https://evershop.io/docs)

---

**C'est tout ! Railway est vraiment la solution la plus simple. 🎉**

