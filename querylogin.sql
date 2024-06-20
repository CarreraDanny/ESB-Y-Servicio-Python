-- SQL Server
CREATE TABLE Usuarios
(
   IDUSUARIO INTEGER PRIMARY KEY IDENTITY,
   USNOMBRE VARCHAR(100),
   USAPELLIDO VARCHAR(100),
   USCORREO VARCHAR(100),
   USCONTRASENA VARCHAR(100),
   ROL VARCHAR(20)
)

INSERT INTO Usuarios (USNOMBRE, USAPELLIDO, USCORREO, USCONTRASENA, ROL) VALUES
('Danny', 'Carrera', 'danny@hotmail.com', '456', 'Administrador'),
('Cristhian', 'Proaño', 'cproano@gmail.com', 'tababela', 'Administrador'),
('Felipe', 'Vallejo', 'felipe@puce.edu.ec', 'serpiente', 'Cliente'),
('Maria', 'Rodriguez', 'maria.rodriguez@hotmail.com', '789', 'Cliente'),
('Luis', 'Fernandez', 'luis.fernandez@hotmail.com', '789', 'Cliente');
