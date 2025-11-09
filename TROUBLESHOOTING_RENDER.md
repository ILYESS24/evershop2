# Dépannage - Problème de Connexion à la Base de Données

## Problème : `connect ECONNREFUSED ::1:5432`

Si vous voyez cette erreur, cela signifie que l'application essaie de se connecter à `localhost` au lieu d'utiliser les variables d'environnement de Render.

## Solutions

### Solution 1 : Vérifier les Variables d'Environnement sur Render

1. Allez sur [dashboard.render.com](https://dashboard.render.com)
2. Sélectionnez votre service web `evershop`
3. Allez dans l'onglet **"Environment"**
4. Vérifiez que toutes ces variables sont présentes :

```
DB_HOST=<votre-host-postgres>
DB_PORT=<votre-port-postgres>
DB_USER=<votre-user-postgres>
DB_PASSWORD=<votre-password-postgres>
DB_NAME=<votre-database-name>
DB_SSLMODE=require
NODE_ENV=production
PORT=<port-fourni-par-render>
```

### Solution 2 : Si les Variables ne sont pas Automatiquement Injectées

Si vous avez utilisé le **Blueprint** (render.yaml), les variables devraient être automatiquement configurées. Si ce n'est pas le cas :

1. Allez dans votre service PostgreSQL sur Render
2. Dans l'onglet **"Info"**, copiez toutes les informations de connexion
3. Allez dans votre service web
4. Onglet **"Environment"**
5. Ajoutez manuellement chaque variable :

```
DB_HOST=<copié depuis PostgreSQL Info>
DB_PORT=<copié depuis PostgreSQL Info>
DB_USER=<copié depuis PostgreSQL Info>
DB_PASSWORD=<copié depuis PostgreSQL Info>
DB_NAME=<copié depuis PostgreSQL Info>
DB_SSLMODE=require
```

### Solution 3 : Vérifier que le Service PostgreSQL est Créé

Assurez-vous que la base de données PostgreSQL a été créée :

1. Sur le dashboard Render, vérifiez qu'il y a un service **PostgreSQL** nommé `evershop-db`
2. Si ce n'est pas le cas, créez-le :
   - Cliquez sur "New +" → "PostgreSQL"
   - Nom : `evershop-db`
   - Plan : Starter (gratuit)
   - Database : `evershop`
   - User : `evershop_user`

### Solution 4 : Redémarrer le Service

Après avoir ajouté/modifié les variables d'environnement :

1. Allez dans votre service web
2. Cliquez sur **"Manual Deploy"** → **"Deploy latest commit"**
3. Ou redémarrez le service depuis l'onglet "Events"

## Vérification

Pour vérifier que les variables sont bien définies, vous pouvez :

1. Aller dans le **Shell** de votre service web sur Render
2. Exécuter :
   ```bash
   echo $DB_HOST
   echo $DB_PORT
   echo $DB_USER
   echo $DB_NAME
   ```

Si ces commandes retournent des valeurs vides, les variables ne sont pas définies.

## Note Importante

Les variables d'environnement définies dans `render.yaml` sont automatiquement injectées **seulement si** :
- Vous avez utilisé le **Blueprint** (render.yaml) pour créer le service
- Le service et la base de données ont été créés en même temps via le Blueprint

Si vous avez créé le service manuellement, vous devez ajouter les variables d'environnement manuellement.

