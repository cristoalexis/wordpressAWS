# Establece la imagen base
FROM php:7.4-apache

# Instala las dependencias de WordPress
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    unzip

# Habilita los módulos necesarios de Apache
RUN a2enmod rewrite

# Configura el directorio de trabajo
WORKDIR /var/www/html

# Copia los archivos de WordPress al contenedor
COPY ../wordpress .

# Expone el puerto 80 para acceder a la aplicación web
EXPOSE 80

