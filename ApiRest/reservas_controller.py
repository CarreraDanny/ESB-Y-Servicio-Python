from flask import Flask, Blueprint, jsonify, request
import mysql.connector
from AccesoDatos.conexion import cadena_conexion

# Crear el blueprint para las reservas
reservas_blueprint = Blueprint('reservas', __name__)

# Ruta para obtener todas las reservas
@reservas_blueprint.route('/reservas', methods=['GET'])
def get_reservas():
    try:
        # Establecer la conexión con la base de datos
        connection = mysql.connector.connect(**cadena_conexion)
        cursor = connection.cursor(dictionary=True)

        # Consulta para seleccionar todas las reservas
        sql = "SELECT * FROM Reservas"
        cursor.execute(sql)

        # Obtener resultados
        reservas = cursor.fetchall()

        # Cerrar el cursor y la conexión
        cursor.close()
        connection.close()

        # Devolver las reservas en formato JSON
        return jsonify({'reservas': reservas})

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# Ruta para crear una nueva reserva
@reservas_blueprint.route('/reservas', methods=['POST'])
def crear_reserva():
    try:
        # Obtener datos del cuerpo de la solicitud
        datos = request.json

        # Establecer la conexión con la base de datos
        connection = mysql.connector.connect(**cadena_conexion)
        cursor = connection.cursor()

        # Insertar nueva reserva en la base de datos
        sql = "INSERT INTO Reservas (ID_Horario, ID_Pasajero, Numero_Asientos_Reservados, Estado_Reserva, Fecha_Reserva) VALUES (%s, %s, %s, %s, %s)"
        cursor.execute(sql, (datos['ID_Horario'], datos['ID_Pasajero'], datos['Numero_Asientos_Reservados'], datos['Estado_Reserva'], datos['Fecha_Reserva']))

        # Confirmar la transacción
        connection.commit()

        # Cerrar el cursor y la conexión
        cursor.close()
        connection.close()

        return jsonify({'mensaje': 'Reserva creada exitosamente'}), 201

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# Ruta para actualizar una reserva existente
@reservas_blueprint.route('/reservas/<int:id>', methods=['PUT'])
def actualizar_reserva(id):
    try:
        # Obtener datos del cuerpo de la solicitud
        datos = request.json

        # Establecer la conexión con la base de datos
        connection = mysql.connector.connect(**cadena_conexion)
        cursor = connection.cursor()

        # Actualizar la reserva en la base de datos
        sql = "UPDATE Reservas SET ID_Horario = %s, ID_Pasajero = %s, Numero_Asientos_Reservados = %s, Estado_Reserva = %s, Fecha_Reserva = %s WHERE ID_Reserva = %s"
        cursor.execute(sql, (datos['ID_Horario'], datos['ID_Pasajero'], datos['Numero_Asientos_Reservados'], datos['Estado_Reserva'], datos['Fecha_Reserva'], id))

        # Confirmar la transacción
        connection.commit()

        # Cerrar el cursor y la conexión
        cursor.close()
        connection.close()

        return jsonify({'mensaje': 'Reserva actualizada exitosamente'})

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# Ruta para eliminar una reserva existente
@reservas_blueprint.route('/reservas/<int:id>', methods=['DELETE'])
def eliminar_reserva(id):
    try:
        # Establecer la conexión con la base de datos
        connection = mysql.connector.connect(**cadena_conexion)
        cursor = connection.cursor()

        # Eliminar la reserva de la base de datos
        sql = "DELETE FROM Reservas WHERE ID_Reserva = %s"
        cursor.execute(sql, (id,))

        # Confirmar la transacción
        connection.commit()

        # Cerrar el cursor y la conexión
        cursor.close()
        connection.close()

        return jsonify({'mensaje': 'Reserva eliminada exitosamente'})

    except Exception as e:
        return jsonify({'error': str(e)}), 500

# Si este script se ejecuta directamente, iniciar la aplicación Flask
if __name__ == '__main__':
    from flask import Flask

    # Crear la aplicación Flask
    app = Flask(__name__)

    # Registrar el blueprint de reservas en la aplicación
    app.register_blueprint(reservas_blueprint)

    # Iniciar la aplicación en modo debug
    app.run(debug=True)
