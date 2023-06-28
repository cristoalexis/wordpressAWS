
# Utiliza una imagen base de PHP con Apache
FROM php:7.4-apache

# Actualiza el sistema y establece variables de entorno
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    unzip

# Habilita el módulo de Apache para reescritura de URL
RUN a2enmod rewrite

# Establece el directorio de trabajo en el contenedor
WORKDIR /var/www/html

# Copia los archivos de WordPress al contenedor
COPY wordpress .

# Copia el archivo de configuración de Apache
COPY wordpress.conf /etc/apache2/sites-available/000-default.conf

# Exponer el puerto 80 para acceder a la aplicación
EXPOSE 80

# Inicia el servidor Apache en primer plano
CMD ["apache2-foreground"]


