from flask import Flask, Blueprint, jsonify
from datetime import timedelta
import json
from decimal import Decimal
import mysql.connector
from AccesoDatos.conexion import cadena_conexion

# Crear el blueprint para los horarios
horarios_blueprint = Blueprint('horarios', __name__)

# Función de serialización personalizada
def serialize(obj):
    if isinstance(obj, Decimal):
        return float(obj)
    elif isinstance(obj, timedelta):
        return str(obj)
    raise TypeError(f"Object of type {type(obj)} is not JSON serializable")

# Ruta para obtener todos los horarios
@horarios_blueprint.route('/horarios', methods=['GET'])
def get_horarios():
    try:
        # Establecer la conexión con la base de datos
        connection = mysql.connector.connect(**cadena_conexion)
        cursor = connection.cursor(dictionary=True)

        # Consulta para seleccionar todos los horarios
        sql = "SELECT * FROM Horarios"
        cursor.execute(sql)

        # Obtener resultados
        horarios = cursor.fetchall()

        # Cerrar el cursor y la conexión
        cursor.close()
        connection.close()

        # Convertir resultados a formato JSON utilizando la función de serialización personalizada
        return json.dumps({'horarios': horarios}, default=serialize)

    except Exception as e:
        return jsonify({'error': str(e)}), 500

