# Utiliza una imagen base de PHP con Apache
FROM php:7.4-apache

# Establece el directorio de trabajo en el directorio raíz del servidor web
WORKDIR /var/www/html

# Copia los archivos de la aplicación al contenedor
COPY . /var/www/html

# Instala las dependencias de PHP necesarias para WordPress
RUN docker-php-ext-install mysqli && docker-php-ext-enable mysqli

# Configura las variables de entorno para la conexión a la base de datos
ENV WORDPRESS_DB_HOST=database \
    WORDPRESS_DB_USER=wordpress \
    WORDPRESS_DB_PASSWORD=password \
    WORDPRESS_DB_NAME=wordpress

# Expone el puerto 80 para el servidor web
EXPOSE 80

# Define el comando de inicio del contenedor
CMD ["apache2-foreground"]
