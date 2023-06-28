# Utiliza la imagen base de WordPress
FROM wordpress:latest

# Variables de entorno para la configuración de la base de datos
ENV WORDPRESS_DB_HOST wordpressdb-instance-1.cp9fc77m67kj.us-east-1.rds.amazonaws.com
ENV WORDPRESS_DB_NAME wordpressdb
ENV WORDPRESS_DB_USER admin
ENV WORDPRESS_DB_PASSWORD Cristobal123

# Copia el archivo de configuración personalizado a la ubicación correcta
COPY wp-config.php /var/www/html/wp-config.php


