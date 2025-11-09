# Variables d'Environnement pour Render

Copiez ces variables dans les paramètres de votre service web sur Render :

## Variables Requises

```
NODE_ENV=production
PORT=10000
DB_HOST=<fourni-par-render>
DB_PORT=<fourni-par-render>
DB_USER=<fourni-par-render>
DB_PASSWORD=<fourni-par-render>
DB_NAME=<fourni-par-render>
DB_SSLMODE=require
```

## Variables Optionnelles (pour la première installation)

```
ADMIN_EMAIL=admin@example.com
ADMIN_PASSWORD=your_secure_password_here
ADMIN_FULLNAME=Admin User
```

## Variables pour Extensions

### Si vous utilisez AWS S3 pour le stockage de fichiers :
```
AWS_ACCESS_KEY_ID=your_aws_access_key
AWS_SECRET_ACCESS_KEY=your_aws_secret_key
AWS_REGION=us-east-1
S3_BUCKET=your-bucket-name
```

### Si vous utilisez SendGrid pour les emails :
```
SENDGRID_API_KEY=your_sendgrid_api_key
```

### Si vous utilisez Resend pour les emails :
```
RESEND_API_KEY=your_resend_api_key
```

### Si vous utilisez Stripe :
```
STRIPE_SECRET_KEY=your_stripe_secret_key
STRIPE_PUBLISHABLE_KEY=your_stripe_publishable_key
```

### Si vous utilisez PayPal :
```
PAYPAL_CLIENT_ID=your_paypal_client_id
PAYPAL_CLIENT_SECRET=your_paypal_secret
PAYPAL_MODE=sandbox
```

### Si vous utilisez Google Login :
```
GOOGLE_CLIENT_ID=your_google_client_id
GOOGLE_CLIENT_SECRET=your_google_client_secret
```

## Notes

- Les variables DB_* sont automatiquement fournies par Render si vous utilisez `render.yaml`
- Le PORT est automatiquement fourni par Render
- Ne commitez JAMAIS ces valeurs dans votre code Git

