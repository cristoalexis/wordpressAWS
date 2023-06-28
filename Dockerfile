# Utilizamos una imagen base de WordPress
FROM wordpress:latest

# Copiamos nuestro archivo de configuración personalizado de Apache
COPY wordpress.conf /etc/apache2/sites-available/000-default.conf

# Copiamos el archivo .htaccess para la reescritura de URLs
COPY .htaccess /var/www/html/.htaccess

# Establecemos los permisos adecuados en el directorio de WordPress
RUN chown -R www-data:www-data /var/www/html

# Exponemos el puerto 80 para acceder a la aplicación
EXPOSE 80

# Comando de inicio para Apache
CMD ["apache2-foreground"]


