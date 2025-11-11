#!/usr/bin/env bash
# Salir inmediatamente si un comando falla
set -o errexit

# 1. Instalar dependencias de Python
echo "--- Instalando dependencias de Python ---"
pip install -r requirements.txt

# 2. Recolectar archivos estáticos
# Vercel necesita que todos los archivos estáticos (CSS, JS, imágenes) se muevan a STATIC_ROOT
echo "--- Recolectando archivos estáticos ---"
python manage.py collectstatic --no-input

# 3. Ejecutar migraciones (Opcional, si usas una DB externa como PostgreSQL/MySQL)
# Si solo estás usando db.sqlite3, puedes comentar la siguiente línea
# python manage.py migrate