FROM php:7.4-fpm

# Instala las dependencias necesarias
RUN apt-get update && apt-get install -y \
    libjpeg-dev \
    libpng-dev \
    libzip-dev \
    unzip \
    curl

# Instala las extensiones de PHP requeridas por WordPress
RUN docker-php-ext-configure gd --with-jpeg && \
    docker-php-ext-install -j$(nproc) gd mysqli zip

# Descarga e instala WordPress
RUN curl -o wordpress.tar.gz -SL https://wordpress.org/latest.tar.gz && \
    tar -xzf wordpress.tar.gz -C /var/www/html --strip-components=1 && \
    rm wordpress.tar.gz

# Establece los permisos correctos para el directorio de WordPress
RUN chown -R www-data:www-data /var/www/html

# Expone el puerto 80 (puerto por defecto de HTTP)
EXPOSE 80

# Configura el directorio de trabajo
WORKDIR /var/www/html

# Configura el punto de entrada del contenedor
CMD ["php", "-S", "0.0.0.0:80", "-t", "."]

