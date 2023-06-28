# Imagen base de PHP con Apache
FROM php:7.4-apache

# Variables de entorno de WordPress
ENV WORDPRESS_VERSION 5.8
ENV WORDPRESS_SHA1 0253e268dd8b77ce022bea75b1de16d80a244eba

# Descargar e instalar WordPress
RUN set -ex; \
    curl -o wordpress.tar.gz -SL https://wordpress.org/wordpress-${WORDPRESS_VERSION}.tar.gz; \
    echo "$WORDPRESS_SHA1 *wordpress.tar.gz" | sha1sum -c -; \
    tar -xzf wordpress.tar.gz -C /var/www/html/; \
    rm wordpress.tar.gz; \
    chown -R www-data:www-data /var/www/html/

# Configuración de Apache
RUN a2enmod rewrite

# Puerto expuesto por Apache
EXPOSE 80

# Punto de entrada del contenedor
CMD ["apache2-foreground"]
