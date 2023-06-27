# wordpressAWS
 Este repositorio contiene los archivos y configuraciones necesarios para implementar una aplicación web utilizando WordPress en contenedores Docker. El proyecto se enfoca en demostrar el uso de contenedores y GitHub en el proceso de despliegue de una aplicación web.
Configuración de WordPress en Docker
Este repositorio contiene los archivos necesarios para configurar un entorno de WordPress utilizando Docker.

Requisitos previos
Docker instalado en tu máquina local. Puedes obtener Docker desde el sitio web oficial de Docker y seguir las instrucciones de instalación para tu sistema operativo.
Pasos de configuración
Clona este repositorio en tu máquina local:

bash
Copy code
git clone <URL_DEL_REPOSITORIO>
Accede al directorio del repositorio:

bash
Copy code
cd <NOMBRE_DEL_REPOSITORIO>
Crea un archivo .env para configurar las variables de entorno de WordPress. Puedes utilizar el archivo .env.example como plantilla:

bash
Copy code
cp .env.example .env
Asegúrate de configurar adecuadamente las variables de entorno en el archivo .env según tus necesidades.

Construye la imagen de Docker utilizando el siguiente comando:

Copy code
docker build -t wordpresscris .
Ejecuta el contenedor de Docker utilizando el siguiente comando:

arduino
Copy code
docker run -d -p 80:80 --name wordpress-container wordpresscris
Esto ejecutará el contenedor y mapeará el puerto 80 de tu máquina local al puerto 80 del contenedor.

Accede a WordPress en tu navegador web:

arduino
Copy code
http://localhost
Si has configurado un puerto diferente en el paso anterior, asegúrate de utilizar el puerto correcto en la URL.

Sigue las instrucciones de WordPress para completar la instalación y configuración inicial.

Notas adicionales
Puedes detener el contenedor en cualquier momento utilizando el siguiente comando:

arduino
Copy code
docker stop wordpress-container
Para iniciar el contenedor nuevamente, utiliza el siguiente comando:

sql
Copy code
docker start wordpress-container
Puedes eliminar el contenedor cuando ya no lo necesites utilizando el siguiente comando:

bash
Copy code
docker rm wordpress-container
Si deseas eliminar la imagen de Docker, ejecuta el siguiente comando:

Copy code
docker rmi wordpresscris
