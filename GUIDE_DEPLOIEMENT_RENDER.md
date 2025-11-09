# Guide de Déploiement sur Render.com

Ce guide vous explique comment déployer votre application EverShop sur Render.com.

## 📋 Prérequis

1. Un compte GitHub/GitLab/Bitbucket avec votre code EverShop
2. Un compte Render.com (gratuit disponible)
3. Votre code doit être dans un dépôt Git

## 🚀 Étapes de Déploiement

### Option 1 : Déploiement Automatique avec render.yaml (Recommandé)

1. **Assurez-vous que votre code est sur GitHub/GitLab/Bitbucket**
   - Poussez votre code vers votre dépôt Git
   - Le fichier `render.yaml` est déjà configuré dans le projet

2. **Connectez votre dépôt à Render**
   - Allez sur [dashboard.render.com](https://dashboard.render.com)
   - Cliquez sur "New +" → "Blueprint"
   - Connectez votre dépôt Git
   - Render détectera automatiquement le fichier `render.yaml`

3. **Render créera automatiquement** :
   - Un service web (application)
   - Une base de données PostgreSQL
   - Toutes les variables d'environnement nécessaires

4. **Le déploiement commencera automatiquement**

### Option 2 : Déploiement Manuel

#### Étape 1 : Créer la Base de Données PostgreSQL

1. Sur le dashboard Render, cliquez sur "New +" → "PostgreSQL"
2. Configurez :
   - **Name**: `evershop-db`
   - **Database**: `evershop`
   - **User**: `evershop_user`
   - **Plan**: Starter (gratuit) ou supérieur
   - **Region**: Choisissez la région la plus proche
3. Cliquez sur "Create Database"
4. Notez les informations de connexion (host, port, user, password, database)

#### Étape 2 : Créer le Service Web

1. Sur le dashboard Render, cliquez sur "New +" → "Web Service"
2. Connectez votre dépôt Git
3. Configurez le service :
   - **Name**: `evershop`
   - **Environment**: `Node`
   - **Region**: Même région que la base de données
   - **Branch**: `main` ou `master` (selon votre dépôt)
   - **Root Directory**: `/` (racine du projet)
   - **Build Command**: 
     ```bash
     npm install && npm run compile && npm run build
     ```
   - **Start Command**: 
     ```bash
     npm run start
     ```

#### Étape 3 : Configurer les Variables d'Environnement

Dans les paramètres du service web, ajoutez ces variables d'environnement :

```
NODE_ENV=production
PORT=10000
DB_HOST=<votre-host-postgres>
DB_PORT=<votre-port-postgres>
DB_USER=<votre-user-postgres>
DB_PASSWORD=<votre-password-postgres>
DB_NAME=<votre-database-name>
DB_SSLMODE=require
```

**Note**: Render fournit automatiquement le `PORT`, vous pouvez utiliser `PORT` directement.

Pour obtenir les valeurs de la base de données :
- Allez dans votre service PostgreSQL sur Render
- Dans l'onglet "Info", vous trouverez toutes les informations de connexion

#### Étape 4 : Déployer

1. Cliquez sur "Create Web Service"
2. Render commencera le build automatiquement
3. Attendez la fin du build (peut prendre 5-10 minutes la première fois)

## 🔧 Configuration Post-Déploiement

### Première Installation

Une fois le déploiement terminé, vous devez initialiser la base de données :

1. **Option A : Via Render Shell**
   - Allez dans votre service web sur Render
   - Cliquez sur "Shell"
   - Exécutez :
     ```bash
     npm run setup
     ```
   - Suivez les instructions pour créer un utilisateur admin

2. **Option B : Via Variables d'Environnement**
   - Ajoutez ces variables avant le premier déploiement :
     ```
     ADMIN_EMAIL=admin@example.com
     ADMIN_PASSWORD=your_secure_password
     ADMIN_FULLNAME=Admin User
     ```
   - Puis exécutez `npm run setup` via le Shell

### Seed de Données (Optionnel)

Pour ajouter des données de démonstration :
```bash
npm run seed
```

## 🔍 Vérification du Déploiement

1. **Vérifiez les logs** :
   - Allez dans votre service web
   - Onglet "Logs"
   - Vérifiez qu'il n'y a pas d'erreurs

2. **Testez l'application** :
   - Cliquez sur l'URL fournie par Render (ex: `https://evershop.onrender.com`)
   - Vous devriez voir la page d'accueil

3. **Accédez à l'admin** :
   - Allez sur `https://votre-url.onrender.com/admin`
   - Connectez-vous avec les identifiants admin créés

## ⚙️ Configuration Avancée

### Variables d'Environnement Supplémentaires

Si vous utilisez des extensions ou des fonctionnalités spécifiques, vous pourriez avoir besoin de :

```
# Pour le stockage de fichiers (si vous utilisez S3)
AWS_ACCESS_KEY_ID=your_key
AWS_SECRET_ACCESS_KEY=your_secret
AWS_REGION=us-east-1
S3_BUCKET=your-bucket-name

# Pour les emails (si vous utilisez SendGrid)
SENDGRID_API_KEY=your_api_key

# Pour Stripe
STRIPE_SECRET_KEY=your_stripe_secret
STRIPE_PUBLISHABLE_KEY=your_stripe_publishable

# Pour PayPal
PAYPAL_CLIENT_ID=your_paypal_client_id
PAYPAL_CLIENT_SECRET=your_paypal_secret
```

### Stockage de Fichiers

Render ne fournit pas de stockage persistant pour les fichiers uploadés. Options :

1. **Utiliser une extension de stockage cloud** :
   - Extension S3 (AWS S3)
   - Extension Azure File Storage
   - Configurer dans les paramètres de l'application

2. **Utiliser Render Disk** (payant) :
   - Pour un stockage persistant local

### Domaine Personnalisé

1. Allez dans les paramètres de votre service web
2. Section "Custom Domains"
3. Ajoutez votre domaine
4. Suivez les instructions DNS

## 🐛 Dépannage

### Erreur : "Cannot find module"
- Vérifiez que `npm run compile` s'exécute correctement
- Vérifiez les logs de build

### Erreur de connexion à la base de données
- Vérifiez que `DB_SSLMODE=require` est défini
- Vérifiez que toutes les variables DB_* sont correctes
- Vérifiez que la base de données est dans la même région

### L'application ne démarre pas
- Vérifiez les logs pour les erreurs
- Vérifiez que le PORT est correctement configuré
- Vérifiez que `npm run build` s'est terminé avec succès

### Build échoue
- Vérifiez que toutes les dépendances sont dans `package.json`
- Vérifiez les logs de build pour les erreurs spécifiques
- Assurez-vous que Node.js 18+ est utilisé

## 📊 Monitoring

Render fournit :
- **Logs en temps réel** : Onglet "Logs" de votre service
- **Métriques** : CPU, mémoire, requêtes
- **Health Checks** : Vérification automatique de la santé de l'application

## 💰 Coûts

- **Plan Starter** : Gratuit (avec limitations)
  - 750 heures/mois
  - Sleep après 15 minutes d'inactivité
  - Base de données PostgreSQL gratuite (90 jours, puis payante)

- **Plan Standard** : $7/mois
  - Pas de sleep
  - Meilleures performances
  - Support prioritaire

## 🔄 Mises à Jour

Les mises à jour sont automatiques si :
- Auto-deploy est activé (par défaut)
- Vous poussez vers la branche surveillée

Pour forcer un redéploiement :
- Allez dans votre service
- Cliquez sur "Manual Deploy" → "Deploy latest commit"

## 📚 Ressources

- [Documentation Render](https://render.com/docs)
- [Documentation EverShop](https://evershop.io/docs)
- [Support Render](https://render.com/support)

## ✅ Checklist de Déploiement

- [ ] Code poussé sur Git (GitHub/GitLab/Bitbucket)
- [ ] Base de données PostgreSQL créée
- [ ] Service web créé
- [ ] Variables d'environnement configurées
- [ ] Build réussi
- [ ] Application accessible
- [ ] Base de données initialisée (`npm run setup`)
- [ ] Admin créé et accessible
- [ ] Domaine personnalisé configuré (optionnel)
- [ ] Stockage de fichiers configuré (si nécessaire)

---

**Besoin d'aide ?** Consultez les logs de votre service sur Render ou la documentation EverShop.

