# wordpress en AWS
Parte I
Despliegue de WordPress en una instancia EC2 de Amazon Linux 

[![N|Solid](https://logos-world.net/wp-content/uploads/2021/02/Docker-Symbol.png)](https://nodesource.com/products/nsolid)
[![N|Solid](https://th.bing.com/th/id/OIP.S-9EjIzAEYqbP1oktJVc5wAAAA?pid=ImgDet&rs=1)](https://nodesource.com/products/nsolid)

Este repositorio contiene los archivos necesarios para desplegar WordPress en una instancia EC2 de Amazon Linux utilizando Docker.

Requisitos previos
- Una cuenta de AWS con acceso a EC2.
- Una instancia EC2 de Amazon Linux en funcionamiento.


## Configuración de la instancia EC2

- Inicia sesión en la consola de AWS y navega hasta la sección de EC2.
- Crea una nueva instancia EC2 de Amazon Linux.
- Asigna una clave SSH a la instancia para poder acceder a ella posteriormente.
- Asegúrate de tener los puertos 80 y 443 abiertos en el grupo de seguridad de la instancia EC2.
## Conexión a la instancia EC2
- Abre una terminal en tu máquina local.
- Conéctate a la instancia EC2 utilizando SSH:
## Clonar el repositorio

> En la instancia EC2, asegúrate de tener Git instalado. Si no lo tienes, ejecuta el siguiente comando: sudo yum install -y git

## Clona este repositorio en la instancia EC2:
> EN TERMINAL
git clone https://github.com/cristoalexis/wordpressAWS.git
cd wordpressAWS
docker build -t wordpress-image .
docker run -d -p 80:80 --name my-wordpress-container wordpress-image
Este comando ejecuta el contenedor utilizando la imagen que acabamos de crear y mapea el puerto 80 de la instancia EC2 al puerto 80 del contenedor.

Verifica que el contenedor se haya iniciado correctamente ejecutando el siguiente comando:
> docker ps 
Deberías ver el contenedor de WordPress en la lista.

Ahora puedes acceder a WordPress en tu navegador web utilizando la dirección IP de tu instancia EC2. Asegúrate de tener el puerto 80 abierto en el grupo de seguridad de la instancia EC2.
> http://<DIRECCION_IP_DE_LA_INSTANCIA>
Reemplaza <DIRECCION_IP_DE_LA_INSTANCIA> con la dirección IP de tu instancia EC2.

Siguiendo estos pasos, deberías poder desplegar WordPress en tu instancia EC2 de Amazon Linux utilizando solo un archivo Dockerfile. Asegúrate de haber configurado correctamente el archivo Dockerfile para incluir todas las dependencias y configuraciones necesarias para ejecutar WordPress en el contenedor.


## parte II

## Implementación de Wordpress en AWS ECS
Esta guía proporciona los pasos básicos para implementar WordPress en AWS ECS utilizando Fargate y RDS. Asegúrate de consultar la documentación oficial de AWS para obtener instrucciones detalladas y actualizadas.
## Creación de Base de Datos Aurora en Amazon RDS
La siguiente guía te muestra los pasos para crear una base de datos Aurora en Amazon RDS. Aurora es compatible con MySQL y ofrece características adicionales y mejor rendimiento en comparación con una instancia de MySQL estándar.

> Nota: Asegúrate de haber iniciado sesión en la consola de AWS antes de comenzar.

- Ve a la consola de Amazon RDS.

- Haz clic en "Crear base de datos" para iniciar el proceso de creación.

- Selecciona "Creación estándar" como tipo de creación.

- En "Tipo de motor", elige "Aurora (compatible con MySQL)".

- En "Plantillas", selecciona la opción "Desarrollo y pruebas" que se ajuste a tus necesidades.

- En "Identificador del clúster de base de datos", ingresa un nombre para identificar tu clúster de Aurora.

- En "Credenciales de inicio de sesión", elige un "Nombre de usuario maestro" (por ejemplo, "admin") y establece una "Contraseña maestra" que cumpla con los requisitos de seguridad.

- En "Configuración del clúster de almacenamiento", selecciona "Aurora Standard" para optimizar los costos de almacenamiento.

- En "Configuración de la instancia", elige una "Clase con ráfagas" que se ajuste a tus necesidades de rendimiento y recursos.

- En "Disponibilidad y durabilidad", selecciona "Crear un nodo" si deseas tener una configuración resiliente a fallos, de lo contrario, elige "No crear una réplica de Aurora".

- En "Conectividad", selecciona "Conectarse a un recurso informático de EC2" para establecer una conexión interna con tu instancia EC2 o contenedor.

- En "Autenticación de bases de datos", selecciona "Autenticación con contraseña" para utilizar una contraseña para la autenticación.

- Revisa la configuración y haz clic en "Crear base de datos" para iniciar la creación de tu clúster de Aurora.

- Espera a que el clúster de Aurora se cree correctamente. Puedes verificar el estado de creación en la consola de Amazon RDS.

- Una vez que el clúster de Aurora esté en estado "available", podrás conectarte a él utilizando herramientas como MySQL Workbench o la línea de comandos de MySQL.

- Para dar privilegios al usuario "admin" en la base de datos que creaste, puedes conectarte a la instancia de Aurora utilizando el comando mysql y ejecutar los siguientes comandos:

> mysql -h puntodeconexioninstancia -P 3306 -u admin -p

> GRANT ALL PRIVILEGES ON nombreebd.* TO admin;

> FLUSH PRIVILEGES;

Recuerda reemplazar "puntodeconexioninstancia" con la URL o endpoint de conexión de tu instancia de Aurora y "nombreebd" con el nombre de la base de datos que creaste.

¡Ahora tienes una base de datos Aurora lista para ser utilizada con tu aplicación de WordPress en AWS!


## Configuración de Security Groups
Al conectar la instancia EC2 con RDS, se crean dos grupos de seguridad (Security Groups) para permitir la comunicación entre ellos. A continuación, se detallan los pasos para crear dos Security Groups adicionales: uno para el balanceador de carga y otro para las tareas de contenedores.
## Security Group para el Balanceador de Carga (ALB-SG):
- Accede a la consola de AWS y navega hasta la sección de Security Groups.

- Haz clic en "Crear grupo de seguridad" para iniciar la configuración.

- En la descripción, ingresa "ALB-SG" para identificar el grupo de seguridad.

- Agrega una regla de entrada para permitir el tráfico al puerto 80:

Tipo: HTTP
Protocolo: TCP
Puerto: 80
Origen: Anywhere (0.0.0.0/0) (o la dirección IP específica que desees permitir)
- Agrega una regla de salida para permitir la comunicación con el grupo de seguridad de las tareas de contenedores:

Tipo: Personalizado TCP
Puerto: 8001
Destino: Security Group de las tareas (TASK-SG)
## Security Group para las Tareas de Contenedores (TASK-SG):
- Crea otro grupo de seguridad y asigna la descripción "TASK-SG".

- Agrega las siguientes reglas de entrada:

Tipo: HTTP
Protocolo: TCP
Puerto: 80
Origen: Anywhere (0.0.0.0/0) (o la dirección IP específica que desees permitir)

Tipo: Personalizado TCP
Puerto: 8001
Origen: Red interna de la VPC

Tipo: HTTPS
Protocolo: TCP
Puerto: 443
Origen: Anywhere (0.0.0.0/0) (o la dirección IP específica que desees permitir)

- Agrega una regla de salida para permitir la comunicación con la base de datos RDS:

Tipo: MYSQL/Aurora
Protocolo: TCP
## Configuración del Contenedor
Sigue estos pasos para configurar el contenedor en tu máquina EC2:
- Clonar el repositorio y acceder a la carpeta del repositorio:
-git clone https://github.com/cristoalexis/wordpressAWS
cd wordpressaws
-En el archivo wp-config.php , edita las siguientes variables de entorno:
> nano wp-config.php
WORDPRESS_DB_NAME: Nombre de la base de datos que creamos.
WORDPRESS_DB_USER: Nombre de usuario con permisos en la base de datos (por ejemplo, "admin").
WORDPRESS_DB_PASSWORD: Contraseña de la base de datos o del usuario de MySQL.
WORDPRESS_DB_HOST: Punto de conexión de la instancia RDS.
- Guarda los cambios y cierra el archivo.
- Reemplaza 'contraseña' por una clave única para cada constante.
- Guarda los cambios y cierra el archivo.
## Crear Repositorio ECR
Privado
Nombre del repositorio
## Instalar aws cli en instancia EC2
> curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
## COonfiguracion de acceso
A continuación se muestra cómo configurar el acceso en un archivo llamado ~/.aws/credentials. Debes editar el archivo usando el editor de texto nano y asegurarte de seguir el formato correcto:

Abre una terminal en tu sistema.

Ejecuta el comando 
>nano ~/.aws/credentials

para abrir el archivo credentials en el editor de texto nano.

En el archivo, agrega las siguientes líneas en el formato especificado:
[default]
aws_access_key_id= <ID de clave de acceso>
aws_secret_access_key= <Clave de acceso secreta>
aws_session_token= <Token de sesión> (opcional)
Reemplaza <ID de clave de acceso> con tu identificador de clave de acceso de AWS, <Clave de acceso secreta> con tu clave de acceso secreta de AWS y <Token de sesión> con tu token de sesión de AWS (si lo tienes).

Guarda los cambios en el archivo presionando Ctrl + O y luego Enter.

Sal del editor de texto nano presionando Ctrl + X.

¡Ahora has configurado correctamente el acceso en el archivo ~/.aws/credentials! Puedes usar estas credenciales para interactuar con los servicios de AWS desde tu sistema.


#### A continuación, se presentan los pasos para configurar un entorno utilizando AWS ECR (Elastic Container Registry), ECS (Elastic Container Service) y ALB (Application Load Balancer):
- Obtén un token de autenticación y autentica tu cliente de Docker en el registro ECR. Utiliza AWS CLI:

```sh
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 773425074112.dkr.ecr.us-east-1.amazonaws.com
```
- Crea una imagen de Docker con el siguiente comando:
```sh
docker build -t wordpress .
```
- Una vez completada la creación, etiqueta la imagen para poder enviarla al repositorio:
```sh
docker tag wordpress:latest 773425074112.dkr.ecr.us-east-1.amazonaws.com/wordpress:latest
```
- Envía la imagen al repositorio de AWS recién creado:
```sh
docker push 773425074112.dkr.ecr.us-east-1.amazonaws.com/wordpress:latest
```
## Dirígete a ECS para crear una definición de tarea y luego crear el clúster con la imagen de tu repositorio.
- Crea una nueva definición de tarea:
- Especifica un nombre de familia de definición de tarea único.
Nombre y URI que se copian del repositorio que creaste.
- Mapeos de puertos: el puerto 80 para HTTP.
- Haz clic en Siguiente.
## Entorno de la aplicación:
- Elige AWS Fargate.
- Sistema operativo/arquitectura: Linux.
- Tamaño de la tarea: 2 vCPU y 4 GB de memoria.
- Rol de tarea: elige un rol con permisos (por ejemplo, labrole).
- Rol de ejecución de tareas: labrole.
- Almacenamiento efímero: 30 GB.
- Crea la definición de tarea.
- Crea el clúster:
- Nombre del clúster.
- Redes: elige todas las subredes.
- Crea el clúster.
- Crea el servicio:
- Opciones informáticas: estrategia de proveedor de capacidad.
- Configuración de implementación: servicio.
- Familia: elige tu tarea y versión.
- Nombre del servicio.
- Tipo de servicio: réplica, tareas deseadas: 1.
- Redes: todas las subredes.
- Grupo de seguridad: launch-wizard-1, task-sg, rds-ec2-1, ec2-rds-1.
- Balanceo de carga: balanceador de carga de aplicaciones.
## Crea un nuevo balanceador de carga:
- Nombre del balanceador de carga.
- Crea un nuevo agente de escucha: puerto 80 para HTTP.
- Grupo de destino: crea un nuevo grupo de destino y elige un nombre.
- Crea el servicio.
- Cuando el balanceador de carga se inicie, cambia su grupo de seguridad por el de ALB-SG, que tiene la regla de tráfico adecuada.

Verifica el correcto funcionamiento esperando a que se termine la creación del CloudFormation y copia el DNS de tu balanceador de carga para probar el sitio de WordPress.

Ingresa el DNS copiado con el siguiente formato
```sh
alb-word-1233871793.us-east-1.elb.amazonaws.com:80
```
- Finalmente, podrás ver la página de instalación y probar el sitio WordPress.
T
## License
**CRISTOBAL ALARCON**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)

   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
   [PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
   [PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>
