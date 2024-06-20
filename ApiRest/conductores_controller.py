# conductores_controller.py

from flask import Blueprint, jsonify
import mysql.connector
from AccesoDatos.conexion import cadena_conexion

conductores_bp = Blueprint('conductores_bp', __name__)

@conductores_bp.route('/conductores', methods=['GET'])
def get_conductores():
    try:
        # Establecer conexión con la base de datos
        conexion = mysql.connector.connect(**cadena_conexion)
        cursor = conexion.cursor()

        # Ejecutar consulta SQL para obtener los datos de los conductores
        cursor.execute("SELECT * FROM Conductores")
        conductores = cursor.fetchall()

        # Cerrar conexión con la base de datos
        cursor.close()
        conexion.close()

        return jsonify(conductores)

    except Exception as e:
        return jsonify({'error': str(e)})
