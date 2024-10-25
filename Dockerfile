# Utiliser une image de base NGINX
FROM nginx:latest

# Installer le package 'file'
RUN apt-get update && apt-get install -y file && rm -rf /var/lib/apt/lists/*

# Copier le fichier de configuration NGINX personnalisé
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Copier les fichiers HTML du site dans le dossier cible de NGINX
COPY html/ /var/concentration/html/

# Exposer le port 80 pour accéder au site
EXPOSE 80

# Démarrer le serveur NGINX
CMD ["nginx", "-g", "daemon off;"]
