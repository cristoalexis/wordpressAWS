# WordpressAWS
# FASE 1
# Despliegue de WordPress en una instancia EC2 de Amazon Linux

Este repositorio contiene los archivos necesarios para desplegar WordPress en una instancia EC2 de Amazon Linux utilizando Docker.

# Requisitos previos
- Una cuenta de AWS con acceso a EC2.
- Una instancia EC2 de Amazon Linux en funcionamiento.

# Configuración de la instancia EC2
1. Inicia sesión en la consola de AWS y navega hasta la sección de EC2.
2. Crea una nueva instancia EC2 de Amazon Linux.
3. Asigna una clave SSH a la instancia para poder acceder a ella posteriormente.
4. Asegúrate de tener los puertos 80 y 443 abiertos en el grupo de seguridad de la instancia EC2.

# Conexión a la instancia EC2
1. Abre una terminal en tu máquina local.
2. Conéctate a la instancia EC2 utilizando SSH:
# ## Clonar el repositorio
1. En la instancia EC2, asegúrate de tener Git instalado. Si no lo tienes, ejecuta el siguiente comando:
sudo yum install -y git

2. Clona este repositorio en la instancia EC2:
 # EN TERMINAL
 # git clone https://github.com/cristoalexis/wordpressAWS.git
# cd wordpressAWS
# docker build -t wordpress-image .
# docker run -d -p 80:80 --name my-wordpress-container wordpress-image
Este comando ejecuta el contenedor utilizando la imagen que acabamos de crear y mapea el puerto 80 de la instancia EC2 al puerto 80 del contenedor.
# Verifica que el contenedor se haya iniciado correctamente ejecutando el siguiente comando:
docker ps
Deberías ver el contenedor de WordPress en la lista.
# Ahora puedes acceder a WordPress en tu navegador web utilizando la dirección IP de tu instancia EC2. Asegúrate de tener el puerto 80 abierto en el grupo de seguridad de la instancia EC2.


# http://<DIRECCION_IP_DE_LA_INSTANCIA>
Reemplaza <DIRECCION_IP_DE_LA_INSTANCIA> con la dirección IP de tu instancia EC2.


Siguiendo estos pasos, deberías poder desplegar WordPress en tu instancia EC2 de Amazon Linux utilizando solo un archivo Dockerfile. Asegúrate de haber configurado correctamente el archivo Dockerfile para incluir todas las dependencias y configuraciones necesarias para ejecutar WordPress en el contenedor.

# sudo service docker start
# sudo usermod -a -G docker ec2-user
2. Cierra la sesión de SSH y vuelve a iniciar sesión para aplicar los cambios.
3. Instala Docker Compose en la instancia EC2. Ejecuta los siguientes comandos:
