# Auditoría y Corrección de Docker Compose - srv_dev_XX[cite: 7]

Este repositorio contiene la configuración corregida para el entorno de desarrollo basado en Ubuntu, junto con el análisis técnico de los fallos encontrados en la versión inicial[cite: 7].

## 📋 Tabla de Contenidos[cite: 7]
- [Diagnóstico de Errores](#-diagnóstico-de-errores)[cite: 7]
- [Solución Aplicada](#-solución-aplicada)[cite: 7]
- [Uso y Despliegue](#-uso-y-despliegue)[cite: 7]
- [Estructura del Archivo](#-estructura-del-archivo)[cite: 7]

## 🔍 Diagnóstico de Errores[cite: 7]

En la revisión técnica del archivo original, se detectaron los siguientes incidentes operativos[cite: 7]:

1.  **Finalización Inmediata (ID-01):**[cite: 4, 7]
    * **Problema**: La imagen `ubuntu:latest` no posee un proceso en primer plano (*foreground*)[cite: 4, 7].
    * **Consecuencia**: Docker interpreta que el trabajo ha finalizado y apaga el contenedor al segundo de iniciarlo (`Exited 0`)[cite: 4, 7].
2.  **Mapeo de Puertos Inactivo (ID-02):**[cite: 4, 7]
    * **Problema**: Se definió un mapeo de puertos `8090:3000`[cite: 4, 7].
    * **Consecuencia**: Al ser un Ubuntu base, no hay servicios instalados que escuchen en el puerto 3000, generando errores de conexión[cite: 4, 7].
3.  **Falta de Interactividad:**[cite: 7]
    * **Problema**: Omisión de los flags necesarios para una terminal virtual[cite: 7].
    * **Consecuencia**: Imposibilidad de trabajar dentro del contenedor mediante la consola interactiva[cite: 7].

## 🛠 Solución Aplicada[cite: 7]

Se ha reestructurado el archivo `docker-compose.yml` incluyendo parámetros de persistencia e interactividad[cite: 4, 7]:
```yaml
version: '3.8'

services:
  srv_dev_xx: # Recomendado: usar minúsculas para nombres de servicios
    image: ubuntu:latest
    container_name: srv_dev_XX
    stdin_open: true # Equivalente a -i
    tty: true        # Equivalente a -t, evita que el contenedor se apague
    volumes:
      - ./srv_dev_XX:/srv_dev_XX
      - datos_dev_XX:/var/empresa
    networks:
      - net_dev_XX
    ports:
      - "8080:80"
    restart: unless-stopped # Recomendado para entornos de desarrollo

volumes:
  datos_dev_XX:
    driver: local

networks:
  net_dev_XX:
    driver: bridge

## 🚀 Uso y Despliegue[cite: 7]

Sigue estos pasos para poner en marcha el entorno correctamente[cite: 7]:

1.  **Levantar el contenedor**: Ejecuta `docker-compose up -d` para iniciar el servicio en segundo plano[cite: 7].
2.  **Acceder al terminal**: Utiliza `docker exec -it srv_dev_XX bash` para entrar a la consola de Ubuntu[cite: 7].
3.  **Instalar dependencias**: Una vez dentro, se recomienda ejecutar `apt update` para comenzar la configuración del software necesario[cite: 1, 7].

## 📂 Estructura del Archivo[cite: 7]
*   **`srv_dev_XX/`**: Carpeta local sincronizada con el contenedor mediante un *bind mount*[cite: 7].
*   **`datos_dev_XX`**: Volumen persistente para almacenar datos críticos de la empresa[cite: 7].
*   **`net_dev_XX`**: Red aislada de tipo *bridge* para asegurar la comunicación interna[cite: 7].
