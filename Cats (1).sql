
-- =========================================

CREATE DATABASE cats_db;
GO

USE cats_db;
GO


-- =========================================
-- TABLA: Raza
-- =========================================

CREATE TABLE Raza (
    RazaId INT IDENTITY(1,1) PRIMARY KEY,
    NombreRaza VARCHAR(100) NOT NULL,
    Origen VARCHAR(100),
    Descripcion TEXT,
    NivelActividad VARCHAR(50),
    EsperanzaVida INT
);


-- =========================================
-- TABLA: FichaTecnica
-- =========================================

CREATE TABLE FichaTecnica (
    FichaId INT IDENTITY(1,1) PRIMARY KEY,
    RazaId INT NOT NULL,
    Peso VARCHAR(50),
    Altura VARCHAR(50),
    Temperamento VARCHAR(150),
    CuidadoPelo VARCHAR(100),
    NivelEnergia VARCHAR(50),
    Inteligencia VARCHAR(50),

    FOREIGN KEY (RazaId) REFERENCES Raza(RazaId)
);


-- =========================================
-- TABLA: Multimedia
-- =========================================

CREATE TABLE Multimedia (
    MultimediaId INT IDENTITY(1,1) PRIMARY KEY,
    RazaId INT NOT NULL,
    TipoArchivo VARCHAR(20),   -- imagen, video, pdf
    UrlBlob VARCHAR(500),
    NombreArchivo VARCHAR(200),
    FechaSubida DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (RazaId) REFERENCES Raza(RazaId)
);


-- =========================================
-- TABLA: Color
-- =========================================

CREATE TABLE Color (
    ColorId INT IDENTITY(1,1) PRIMARY KEY,
    RazaId INT NOT NULL,
    NombreColor VARCHAR(50),
    CodigoHex VARCHAR(10),

    FOREIGN KEY (RazaId) REFERENCES Raza(RazaId)
);


-- =========================================
-- INSERTAR DATOS DE PRUEBA
-- =========================================

INSERT INTO Raza (NombreRaza, Origen, Descripcion, NivelActividad, EsperanzaVida)
VALUES
('Persa', 'Iran', 'Gato tranquilo y de pelo largo', 'Bajo', 15),
('Siamés', 'Tailandia', 'Gato muy vocal y sociable', 'Alto', 14),
('Maine Coon', 'Estados Unidos', 'Una de las razas mas grandes de gato domestico', 'Medio', 13);


INSERT INTO FichaTecnica (RazaId, Peso, Altura, Temperamento, CuidadoPelo, NivelEnergia, Inteligencia)
VALUES
(1, '3-5 kg', '25 cm', 'Tranquilo y cariñoso', 'Alto', 'Bajo', 'Media'),
(2, '2-4 kg', '23 cm', 'Activo y sociable', 'Bajo', 'Alto', 'Alta'),
(3, '5-8 kg', '30 cm', 'Amigable y jugueton', 'Medio', 'Medio', 'Alta');


INSERT INTO Color (RazaId, NombreColor, CodigoHex)
VALUES
(1, 'Blanco', '#FFFFFF'),
(1, 'Gris', '#808080'),
(2, 'Crema', '#FFFDD0'),
(3, 'Marron', '#8B4513');


INSERT INTO Multimedia (RazaId, TipoArchivo, UrlBlob, NombreArchivo)
VALUES
(1, 'imagen', 'https://storagecatssena.blob.core.windows.net/cats/imagenes/Persa.jpg', 'Persa.jpg'),
(2, 'imagen', 'https://storagecatssena.blob.core.windows.net/cats/imagenes/Siames.jpg', 'Siames.jpg'),
(3, 'imagen', 'https://storagecatssena.blob.core.windows.net/cats/imagenes/MaineCoon.jpg', 'MaineCoon.jpg'),
(1, 'pdf', 'https://storagecatssena.blob.core.windows.net/cats/fichas/Persa.pdf', 'Persa.pdf'),
(3, 'video', 'https://storagecatssena.blob.core.windows.net/cats/videos/MaineCoon.mp4', 'MaineCoon.mp4');


-- =========================================
-- CONSULTA PARA VER LOS DATOS
-- =========================================

SELECT * FROM Raza;
SELECT * FROM FichaTecnica;
SELECT * FROM Color;
SELECT * FROM Multimedia;