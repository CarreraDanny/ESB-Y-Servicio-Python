-- Tabla Buses
INSERT INTO Buses (ID_Bus, NumUnidadBus, Marca, Modelo, Capacidad_Pasajeros)
VALUES
(1, '123ABC', 'Mercedes-Benz', 'Sprinter', 20),
(2, '456DEF', 'Volvo', '9700', 50),
(3, '789GHI', 'Scania', 'Irizar', 40),
(4, '101JKL', 'MAN', 'Lion''s Coach', 55),
(5, '202MNO', 'Iveco', 'Crossway', 30),
(6, '303PQR', 'Ford', 'Transit', 15),
(7, '404STU', 'Renault', 'Master', 25),
(8, '505VWX', 'Toyota', 'Coaster', 30),
(9, '606YZA', 'Mitsubishi', 'Rosa', 20),
(10, '707BCD', 'Isuzu', 'NQR', 35),
(11, '808EFG', 'Hyundai', 'County', 25),
(12, '909HIJ', 'Chevrolet', 'NQR', 30),
(13, '101KLM', 'MAN', 'Ecolife', 45),
(14, '111MNO', 'Volvo', '7900 Hybrid', 60),
(15, '121PQR', 'Mercedes-Benz', 'Tourismo', 50);

-- Tabla Conductores 
INSERT INTO Conductores (ID_Conductor, Nombre, Apellido, Cedula, ConduTelefono, RutaFoto)
VALUES
(1, 'Juan', 'García', '1234567890', '+1234567890', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\Foto-carnet.jpg'),
(2, 'María', 'López', '2345678901', '+2345678901', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\Foto-carnet.jpg'),
(3, 'Carlos', 'Martínez', '3456789012', '+3456789012', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\foto3.jpg'),
(4, 'Ana', 'Rodríguez', '4567890123', '+4567890123', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\Foto-carnet.jpg'),
(5, 'Luis', 'Pérez', '5678901234', '+5678901234', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\Foto-carnet.jpg'),
(6, 'Laura', 'Gómez', '6789012345', '+6789012345', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\foto2.jpg'),
(7, 'Pedro', 'Hernández', '7890123456', '+7890123456', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\foto2.jpg'),
(8, 'Sofía', 'Díaz', '8901234567', '+8901234567', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\foto2.jpg'),
(9, 'Diego', 'Fernández', '9012345678', '+9012345678', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\foto2.jpg'),
(10, 'Elena', 'Martín', '0123456789', '+0123456789', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\foto2.jpg'),
(11, 'Javier', 'Gutiérrez', '0987654321', '+0987654321', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\foto2.jpg'),
(12, 'Carmen', 'Sánchez', '9876543210', '+9876543210', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\foto2.jpg'),
(13, 'David', 'García', '8765432109', '+8765432109', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\foto3.jpg'),
(14, 'Marta', 'López', '7654321098', '+7654321098', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\foto3.jpg'),
(15, 'Manuel', 'González', '6543210987', '+6543210987', 'C:\\Users\\Danny\\OneDrive\\Escritorio\\PROYECTOFINA_SERVICIOS\\ImagenesConduc\\foto3.jpg');

-- Tabla Rutas
INSERT INTO Rutas (ID_Ruta, Origen, Destino, Distancia, Duracion_Estimada)
VALUES
(1, 'Quito', 'Guayas', 200.5, '04:30:00'),
(2, 'Cuenca', 'Quito', 150.2, '03:45:00'),
(3, 'Quito', 'Atacames', 180.8, '04:00:00'),
(4, 'Guayas', 'Esmeraldas', 300.0, '06:15:00'),
(5, 'Manta', 'Machala', 250.5, '05:00:00'),
(6, 'Quito', 'Portoviejo', 400.2, '07:30:00'),
(7, 'San Rafael', 'Quito', 280.7, '05:45:00'),
(8, 'Quito', 'Santa Elena', 320.4, '06:30:00'),
(9, 'Quito', 'San Lorenzo', 270.3, '05:15:00'),
(10, 'Viche', 'Machala', 220.6, '04:45:00'),
(11, 'El Coca', 'Quito', 190.0, '04:15:00'),
(12, 'Esmeraldas', 'Quito', 350.9, '06:45:00'),
(13, 'Loja', 'Quito', 280.2, '05:30:00'),
(14, 'El Oro', 'Guayaquil', 210.4, '04:30:00'),
(15, 'Guayas', 'El Oro', 290.1, '05:45:00');

-- Tabla Horarios
INSERT INTO Horarios (ID_Horario, ID_Ruta, ID_Bus, ID_Conductor, Dia_Semana, Hora_Salida, Hora_Llegada)
VALUES
(1, 1, 1, 1, 'Lunes', '08:00:00', '12:30:00'),
(2, 2, 2, 2, 'Martes', '09:15:00', '13:00:00'),
(3, 3, 3, 3, 'Miércoles', '10:30:00', '14:30:00'),
(4, 4, 4, 4, 'Jueves', '11:45:00', '16:00:00'),
(5, 5, 5, 5, 'Viernes', '12:00:00', '17:15:00'),
(6, 6, 6, 6, 'Sábado', '13:30:00', '20:00:00'),
(7, 7, 7, 7, 'Domingo', '14:45:00', '21:30:00'),
(8, 8, 8, 8, 'Lunes', '08:30:00', '13:00:00'),
(9, 9, 9, 9, 'Martes', '09:45:00', '14:15:00'),
(10, 10, 10, 10, 'Miércoles', '11:00:00', '15:30:00'),
(11, 11, 11, 11, 'Jueves', '12:15:00', '17:00:00'),
(12, 12, 12, 12, 'Viernes', '13:30:00', '18:45:00'),
(13, 13, 13, 13, 'Sábado', '15:00:00', '21:15:00'),
(14, 14, 14, 14, 'Domingo', '16:15:00', '22:30:00'),
(15, 15, 15, 15, 'Lunes', '08:45:00', '14:30:00');

-- Tabla Pasajeros
INSERT INTO Pasajeros (ID_Pasajero, Nombre, Apellido, Telefono, Correo_Electronico)
VALUES
(1, 'Alejandro', 'Gómez', '+123456789', 'alejandro@gmail.com'),
(2, 'Sofía', 'Rodríguez', '+987654321', 'sofia@gmail.com'),
(3, 'Diego', 'Martínez', '+246801357', 'diego@gmail.com'),
(4, 'Lucía', 'García', '+135792468', 'lucia@gmail.com'),
(5, 'Martina', 'López', '+678901234', 'martina@gmail.com'),
(6, 'Pablo', 'Hernández', '+432109876', 'pablo@gmail.com'),
(7, 'Valentina', 'Díaz', '+901234567', 'valentina@gmail.com'),
(8, 'Javier', 'Sánchez', '+543210987', 'javier@gmail.com'),
(9, 'Isabella', 'Vargas', '+234567890', 'isabella@gmail.com'),
(10, 'Daniel', 'Gutiérrez', '+678901234', 'daniel@gmail.com'),
(11, 'Fernanda', 'Ramírez', '+234567890', 'fernanda@gmail.com'),
(12, 'Emilio', 'Torres', '+345678901', 'emilio@gmail.com'),
(13, 'Mariana', 'Pérez', '+456789012', 'mariana@gmail.com'),
(14, 'Sara', 'Suárez', '+567890123', 'sara@gmail.com'),
(15, 'Ángel', 'López', '+678901234', 'angel@gmail.com');

-- Tabla Reservas
INSERT INTO Reservas (ID_Reserva, ID_Horario, ID_Pasajero, Numero_Asientos_Reservados, Estado_Reserva, Fecha_Reserva)
VALUES
(1, 1, 1, 2, 'Confirmada', '2024-05-16'),
(2, 2, 2, 1, 'Confirmada', '2024-05-17'),
(3, 3, 3, 3, 'Pendiente', '2024-05-18'),
(4, 4, 4, 2, 'Confirmada', '2024-05-19'),
(5, 5, 5, 1, 'Pendiente', '2024-05-20'),
(6, 6, 6, 2, 'Confirmada', '2024-05-21'),
(7, 7, 7, 3, 'Confirmada', '2024-05-22'),
(8, 8, 8, 1, 'Pendiente', '2024-05-23'),
(9, 9, 9, 2, 'Pendiente', '2024-05-24'),
(10, 10, 10, 3, 'Confirmada', '2024-05-25'),
(11, 11, 11, 1, 'Pendiente', '2024-05-26'),
(12, 12, 12, 2, 'Pendiente', '2024-05-27'),
(13, 13, 13, 3, 'Pendiente', '2024-05-28'),
(14, 14, 14, 2, 'Confirmada', '2024-05-29'),
(15, 15, 15, 1, 'Pendiente', '2024-05-30');

-- Tabla Tickets
INSERT INTO Tickets (ID_Ticket, ID_Reserva, Precio, Estado_Pago)
VALUES
(1, 1, 50.00, 'Pagado'),
(2, 2, 45.00, 'Pagado'),
(3, 3, 60.00, 'Pendiente'),
(4, 4, 55.00, 'Pagado'),
(5, 5, 40.00, 'Pendiente'),
(6, 6, 50.00, 'Pagado'),
(7, 7, 65.00, 'Pagado'),
(8, 8, 45.00, 'Pendiente'),
(9, 9, 50.00, 'Pendiente'),
(10, 10, 70.00, 'Pagado'),
(11, 11, 40.00, 'Pendiente'),
(12, 12, 55.00, 'Pendiente'),
(13, 13, 60.00, 'Pendiente'),
(14, 14, 65.00, 'Pagado'),
(15, 15, 40.00, 'Pendiente');

