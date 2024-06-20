15:20 31/5/202415:20 31/5/2024-- Eliminar la tabla Tickets
DROP TABLE IF EXISTS Tickets;

-- Eliminar la tabla Reservas
DROP TABLE IF EXISTS Reservas;

-- Eliminar la tabla Pasajeros
DROP TABLE IF EXISTS Pasajeros;

-- Eliminar la tabla Horarios
DROP TABLE IF EXISTS Horarios;

-- Eliminar la tabla Rutas
DROP TABLE IF EXISTS Rutas;

-- Eliminar la tabla Conductores
DROP TABLE IF EXISTS Conductores;

-- Eliminar la tabla Buses
DROP TABLE IF EXISTS Buses;

-- Tabla Buses
CREATE TABLE Buses (
    ID_Bus INT PRIMARY KEY AUTO_INCREMENT,
    NumUnidadBus VARCHAR(20),
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Capacidad_Pasajeros INT
);

-- Tabla Conductores
CREATE TABLE Conductores (
    ID_Conductor INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Cedula VARCHAR(30), 
    ConduTelefono VARCHAR(20),
    RutaFoto VARCHAR(255) -- Campo para almacenar la ruta de la imagen
);

-- Tabla Rutas
CREATE TABLE Rutas (
    ID_Ruta INT PRIMARY KEY AUTO_INCREMENT,
    Origen VARCHAR(100),
    Destino VARCHAR(100),
    Distancia DECIMAL(10, 2),
    Duracion_Estimada TIME
);

-- Tabla Horarios
CREATE TABLE Horarios (
    ID_Horario INT PRIMARY KEY AUTO_INCREMENT,
    ID_Ruta INT,
    ID_Bus INT,
    ID_Conductor INT,
    Dia_Semana VARCHAR(20),
    Hora_Salida TIME,
    Hora_Llegada TIME,
    FOREIGN KEY (ID_Ruta) REFERENCES Rutas(ID_Ruta),
    FOREIGN KEY (ID_Bus) REFERENCES Buses(ID_Bus),
    FOREIGN KEY (ID_Conductor) REFERENCES Conductores(ID_Conductor)
);

-- Tabla Pasajeros
CREATE TABLE Pasajeros (
    ID_Pasajero INT PRIMARY KEY AUTO_INCREMENT,
    Nombre VARCHAR(50),
    Apellido VARCHAR(50),
    Telefono VARCHAR(20),
    Correo_Electronico VARCHAR(100)
);

-- Tabla Reservas
CREATE TABLE Reservas (
    ID_Reserva INT PRIMARY KEY AUTO_INCREMENT,
    ID_Horario INT,
    ID_Pasajero INT,
    Numero_Asientos_Reservados INT,
    Estado_Reserva VARCHAR(20),
    Fecha_Reserva DATE,
    FOREIGN KEY (ID_Horario) REFERENCES Horarios(ID_Horario),
    FOREIGN KEY (ID_Pasajero) REFERENCES Pasajeros(ID_Pasajero)
);

-- Tabla Tickets
CREATE TABLE Tickets (
    ID_Ticket INT PRIMARY KEY AUTO_INCREMENT,
    ID_Reserva INT,
    Precio DECIMAL(10, 2),
    Estado_Pago VARCHAR(20),
    FOREIGN KEY (ID_Reserva) REFERENCES Reservas(ID_Reserva)
);
