from flask import Flask, Blueprint, jsonify
from datetime import timedelta
from decimal import Decimal
import json
import mysql.connector
from AccesoDatos.conexion import cadena_conexion

# Crear el blueprint para las rutas
rutas_blueprint = Blueprint('rutas', __name__)

# Función de serialización personalizada
def serialize(obj):
    if isinstance(obj, Decimal):
        return float(obj)
    elif isinstance(obj, timedelta):
        return str(obj)
    raise TypeError(f"Object of type {type(obj)} is not JSON serializable")

# Ruta para obtener todas las rutas
@rutas_blueprint.route('/rutas', methods=['GET'])
def get_rutas():
    try:
        # Establecer la conexión con la base de datos
        connection = mysql.connector.connect(**cadena_conexion)
        cursor = connection.cursor(dictionary=True)

        # Consulta para seleccionar todas las rutas
        sql = "SELECT * FROM Rutas"
        cursor.execute(sql)

        # Obtener resultados
        rutas = cursor.fetchall()

        # Cerrar el cursor y la conexión
        cursor.close()
        connection.close()

        # Convertir resultados a formato JSON utilizando la función de serialización personalizada
        return json.dumps({'rutas': rutas}, default=serialize)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

