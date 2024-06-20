from flask import Flask
from ApiRest.buses_controller import buses_bp
from ApiRest.conductores_controller import conductores_bp
from ApiRest.rutas_controller import rutas_blueprint
from ApiRest.horarios_controller import horarios_blueprint
from ApiRest.reservas_controller import reservas_blueprint
from ApiRest.tickets_controller import tickets_bp
app = Flask(__name__)

app.register_blueprint(buses_bp)
app.register_blueprint(conductores_bp)
app.register_blueprint(rutas_blueprint)
app.register_blueprint(horarios_blueprint)
app.register_blueprint(reservas_blueprint)
app.register_blueprint(tickets_bp)
if __name__ == '__main__':
    app.run(debug=True)
