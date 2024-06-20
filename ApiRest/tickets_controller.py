from flask import Blueprint, jsonify
import mysql.connector
from AccesoDatos.conexion import cadena_conexion

tickets_bp = Blueprint('tickets_bp', __name__)

# Obtener todos los tickets
@tickets_bp.route('/tickets', methods=['GET'])
def get_tickets():
    try:
        conexion = mysql.connector.connect(**cadena_conexion)
        cursor = conexion.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Tickets")
        tickets = cursor.fetchall()
        cursor.close()
        conexion.close()
        return jsonify(tickets)
    except Exception as e:
        return jsonify({'error': str(e)})

# Obtener un ticket por ID
@tickets_bp.route('/tickets/<int:id>', methods=['GET'])
def get_ticket(id):
    try:
        conexion = mysql.connector.connect(**cadena_conexion)
        cursor = conexion.cursor(dictionary=True)
        cursor.execute("SELECT * FROM Tickets WHERE ID_Ticket = %s", (id,))
        ticket = cursor.fetchone()
        cursor.close()
        conexion.close()
        if ticket:
            return jsonify(ticket)
        else:
            return jsonify({'error': 'Ticket not found'}), 404
    except Exception as e:
        return jsonify({'error': str(e)})
