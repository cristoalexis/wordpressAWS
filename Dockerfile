
FROM wordpress:latest

# Copia el archivo de configuración de Apache con la opción de mod_rewrite habilitada
COPY ./apache-config.conf /etc/apache2/conf-available/
RUN a2enconf apache-config

# Establece el directorio de trabajo
WORKDIR /var/www/html

# Descarga e instala WordPress
RUN set -ex; \
    curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz; \
    tar -xzf wordpress.tar.gz --strip-components=1; \
    rm wordpress.tar.gz; \
    chown -R www-data:www-data .

# Expone el puerto 80
EXPOSE 80

# Inicia el servidor Apache
CMD ["apache2-foreground"]
