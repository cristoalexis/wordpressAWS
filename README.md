# WordpressAWS
# Proyecto de Implementación de Aplicación Web con Docker y GitHub
Este proyecto tiene como objetivo desplegar una aplicación web utilizando contenedores Docker y GitHub para el control de versiones y colaboración en el desarrollo del código. A continuación se detallan los pasos realizados hasta el momento.

# Descripción del Proyecto
El proyecto consiste en implementar una aplicación web sencilla utilizando contenedores Docker y GitHub. La aplicación seleccionada es WordPress.

# Pasos Realizados
Creación del repositorio en GitHub: Se creó un repositorio en GitHub para el proyecto.

Configuración del repositorio: Se configuró correctamente el repositorio, incluyendo el archivo README, la estructura de carpetas y los archivos de configuración iniciales.

# Creación del archivo Dockerfile: Se creó un archivo Dockerfile que define la imagen de Docker para la aplicación. El Dockerfile contiene los siguientes pasos:

Se utiliza la imagen base php:7.4-apache.
Se actualizan los paquetes del sistema y se instalan las dependencias necesarias para la aplicación web.
Se habilita el módulo rewrite de Apache.
Se establece el directorio de trabajo en /var/www/html.
Se copian los archivos de la aplicación web en el directorio de trabajo.
# Construcción de la imagen Docker: 
Se construyó la imagen Docker utilizando el comando docker build. La imagen se etiquetó como wordpresscris.

# Ejecución del contenedor:
Se ejecutó un contenedor a partir de la imagen wordpresscris utilizando el comando docker run.

# Verificación del funcionamiento: 
Se verificó el funcionamiento de la aplicación web accediendo a la dirección IP del contenedor.
