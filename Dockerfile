

# Utilizamos la imagen base de PHP con Apache
FROM php:7.4-apache

# Actualizamos los paquetes del sistema
RUN apt-get update

# Instalamos extensiones de PHP necesarias para WordPress
RUN docker-php-ext-install mysqli gd

# Copiamos los archivos de WordPress al directorio de trabajo
COPY wordpress /var/www/html

# Establecemos los permisos adecuados para los archivos de WordPress
RUN chown -R www-data:www-data /var/www/html

# Exponemos el puerto 80 para acceder a la aplicación
EXPOSE 80

# Iniciamos el servidor Apache en primer plano
CMD ["apache2-foreground"]
