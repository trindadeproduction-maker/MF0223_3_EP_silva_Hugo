# 📄 Diagnóstico y Solución de Problema en Bash (Git Bash / MINGW64)

---

## 🧠 Descripción del problema

Se ejecutó un script en Bash diseñado para **estresar el sistema**, generando carga en CPU, memoria y disco.

El entorno utilizado fue:


Durante la ejecución se intentó detener los procesos con `pkill`, pero el comando no estaba disponible en el entorno.

---

## 🔥 Script ejecutado

```bash
#!/bin/bash
yes > /dev/null &
yes > /dev/null &
yes > /dev/null &

cat /dev/zero | head -c 300M > /tmp/mem_test1 &
cat /dev/zero | head -c 300M > /tmp/mem_test2 &

mkdir -p /tmp/test_disk
for i in {1..30}
do
 dd if=/dev/zero of=/tmp/test_disk/file_$i bs=1M count=5
done

