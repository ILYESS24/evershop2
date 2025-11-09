# Déploiement EverShop sur Render.com

Ce projet est configuré pour être déployé sur Render.com.

## 🚀 Déploiement Rapide

### Méthode 1 : Blueprint (Recommandé - Automatique)

1. **Poussez votre code sur GitHub/GitLab/Bitbucket**

2. **Sur Render.com** :
   - Allez sur [dashboard.render.com](https://dashboard.render.com)
   - Cliquez sur "New +" → "Blueprint"
   - Connectez votre dépôt
   - Render détectera automatiquement `render.yaml`
   - Cliquez sur "Apply"

3. **C'est tout !** Render créera automatiquement :
   - ✅ Service web
   - ✅ Base de données PostgreSQL
   - ✅ Variables d'environnement

### Méthode 2 : Déploiement Manuel

Voir le guide complet : [GUIDE_DEPLOIEMENT_RENDER.md](./GUIDE_DEPLOIEMENT_RENDER.md)

## 📋 Après le Déploiement

Une fois le déploiement terminé, vous devez initialiser la base de données :

1. Allez dans votre service web sur Render
2. Cliquez sur "Shell"
3. Exécutez :
   ```bash
   npm run setup
   ```
4. Suivez les instructions pour créer votre utilisateur admin

## 🔧 Configuration

### Variables d'Environnement

Les variables suivantes sont automatiquement configurées par `render.yaml` :
- `NODE_ENV=production`
- `PORT` (fourni par Render)
- `DB_HOST`, `DB_PORT`, `DB_USER`, `DB_PASSWORD`, `DB_NAME` (depuis la base de données)
- `DB_SSLMODE=require`

### Variables Optionnelles

Pour la première installation, vous pouvez ajouter :
```
ADMIN_EMAIL=admin@example.com
ADMIN_PASSWORD=your_secure_password
ADMIN_FULLNAME=Admin User
```

## 📚 Documentation

- [Guide Complet de Déploiement](./GUIDE_DEPLOIEMENT_RENDER.md)
- [Variables d'Environnement](./ENV_TEMPLATE.md)
- [Documentation EverShop](https://evershop.io/docs)

## ⚠️ Notes Importantes

1. **Premier déploiement** : Le build peut prendre 10-15 minutes
2. **Plan Starter** : L'application se met en veille après 15 minutes d'inactivité
3. **Stockage de fichiers** : Configurez S3 ou Azure pour les uploads (voir guide)
4. **Base de données** : Gratuite pendant 90 jours, puis payante

## 🆘 Support

- Logs : Vérifiez l'onglet "Logs" de votre service sur Render
- Documentation Render : https://render.com/docs
- Documentation EverShop : https://evershop.io/docs

