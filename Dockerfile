FROM php:7.4-apache
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libzip-dev \
    unzip

RUN a2enmod rewrite

WORKDIR /var/www/html
COPY wordpress .

EXPOSE 80

