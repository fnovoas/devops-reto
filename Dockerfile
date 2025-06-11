# Definición de la imagen de Docker
# 1. Imagen base ligera con Python
FROM python:3.9-slim

# 2. Crear usuario no root (appuser) para mayor seguridad
RUN groupadd --system appgroup \
 && useradd --system --gid appgroup --shell /bin/bash appuser

# 3. Definir /app como directorio de trabajo
WORKDIR /app

# 4. Copiar solo dependencias e instalarlas
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
# (Docker cachea esta capa si no cambian las dependencias)

# 5. Copiar el código de la aplicación
COPY app.py ./

# 6. Exponer el puerto donde corre Flask
EXPOSE 5000

# 7. Cambiar a usuario no privilegiado para ejecutar la app
USER appuser

# 8. Comando por defecto
ENTRYPOINT ["python", "app.py"]