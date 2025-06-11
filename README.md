# [DevOps Practicante] – Reto de automatización de entorno

Este repositorio contiene una pequeña aplicación en Flask y las instrucciones para dockerizarla.

## Requisitos

- Docker instalado (y ejecutándose), preferiblemente en Linux.

## Construir la imagen
En la terminal, ejecutamos:  
```bash
# Estando parados en la carpeta raíz del proyecto
sudo docker build -t devops-reto:latest .
```  
## Ejecutar el contenedor localmente   
Para levantar el contenedor en segundo plano y mapear el puerto 5000, ejecutamos:
```bash
docker run -d \
  --name devops-app \
  -p 5000:5000 \
  devops-reto:latest
```  
(Ojo: si acá ejecutamos sin poner `sudo` antes, no ponemos `sudo` tampoco en ninguno de los siguientes comandos).  
Entramos a [http://localhost:5000](http://localhost:5000) en el navegador y probamos las rutas:

   * **/** → `¡Hola Mundo!`
   * **/status** → `{ "status": "ok" }`
   * **/time** → `{ "now": "2025-06-11T22:14:07.123456" }`

Para ver el contenedor en ejecución:

   ```bash
   docker ps
   ```

Para detener y eliminar el contenedor:

   ```bash
   docker stop devops-app
   docker rm devops-app
   ```