from flask import Blueprint, jsonify, request
import mysql.connector
from AccesoDatos.conexion import cadena_conexion

buses_bp = Blueprint('buses_bp', __name__)

# Obtener todos los buses
@buses_bp.route('/buses', methods=['GET'])
def get_buses():
    try:
        # Establish connection to the database
        conexion = mysql.connector.connect(**cadena_conexion)
        cursor = conexion.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Buses")
        buses = cursor.fetchall()
        cursor.close()
        conexion.close()
        return jsonify(buses)
    except Exception as e:
        return jsonify({'error': str(e)})

# Obtener un bus por ID
@buses_bp.route('/buses/<int:id>', methods=['GET'])
def get_bus(id):
    try:
        # Establish connection to the database
        conexion = mysql.connector.connect(**cadena_conexion)
        cursor = conexion.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Buses WHERE ID_Bus = %s", (id,))
        bus = cursor.fetchone()
        cursor.close()
        conexion.close()
        if bus:
            return jsonify(bus)
        else:
            return jsonify({'error': 'Bus not found'}), 404
    except Exception as e:
        return jsonify({'error': str(e)})

# Crear un nuevo bus
@buses_bp.route('/buses', methods=['POST'])
def create_bus():
    try:
        data = request.get_json()
        conexion = mysql.connector.connect(**cadena_conexion)
        cursor = conexion.cursor()
        cursor.execute(
            "INSERT INTO Buses (NumUnidadBus, Marca, Modelo, Capacidad_Pasajeros) VALUES (%s, %s, %s, %s)", 
            (data['NumUnidadBus'], data['Marca'], data['Modelo'], data['Capacidad_Pasajeros'])
        )
        conexion.commit()
        cursor.close()
        conexion.close()
        return jsonify({'message': 'Bus created successfully'}), 201
    except Exception as e:
        return jsonify({'error': str(e)})

# Actualizar un bus existente
@buses_bp.route('/buses/<int:id>', methods=['PUT'])
def update_bus(id):
    try:
        data = request.get_json()
        conexion = mysql.connector.connect(**cadena_conexion)
        cursor = conexion.cursor()
        cursor.execute(
            "UPDATE Buses SET NumUnidadBus = %s, Marca = %s, Modelo = %s, Capacidad_Pasajeros = %s WHERE ID_Bus = %s",
            (data['NumUnidadBus'], data['Marca'], data['Modelo'], data['Capacidad_Pasajeros'], id)
        )
        conexion.commit()
        cursor.close()
        conexion.close()
        return jsonify({'message': 'Bus updated successfully'})
    except Exception as e:
        return jsonify({'error': str(e)})

# Eliminar un bus
@buses_bp.route('/buses/<int:id>', methods=['DELETE'])
def delete_bus(id):
    try:
        conexion = mysql.connector.connect(**cadena_conexion)
        cursor = conexion.cursor()
        cursor.execute("DELETE FROM Buses WHERE ID_Bus = %s", (id,))
        conexion.commit()
        cursor.close()
        conexion.close()
        return jsonify({'message': 'Bus deleted successfully'})
    except Exception as e:
        return jsonify({'error': str(e)})
