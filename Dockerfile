# Utiliza la imagen oficial de WordPress como base
FROM wordpress

# Copia el archivo wp-config.php al directorio de WordPress
COPY wp-config.php /var/www/html/wp-config.php

