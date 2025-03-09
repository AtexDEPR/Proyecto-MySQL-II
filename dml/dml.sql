-- --------------------------------------------------
-- Script SQL con Inserciones
-- --------------------------------------------------

USE los_ambientales;

-- Tabla departamento
INSERT INTO departamento (nombre) VALUES
('Amazonas'),
('Antioquia'),
('Cundinamarca'),
('Magdalena'),
('Guaviare'),
('Meta'),
('Santander'),
('Boyacá'),
('Cauca'),
('Chocó'),
('Arauca'),
('Atlántico'),
('Bolívar'),
('Caldas'),
('Caquetá'),
('Casanare'),
('Cesar'),
('Córdoba'),
('Huila'),
('La Guajira'),
('Nariño'),
('Norte de Santander'),
('Putumayo'),
('Quindío'),
('Risaralda'),
('San Andrés y Providencia'),
('Sucre'),
('Tolima'),
('Valle del Cauca'),
('Vaupés'),
('Vichada'),
('Guainía'),
('Archipiélago de San Andrés'),
('Barranquilla'),
('Bucaramanga'),
('Cartagena'),
('Ibagué'),
('Manizales'),
('Medellín'),
('Montería'),
('Neiva'),
('Pasto'),
('Pereira'),
('Popayán'),
('Santa Marta'),
('Sincelejo'),
('Tunja'),
('Villavicencio'),
('Yopal'),
('Leticia');

-- Tabla entidad_responsable
INSERT INTO entidad_responsable (nombre, direccion, telefono, email) VALUES
('Ministerio de Ambiente', 'Calle 123, Bogotá', '+5712345678', 'ambiente@gob.co'),
('Parques Nacionales Colombia', 'Av. Eldorado, Bogotá', '+5787654321', 'info@parques.gov.co'),
('Corpoamazonía', 'Carrera 45, Leticia', '+5798765432', 'contacto@corpoamazonia.org'),
('Corantioquia', 'Calle 67, Medellín', '+5743210987', 'corantioquia@corantioquia.gov.co'),
('CAR Cundinamarca', 'Av. Esperanza, Bogotá', '+5711223344', 'atencion@car.gov.co'),
('Fundación Natura', 'Carrera 8, Bogotá', '+5715556677', 'natura@fundacion.org'),
('WWF Colombia', 'Calle 72, Bogotá', '+5712348765', 'colombia@wwf.org'),
('Conservación Internacional', 'Av. 7, Cali', '+5723456789', 'colombia@conservation.org'),
('SINCHI', 'Carrera 12, Villavicencio', '+5787654321', 'sinchi@sinchi.org.co'),
('Corpoguavio', 'Calle 5, San José del Guaviare', '+5788990011', 'info@corpoguavio.gov.co'),
('Cormacarena', 'Calle 15, Villavicencio', '+5781234567', 'cormacarena@gov.co'),
('Codechocó', 'Av. 3, Quibdó', '+5749876543', 'codechoco@codechoco.org'),
('Corponariño', 'Carrera 10, Pasto', '+5727654321', 'corponarino@corponarino.gov.co'),
('CAR Tolima', 'Calle 40, Ibagué', '+5782345678', 'cartolima@car.gov.co'),
('Fundación Omacha', 'Calle 85, Bogotá', '+5713456789', 'omacha@fundacion.org'),
('Greenpeace Colombia', 'Av. 19, Bogotá', '+5714567890', 'colombia@greenpeace.org'),
('EcoFondo', 'Calle 33, Medellín', '+5745678901', 'ecofondo@ecofondo.org'),
('Reserva Natural', 'Carrera 7, Cali', '+5726789012', 'reserva@natural.org'),
('Instituto Humboldt', 'Calle 28, Bogotá', '+5717890123', 'humboldt@humboldt.org.co'),
('CorpoGuajira', 'Av. 1, Riohacha', '+5758901234', 'corpoguajira@gov.co'),
('CAR Valle', 'Calle 50, Cali', '+5729012345', 'carvalle@car.gov.co'),
('Fundación ProAves', 'Carrera 20, Bogotá', '+5710123456', 'proaves@proaves.org'),
('CorpoCesar', 'Av. 5, Valledupar', '+5751234567', 'corpocesar@gov.co'),
('CAR Huila', 'Calle 8, Neiva', '+5783456789', 'carhuila@car.gov.co'),
('Fundación Gaia', 'Av. 10, Manizales', '+5764567890', 'gaia@fundacion.org'),
('CorpoBoyacá', 'Calle 19, Tunja', '+5785678901', 'corpoboyaca@gov.co'),
('CAR Quindío', 'Av. Bolívar, Armenia', '+5766789012', 'carquindio@car.gov.co'),
('Fundación EcoVida', 'Calle 12, Pereira', '+5767890123', 'ecovida@fundacion.org'),
('CorpoSantander', 'Carrera 30, Bucaramanga', '+5778901234', 'corposantander@gov.co'),
('CAR Magdalena', 'Av. Libertador, Santa Marta', '+5759012345', 'carmagdalena@car.gov.co'),
('Fundación Biodiversa', 'Calle 70, Bogotá', '+5712340987', 'biodiversa@fundacion.org'),
('CorpoCauca', 'Av. 2, Popayán', '+5723451098', 'corpocauca@gov.co'),
('CAR Risaralda', 'Calle 21, Pereira', '+5764562109', 'carrisaralda@car.gov.co'),
('Fundación EcoAndina', 'Carrera 15, Manizales', '+5765673210', 'ecoandina@fundacion.org'),
('CorpoPutumayo', 'Av. Colombia, Mocoa', '+5786784321', 'corpoputumayo@gov.co'),
('CAR Atlántico', 'Calle 45, Barranquilla', '+5757895432', 'caratlantico@car.gov.co'),
('Fundación Selva Viva', 'Calle 90, Bogotá', '+5718906543', 'selvaviva@fundacion.org'),
('CorpoArauca', 'Av. 7, Arauca', '+5779017654', 'corpoarauca@gov.co'),
('CAR Bolívar', 'Calle 32, Cartagena', '+5750128765', 'carbolivar@car.gov.co'),
('Fundación Río Limpio', 'Carrera 25, Cali', '+5721239876', 'riolimpio@fundacion.org'),
('CorpoVaupés', 'Av. 1, Mitú', '+5782340987', 'corpovaupes@gov.co'),
('CAR Casanare', 'Calle 10, Yopal', '+5783451098', 'carcasanare@car.gov.co'),
('Fundación Verde Vivo', 'Calle 60, Medellín', '+5744562109', 'verdevivo@fundacion.org'),
('CorpoGuainía', 'Av. 3, Inírida', '+5785673210', 'corpoguainia@gov.co'),
('CAR Sucre', 'Calle 22, Sincelejo', '+5756784321', 'carsucre@car.gov.co'),
('Fundación Tierra Nueva', 'Carrera 12, Bogotá', '+5717895432', 'tierranueva@fundacion.org'),
('CorpoVichada', 'Av. 5, Puerto Carreño', '+5788906543', 'corpovichada@gov.co'),
('CAR Norte Santander', 'Calle 11, Cúcuta', '+5779017654', 'carnorte@car.gov.co'),
('Fundación EcoFuturo', 'Calle 80, Bogotá', '+5710128765', 'ecofuturo@fundacion.org'),
('CorpoCaldas', 'Av. Santander, Manizales', '+5761239876', 'corpocaldas@gov.co');

-- Tabla departamento_entidad
INSERT INTO departamento_entidad (id_departamento, id_entidad) VALUES
(1, 3), (1, 9), (2, 4), (3, 5), (4, 2),
(5, 10), (6, 9), (7, 6), (8, 7), (9, 8),
(10, 1), (11, 11), (12, 12), (13, 13), (14, 14),
(15, 15), (16, 16), (17, 17), (18, 18), (19, 19),
(20, 20), (21, 21), (22, 22), (23, 23), (24, 24),
(25, 25), (26, 26), (27, 27), (28, 28), (29, 29),
(30, 30), (31, 31), (32, 32), (33, 33), (34, 34),
(35, 35), (36, 36), (37, 37), (38, 38), (39, 39),
(40, 40), (41, 2), (42, 3), (43, 4), (44, 5),
(45, 6), (46, 7), (47, 8), (48, 9), (49, 10);

-- Tabla parque_natural
INSERT INTO parque_natural (nombre, fecha_declaracion, descripcion) VALUES
('Parque Nacional Chiribiquete', '1989-09-21', 'Patrimonio Mixto de la Humanidad'),
('Parque Tayrona', '1964-04-24', 'Reserva en la Sierra Nevada de Santa Marta'),
('Parque Los Nevados', '1973-11-30', 'Ecosistema de alta montaña'),
('Parque Amacayacu', '1975-10-29', 'Selva amazónica'),
('Parque Sierra de la Macarena', '1971-06-12', 'Hogar de Caño Cristales'),
('Parque Gorgona', '1984-07-21', 'Isla en el Pacífico'),
('Parque El Cocuy', '1977-05-02', 'Nevado con glaciares'),
('Parque Utría', '1987-03-14', 'Bahía en el Chocó'),
('Parque Puracé', '1968-08-15', 'Volcán activo'),
('Parque Iguaque', '1977-09-09', 'Santuario de flora y fauna'),
('Parque Tinigua', '1989-12-15', 'Selva entre Meta y Caquetá'),
('Parque Catatumbo', '1990-03-10', 'Hogar del relámpago del Catatumbo'),
('Parque Farallones de Cali', '1968-05-20', 'Reserva montañosa en Valle'),
('Parque Sumapaz', '1977-06-30', 'Páramo más grande del mundo'),
('Parque Cahuinarí', '1987-08-12', 'Selva amazónica profunda'),
('Parque Malpelo', '1995-11-25', 'Santuario marino en el Pacífico'),
('Parque Corales del Rosario', '1977-04-18', 'Arrecifes en el Caribe'),
('Parque Old Providence', '1996-02-14', 'Reserva en San Andrés'),
('Parque Munchique', '1978-09-05', 'Bosque nublado en Cauca'),
('Parque Las Hermosas', '1975-07-22', 'Zona de páramo en Tolima'),
('Parque Paramillo', '1977-10-30', 'Cordillera Occidental'),
('Parque Pisba', '1980-01-15', 'Páramo en Boyacá'),
('Parque Tamá', '1982-03-20', 'Frontera con Venezuela'),
('Parque La Paya', '1984-06-10', 'Selva en Putumayo'),
('Parque Cueva de los Guácharos', '1960-08-25', 'Cueva y bosque andino'),
('Parque Macuira', '1977-11-12', 'Oasis en La Guajira'),
('Parque Isla de Salamanca', '1964-09-18', 'Manglares en Magdalena'),
('Parque El Tuparro', '1980-07-05', 'Sabana en Vichada'),
('Parque Río Puré', '2002-12-20', 'Selva virgen en Amazonas'),
('Parque Serranía de los Yariguíes', '2005-04-15', 'Bosque en Santander'),
('Parque Tatamá', '1987-05-30', 'Reserva en Risaralda'),
('Parque Serranía del Baudó', '1990-09-10', 'Selva en Chocó'),
('Parque Los Katíos', '1985-02-28', 'Frontera con Panamá'),
('Parque Las Orquídeas', '1974-11-15', 'Bosque en Antioquia'),
('Parque El Gallineral', '1988-06-22', 'Reserva en Santander'),
('Parque Alto Fragua', '2002-03-18', 'Piedemonte en Caquetá'),
('Parque Sierra Nevada del Cocuy', '1977-08-09', 'Glaciares en Arauca'),
('Parque Sanquianga', '1977-12-05', 'Manglares en Nariño'),
('Parque Los Picachos', '1979-04-20', 'Cordillera en Huila'),
('Parque Serranía de los Churumbelos', '2007-07-25', 'Selva en Cauca'),
('Parque El Tamá', '1982-10-15', 'Bosque nublado en Norte Santander'),
('Parque La Chorrera', '1995-05-30', 'Cascada en Cundinamarca'),
('Parque Chingaza', '1977-06-18', 'Páramo en Cundinamarca'),
('Parque El Mono Hernández', '1989-09-25', 'Bosque en Córdoba'),
('Parque Serranía de la Lindosa', '1990-11-10', 'Pinturas rupestres en Guaviare'),
('Parque Los Flamencos', '1978-02-14', 'Santuario en La Guajira'),
('Parque Bahía Portete', '1985-07-20', 'Costas en La Guajira'),
('Parque Isla Gorgonilla', '1984-08-15', 'Extensión de Gorgona'),
('Parque Matarredonda', '1980-03-12', 'Páramo en Cundinamarca'),
('Parque Río Bita', '2008-06-30', 'Río protegido en Vichada');

-- Tabla parque_departamento
INSERT INTO parque_departamento (id_parque, id_departamento) VALUES
(1, 1), (1, 5), (2, 4), (3, 2), (4, 1),
(5, 6), (6, 9), (7, 8), (8, 10), (9, 9),
(10, 8), (11, 11), (12, 12), (13, 13), (14, 14),
(15, 15), (16, 16), (17, 17), (18, 18), (19, 19),
(20, 20), (21, 21), (22, 22), (23, 23), (24, 24),
(25, 25), (26, 26), (27, 27), (28, 28), (29, 29),
(30, 30), (31, 31), (32, 32), (33, 33), (34, 34),
(35, 35), (36, 36), (37, 37), (38, 38), (39, 39),
(40, 40), (41, 41), (42, 42), (43, 43), (44, 44),
(45, 45), (46, 46), (47, 47), (48, 48), (49, 49);

-- Tabla area
INSERT INTO area (id_parque, nombre, extension_hectareas, descripcion) VALUES
(1, 'Zona Norte', 1500000.00, 'Área de selva primaria'),
(2, 'Playa Cristal', 12000.50, 'Zona costera protegida'),
(3, 'Nevado del Ruiz', 58000.75, 'Zona volcánica'),
(4, 'Laguna Tarapoto', 4500.30, 'Humedal amazónico'),
(5, 'Caño Cristales', 650.00, 'Río de los cinco colores'),
(6, 'Isla Gorgonilla', 2300.25, 'Refugio de tortugas'),
(7, 'Ritacuba Blanco', 30600.00, 'Pico más alto del Cocuy'),
(8, 'Ensenada de Utría', 5600.90, 'Manglares y ballenas'),
(9, 'Laguna San Rafael', 8300.40, 'Zona de páramo'),
(10, 'Laguna de Iguaque', 6750.60, 'Cuna del agua Muisca'),
(11, 'Zona Sur', 45000.00, 'Bosque húmedo tropical'),
(12, 'Páramo de Pisba', 32000.50, 'Ecosistema de alta montaña'),
(13, 'Selva Central', 78000.25, 'Área de biodiversidad'),
(14, 'Laguna Negra', 2300.75, 'Humedal de altura'),
(15, 'Río Puré', 8900.30, 'Corriente principal del parque'),
(16, 'Cueva del Guácharo', 1500.40, 'Cueva con aves nocturnas'),
(17, 'Playa Brava', 6700.60, 'Costa protegida'),
(18, 'Nevado del Tolima', 42000.80, 'Zona glaciar'),
(19, 'Manglar Norte', 9800.90, 'Ecosistema costero'),
(20, 'Cerro Macuira', 3500.20, 'Oasis en el desierto'),
(21, 'Zona Este', 123000.00, 'Selva densa'),
(22, 'Laguna del Silencio', 5400.50, 'Área de páramo'),
(23, 'Isla Malpelo', 8600.75, 'Santuario marino'),
(24, 'Bosque Nublado', 25000.30, 'Área de niebla'),
(25, 'Caño Rojo', 780.90, 'Río de aguas cristalinas'),
(26, 'Pico Tamá', 39000.60, 'Cumbre andina'),
(27, 'Bahía Solano', 6700.20, 'Zona de avistamiento'),
(28, 'Sendero Alto', 4500.40, 'Ruta de montaña'),
(29, 'Río Bita', 9200.80, 'Corriente de sabana'),
(30, 'Playa Dorada', 3400.90, 'Costa caribeña'),
(31, 'Zona Occidental', 145000.00, 'Selva primaria'),
(32, 'Páramo Sumapaz', 68000.50, 'Reserva hídrica'),
(33, 'Cascada La Chorrera', 2300.75, 'Caída de agua'),
(34, 'Laguna Verde', 5600.30, 'Humedal andino'),
(35, 'Arrecife Rosario', 8900.40, 'Zona coralina'),
(36, 'Cerro Tatamá', 42000.60, 'Bosque montañoso'),
(37, 'Río Sanquianga', 6700.80, 'Manglares y estuarios'),
(38, 'Pico Lindosa', 3400.90, 'Pinturas rupestres'),
(39, 'Playa Flamingo', 7800.20, 'Santuario de aves'),
(40, 'Zona Central', 123000.50, 'Área de transición'),
(41, 'Nevado Santa Isabel', 56000.75, 'Glaciar activo'),
(42, 'Laguna Otún', 2300.30, 'Humedal de montaña'),
(43, 'Río Yarí', 8900.40, 'Selva amazónica'),
(44, 'Bosque Seco', 34000.60, 'Ecosistema árido'),
(45, 'Cueva de los Tayos', 6700.80, 'Refugio subterráneo'),
(46, 'Playa Blanca', 2300.90, 'Costa pacífica'),
(47, 'Cerro Paramillo', 78000.20, 'Cumbre noroccidental'),
(48, 'Río Churumbelos', 4500.40, 'Corriente selvática'),
(49, 'Laguna del Cocuy', 9200.80, 'Zona glaciar'),
(50, 'Bahía Portete', 3400.90, 'Costa desértica');

-- Tabla especie
INSERT INTO especie (id_tipo_especie, denominacion_cientifica, denominacion_vulgar, descripcion) VALUES
(1, 'Ceiba pentandra', 'Ceiba', 'Árbol sagrado de la Amazonía'),
(2, 'Panthera onca', 'Jaguar', 'Felino más grande de América'),
(3, 'Quartz', 'Cuarzo', 'Mineral común en rocas'),
(1, 'Anacardium excelsum', 'Caracolí', 'Árbol maderable'),
(2, 'Tapirus terrestris', 'Danta', 'Mamífero herbívoro'),
(3, 'Pyrite', 'Pirita', 'Mineral dorado'),
(1, 'Mauritia flexuosa', 'Moriche', 'Palma de humedales'),
(2, 'Andigena laminirostris', 'Tucán andino', 'Ave de bosques nublados'),
(3, 'Calcite', 'Calcita', 'Mineral carbonato'),
(2, 'Tremarctos ornatus', 'Oso de anteojos', 'Úrsido sudamericano'),
(1, 'Euterpe oleracea', 'Açaí', 'Palma de frutos comestibles'),
(2, 'Puma concolor', 'Puma', 'Felino de amplia distribución'),
(3, 'Feldspar', 'Feldespato', 'Mineral común en granitos'),
(1, 'Swietenia macrophylla', 'Caoba', 'Árbol maderable tropical'),
(2, 'Caiman crocodilus', 'Caimán', 'Reptil de ríos y lagunas'),
(3, 'Mica', 'Mica', 'Mineral brillante en capas'),
(1, 'Astrocaryum chambira', 'Chambira', 'Palma para artesanías'),
(2, 'Ara macao', 'Guacamaya roja', 'Ave de plumaje colorido'),
(3, 'Hematite', 'Hematita', 'Mineral de hierro rojizo'),
(2, 'Hydrochoerus hydrochaeris', 'Chigüiro', 'Roedor de sabanas'),
(1, 'Cedrela odorata', 'Cedro', 'Árbol aromático maderable'),
(2, 'Eunectes murinus', 'Anaconda', 'Serpiente gigante acuática'),
(3, 'Garnet', 'Granate', 'Mineral semiprecioso'),
(1, 'Inga edulis', 'Guaba', 'Árbol frutal de sombra'),
(2, 'Myrmecophaga tridactyla', 'Oso hormiguero', 'Mamífero de lengua larga'),
(3, 'Tourmaline', 'Turmalina', 'Mineral de colores variados'),
(1, 'Bactris gasipaes', 'Chontaduro', 'Palma de fruto nutritivo'),
(2, 'Cebus capucinus', 'Mono capuchino', 'Primate de selva'),
(3, 'Obsidian', 'Obsidiana', 'Vidrio volcánico negro'),
(2, 'Bradypus variegatus', 'Perezoso', 'Mamífero arborícola lento'),
(1, 'Tabebuia rosea', 'Roble', 'Árbol de flores rosadas'),
(2, 'Leopardus pardalis', 'Ocelote', 'Felino nocturno'),
(3, 'Amethyst', 'Amatista', 'Cuarzo púrpura precioso'),
(1, 'Goupia glabra', 'Cachicamo', 'Árbol de madera dura'),
(2, 'Saimiri sciureus', 'Mono ardilla', 'Primate pequeño y ágil'),
(3, 'Malachite', 'Malaquita', 'Mineral verde ornamental'),
(1, 'Oenocarpus bataua', 'Milpesos', 'Palma de aceite nativa'),
(2, 'Priodontes maximus', 'Armadillo gigante', 'Mamífero acorazado'),
(3, 'Fluorite', 'Fluorita', 'Mineral fluorescente'),
(2, 'Ramphastos tucanus', 'Tucán pico blanco', 'Ave de pico grande'),
(1, 'Hevea brasiliensis', 'Caucho', 'Árbol de látex natural'),
(2, 'Dasyprocta fuliginosa', 'Agutí', 'Roedor de selva'),
(3, 'Topaz', 'Topacio', 'Mineral transparente'),
(1, 'Carapa guianensis', 'Andiroba', 'Árbol medicinal'),
(2, 'Ateles paniscus', 'Mono araña', 'Primate de cola prensil'),
(3, 'Gypsum', 'Yeso', 'Mineral sedimentario'),
(1, 'Copaifera officinalis', 'Copaiba', 'Árbol de resina curativa'),
(2, 'Harpia harpyja', 'Águila arpía', 'Ave rapaz poderosa'),
(3, 'Beryl', 'Berilo', 'Mineral base de esmeraldas'),
(2, 'Crocodylus intermedius', 'Caimán del Orinoco', 'Reptil en peligro');

-- Tabla area_especie
INSERT INTO area_especie (id_area, id_especie, numero_inventario, fecha_ultimo_conteo, observaciones) VALUES
(1, 2, 15, '2023-10-01', 'Avistamientos en cámaras trampa'),
(2, 5, 8, '2023-09-15', 'Huellas en playa'),
(3, 8, 22, '2023-08-20', 'Nidos identificados'),
(4, 1, 50, '2023-10-05', 'Registro de árboles centenarios'),
(5, 10, 3, '2023-07-12', 'Madriguera activa'),
(6, 3, 120, '2023-06-30', 'Depósitos minerales'),
(7, 7, 30, '2023-09-01', 'Palmeras en crecimiento'),
(8, 4, 45, '2023-08-10', 'Reforestación exitosa'),
(9, 6, 90, '2023-07-22', 'Yacimientos confirmados'),
(10, 9, 200, '2023-10-10', 'Mineral común en zona'),
(11, 11, 25, '2023-11-01', 'Árboles jóvenes detectados'),
(12, 12, 10, '2023-10-15', 'Felinos avistados'),
(13, 13, 150, '2023-09-20', 'Cristales encontrados'),
(14, 14, 40, '2023-08-25', 'Palmas en recuperación'),
(15, 15, 5, '2023-07-30', 'Reptiles en orillas'),
(16, 16, 80, '2023-06-15', 'Depósitos brillantes'),
(17, 17, 15, '2023-11-05', 'Aves en migración'),
(18, 18, 60, '2023-10-20', 'Árboles talados ilegalmente'),
(19, 19, 12, '2023-09-10', 'Roedores en aumento'),
(20, 20, 100, '2023-08-05', 'Rocas ornamentales'),
(21, 21, 20, '2023-07-15', 'Felinos nocturnos'),
(22, 22, 35, '2023-11-10', 'Frutales silvestres'),
(23, 23, 8, '2023-10-25', 'Mamíferos marinos'),
(24, 24, 70, '2023-09-15', 'Yacimientos profundos'),
(25, 25, 18, '2023-08-30', 'Aves en nidos'),
(26, 26, 45, '2023-07-20', 'Árboles en floración'),
(27, 27, 6, '2023-11-01', 'Caimanes juveniles'),
(28, 28, 90, '2023-10-10', 'Cristales puros'),
(29, 29, 30, '2023-09-05', 'Palmas afectadas por plagas'),
(30, 30, 14, '2023-08-15', 'Monos en grupos'),
(31, 31, 200, '2023-07-25', 'Depósitos extensos'),
(32, 32, 25, '2023-11-15', 'Árboles en regeneración'),
(33, 33, 9, '2023-10-05', 'Felinos en cacería'),
(34, 34, 60, '2023-09-25', 'Rocas sedimentarias'),
(35, 35, 12, '2023-08-20', 'Aves acuáticas'),
(36, 36, 40, '2023-07-10', 'Árboles maderables'),
(37, 37, 7, '2023-11-20', 'Mamíferos en riesgo'),
(38, 38, 85, '2023-10-15', 'Minerales raros'),
(39, 39, 20, '2023-09-30', 'Palmas en crecimiento'),
(40, 40, 15, '2023-08-25', 'Reptiles en cuevas'),
(41, 41, 110, '2023-07-05', 'Cristales en superficie'),
(42, 42, 30, '2023-11-25', 'Árboles frutales'),
(43, 43, 4, '2023-10-30', 'Felinos solitarios'),
(44, 44, 75, '2023-09-15', 'Yacimientos expuestos'),
(45, 45, 18, '2023-08-10', 'Aves rapaces'),
(46, 46, 50, '2023-07-15', 'Árboles en restauración'),
(47, 47, 10, '2023-11-30', 'Mamíferos migratorios'),
(48, 48, 95, '2023-10-20', 'Rocas volcánicas'),
(49, 49, 25, '2023-09-25', 'Palmas jóvenes'),
(50, 50, 12, '2023-08-30', 'Monos en observación');

-- Tabla personal
INSERT INTO personal (cedula, nombre, apellido, direccion, telefono_fijo, telefono_movil, email, fecha_contratacion, sueldo, id_tipo_personal) VALUES
('1234567890', 'María', 'Gómez', 'Calle 10, Bogotá', '6012345', '3001112233', 'maria@parques.com', '2020-05-15', 3500000.00, 1),
('0987654321', 'Carlos', 'López', 'Av. 5, Medellín', '6045678', '3104445566', 'carlos@parques.com', '2019-08-20', 4200000.00, 2),
('1122334455', 'Ana', 'Martínez', 'Carrera 20, Cali', '6023456', '3207778899', 'ana@parques.com', '2021-03-10', 2800000.00, 3),
('2233445566', 'Pedro', 'Ramírez', 'Calle 30, Leticia', NULL, '3156667788', 'pedro@parques.com', '2022-01-05', 3100000.00, 4),
('3344556677', 'Luisa', 'Fernández', 'Av. 8, Santa Marta', '6056789', '3008889900', 'luisa@parques.com', '2018-11-12', 3800000.00, 1),
('4455667788', 'Jorge', 'Díaz', 'Carrera 15, Villavicencio', '6078901', '3112223344', 'jorge@parques.com', '2020-07-22', 4000000.00, 2),
('5566778899', 'Sofía', 'Herrera', 'Calle 25, San José', NULL, '3175556677', 'sofia@parques.com', '2023-02-14', 2650000.00, 3),
('6677889900', 'Andrés', 'Castro', 'Av. 12, Pereira', '6089012', '3189990011', 'andres@parques.com', '2019-04-30', 2950000.00, 4),
('7788990011', 'Camila', 'Rojas', 'Carrera 7, Manizales', '6090123', '3141122334', 'camila@parques.com', '2021-09-18', 3400000.00, 1),
('8899001122', 'Diego', 'Silva', 'Calle 40, Pasto', '6011122', '3134455667', 'diego@parques.com', '2022-12-01', 3750000.00, 2),
('9900112233', 'Laura', 'Vega', 'Calle 50, Bogotá', '6012233', '3001234567', 'laura@parques.com', '2021-06-10', 3600000.00, 1),
('8800223344', 'Juan', 'Pérez', 'Av. 22, Medellín', '6043344', '3102345678', 'juan@parques.com', '2020-09-15', 4300000.00, 2),
('7700334455', 'Carmen', 'Ríos', 'Carrera 18, Cali', '6024455', '3203456789', 'carmen@parques.com', '2022-03-20', 2900000.00, 3),
('6600445566', 'Ricardo', 'Soto', 'Calle 9, Leticia', NULL, '3154567890', 'ricardo@parques.com', '2019-11-25', 3200000.00, 4),
('5500556677', 'Fernanda', 'Guzmán', 'Av. 3, Santa Marta', '6055566', '3005678901', 'fernanda@parques.com', '2023-01-10', 3700000.00, 1),
('4400667788', 'Héctor', 'Miranda', 'Carrera 5, Villavicencio', '6076677', '3106789012', 'hector@parques.com', '2021-08-05', 4100000.00, 2),
('3300778899', 'Isabel', 'Cortés', 'Calle 12, San José', NULL, '3207890123', 'isabel@parques.com', '2020-04-15', 2750000.00, 3),
('2200889900', 'Gabriel', 'Paredes', 'Av. 45, Pereira', '6087788', '3158901234', 'gabriel@parques.com', '2022-07-20', 3000000.00, 4),
('1100990011', 'Valeria', 'Navarro', 'Carrera 30, Manizales', '6098899', '3009012345', 'valeria@parques.com', '2019-12-30', 3500000.00, 1),
('0011001122', 'Óscar', 'Fuentes', 'Calle 7, Pasto', '6019900', '3100123456', 'oscar@parques.com', '2021-02-25', 3900000.00, 2),
('1122112233', 'Paula', 'Molina', 'Calle 15, Bogotá', '6010011', '3201234567', 'paula@parques.com', '2023-05-15', 2850000.00, 3),
('2233223344', 'Santiago', 'Ortiz', 'Av. 10, Medellín', '6041122', '3152345678', 'santiago@parques.com', '2020-10-10', 3300000.00, 4),
('3344334455', 'Elena', 'Castaño', 'Carrera 25, Cali', '6022233', '3003456789', 'elena@parques.com', '2022-09-05', 3800000.00, 1),
('4455445566', 'Mateo', 'Vargas', 'Calle 35, Leticia', NULL, '3104567890', 'mateo@parques.com', '2021-11-15', 4200000.00, 2),
('5566556677', 'Clara', 'Reyes', 'Av. 6, Santa Marta', '6053344', '3205678901', 'clara@parques.com', '2019-07-20', 2950000.00, 3),
('6677667788', 'Felipe', 'Moreno', 'Carrera 8, Villavicencio', '6074455', '3156789012', 'felipe@parques.com', '2023-03-10', 3100000.00, 4),
('7788778899', 'Natalia', 'Cruz', 'Calle 18, San José', NULL, '3007890123', 'natalia@parques.com', '2020-12-25', 3600000.00, 1),
('8899889900', 'Daniel', 'García', 'Av. 20, Pereira', '6085566', '3108901234', 'daniel@parques.com', '2022-06-30', 4000000.00, 2),
('9900990011', 'Sara', 'Luna', 'Carrera 12, Manizales', '6096677', '3209012345', 'sara@parques.com', '2021-04-20', 2700000.00, 3),
('0011111122', 'Luis', 'Torres', 'Calle 5, Pasto', '6017788', '3150123456', 'luis@parques.com', '2019-09-15', 3400000.00, 4),
('1122222233', 'Mónica', 'Salazar', 'Calle 60, Bogotá', '6018899', '3001236789', 'monica@parques.com', '2023-02-05', 3700000.00, 1),
('2233333344', 'Javier', 'Rincón', 'Av. 30, Medellín', '6049900', '3102346789', 'javier@parques.com', '2020-08-10', 4300000.00, 2),
('3344444455', 'Diana', 'Bermúdez', 'Carrera 40, Cali', '6020011', '3203457890', 'diana@parques.com', '2022-01-25', 2800000.00, 3),
('4455555566', 'Pablo', 'Aguirre', 'Calle 45, Leticia', NULL, '3154568901', 'pablo@parques.com', '2021-10-30', 3200000.00, 4),
('5566666677', 'Carolina', 'Pinto', 'Av. 15, Santa Marta', '6051122', '3005679012', 'carolina@parques.com', '2019-06-15', 3900000.00, 1),
('6677777788', 'Emilio', 'Herrán', 'Carrera 22, Villavicencio', '6072233', '3106780123', 'emilio@parques.com', '2023-04-10', 4100000.00, 2),
('7788888899', 'Beatriz', 'Gil', 'Calle 28, San José', NULL, '3207891234', 'beatriz@parques.com', '2020-11-20', 2900000.00, 3),
('8899999900', 'Tomás', 'Mejía', 'Av. 25, Pereira', '6083344', '3158902345', 'tomas@parques.com', '2022-08-05', 3300000.00, 4),
('9900000011', 'Adriana', 'Ocampo', 'Carrera 17, Manizales', '6094455', '3009013456', 'adriana@parques.com', '2021-03-15', 3500000.00, 1),
('0011223344', 'Rafael', 'Zapata', 'Calle 3, Pasto', '6015566', '3100124567', 'rafael@parques.com', '2019-10-25', 4000000.00, 2),
('1122335566', 'Lorena', 'Céspedes', 'Calle 70, Bogotá', '6016677', '3201237890', 'lorena@parques.com', '2023-07-10', 2750000.00, 3),
('2233446677', 'Simón', 'Arango', 'Av. 35, Medellín', '6047788', '3152348901', 'simon@parques.com', '2020-05-20', 3100000.00, 4),
('3344557788', 'Patricia', 'León', 'Carrera 50, Cali', '6028899', '3003459012', 'patricia@parques.com', '2022-02-15', 3800000.00, 1),
('4455668899', 'Esteban', 'Rueda', 'Calle 55, Leticia', NULL, '3104560123', 'esteban@parques.com', '2021-12-10', 4200000.00, 2),
('5566779900', 'Juliana', 'Hurtado', 'Av. 9, Santa Marta', '6059900', '3205671234', 'juliana@parques.com', '2019-08-30', 2850000.00, 3),
('6677880011', 'Ignacio', 'Lara', 'Carrera 33, Villavicencio', '6070011', '3156782345', 'ignacio@parques.com', '2023-06-25', 3400000.00, 4),
('7788991122', 'Claudia', 'Mora', 'Calle 14, San José', NULL, '3007893456', 'claudia@parques.com', '2020-03-05', 3600000.00, 1),
('8899002233', 'Sebastián', 'Bolaños', 'Av. 40, Pereira', '6081122', '3108904567', 'sebastian@parques.com', '2022-09-20', 4100000.00, 2),
('9900113344', 'Alejandra', 'Serna', 'Carrera 19, Manizales', '6092233', '3209015678', 'alejandra@parques.com', '2021-07-15', 2950000.00, 3),
('0011224455', 'Mario', 'Cano', 'Calle 8, Pasto', '6013344', '3150126789', 'mario@parques.com', '2019-11-10', 3200000.00, 4);

-- Tabla entrada
INSERT INTO entrada (id_parque, nombre, ubicacion) VALUES
(1, 'Entrada Principal', 'Sector La Tunia'),
(2, 'Acceso Calabazo', 'Kilómetro 34 vía Santa Marta'),
(3, 'Portal Norte', 'Vía Manizales'),
(4, 'Puerto Nariño', 'Río Amazonas'),
(5, 'La Macarena', 'Vía a Caño Cristales'),
(6, 'Muelle Gorgona', 'Bahía de Guapi'),
(7, 'El Cocuy', 'Sector Güicán'),
(8, 'Bahía Solano', 'Vía al Pacífico'),
(9, 'San Juan de Villalobos', 'Carretera al Volcán'),
(10, 'Santuario', 'Sendero Muisca'),
(11, 'Acceso Tinigua', 'Vía San Vicente'),
(12, 'Puerto Catatumbo', 'Río Catatumbo'),
(13, 'Entrada Farallones', 'Kilómetro 18 vía Cali'),
(14, 'Portal Sumapaz', 'Carretera Pasca'),
(15, 'Muelle Cahuinarí', 'Río Caquetá'),
(16, 'Base Malpelo', 'Puerto de Buenaventura'),
(17, 'Acceso Rosario', 'Vía Cartagena'),
(18, 'Entrada Providence', 'Sector San Andrés'),
(19, 'Portal Munchique', 'Vía Tambo'),
(20, 'Camino Hermosas', 'Carretera Chaparral'),
(21, 'Entrada Paramillo', 'Vía Tierralta'),
(22, 'Paso Pisba', 'Sector Socha'),
(23, 'Puerto Tamá', 'Frontera Toledo'),
(24, 'Acceso La Paya', 'Río Putumayo'),
(25, 'Cueva Guácharos', 'Sendero Acevedo'),
(26, 'Ruta Macuira', 'Vía Uribia'),
(27, 'Muelle Salamanca', 'Vía Barranquilla'),
(28, 'Entrada Tuparro', 'Río Tomo'),
(29, 'Puerto Puré', 'Río Puré'),
(30, 'Acceso Yariguíes', 'Vía San Gil'),
(31, 'Portal Tatamá', 'Carretera Santuario'),
(32, 'Entrada Baudó', 'Vía Quibdó'),
(33, 'Paso Katíos', 'Frontera Turbo'),
(34, 'Ruta Orquídeas', 'Vía Urrao'),
(35, 'Acceso Gallineral', 'Sector El Retiro'),
(36, 'Entrada Fragua', 'Vía Morelia'),
(37, 'Portal Cocuy', 'Carretera Málaga'),
(38, 'Muelle Sanquianga', 'Río Sanquianga'),
(39, 'Acceso Picachos', 'Vía San Vicente'),
(40, 'Entrada Churumbelos', 'Carretera Mocoa'),
(41, 'Paso Tamá Norte', 'Vía Pamplona'),
(42, 'Ruta Chorrera', 'Sendero Fusagasugá'),
(43, 'Entrada Chingaza', 'Vía La Calera'),
(44, 'Acceso Mono', 'Carretera Montería'),
(45, 'Portal Lindosa', 'Vía San José'),
(46, 'Muelle Flamencos', 'Vía Riohacha'),
(47, 'Entrada Portete', 'Sector Cabo de la Vela'),
(48, 'Acceso Gorgonilla', 'Bahía Solano'),
(49, 'Ruta Matarredonda', 'Carretera Bogotá'),
(50, 'Puerto Bita', 'Río Bita');

-- Tabla personal_gestion
INSERT INTO personal_gestion (id_personal, id_entrada) VALUES
(1, 1), (5, 2), (9, 3), (10, 4), (4, 5),
(3, 6), (7, 7), (8, 8), (2, 9), (6, 10),
(1, 11), (5, 12), (9, 13), (13, 14), (17, 15),
(21, 16), (25, 17), (29, 18), (33, 19), (37, 20),
(41, 21), (45, 22), (1, 23), (5, 24), (9, 25),
(13, 26), (17, 27), (21, 28), (25, 29), (29, 30),
(33, 31), (37, 32), (41, 33), (45, 34), (1, 35),
(5, 36), (9, 37), (13, 38), (17, 39), (21, 40),
(25, 41), (29, 42), (33, 43), (37, 44), (41, 45),
(45, 46), (1, 47), (5, 48), (9, 49), (13, 50);

-- Tabla tipo_vehiculo
INSERT INTO tipo_vehiculo (nombre) VALUES
('Camioneta 4x4'), ('Cuatrimoto'), ('Lancha'), ('Bicicleta'), ('Jeep'),
('Moto Acuática'), ('Buggy'), ('Campero'), ('Bote'), ('Helicóptero'),
('Tractor'), ('Moto de Montaña'), ('Kayak'), ('Scooter'), ('Van'),
('Catamarán'), ('Dron'), ('Carro Eléctrico'), ('Canoa'), ('Avioneta'),
('Camión'), ('Patineta Eléctrica'), ('Velero'), ('Carreta'), ('Microbús'),
('Submarino'), ('Globo Aerostático'), ('Carro Todoterreno'), ('Raft'), ('Motoneta'),
('Barcaza'), ('Carro de Golf'), ('Zodiac'), ('Triciclo'), ('Furgoneta'),
('Hidroavión'), ('Skateboard'), ('Barco Pesquero'), ('Carro Blindado'), ('Hovercraft'),
('Camioneta Eléctrica'), ('Balsa'), ('Carro Anfibio'), ('Moto de Nieve'), ('Planeador'),
('Remolcador'), ('Carro de Carga'), ('Bote Inflable'), ('Carro Ligero'), ('Tanqueta');

-- Tabla vehiculo
INSERT INTO vehiculo (id_tipo_vehiculo, marca, modelo, placa, año) VALUES
(1, 'Toyota', 'Hilux', 'ABC123', 2020),
(2, 'Yamaha', 'YFM450', 'DEF456', 2022),
(3, 'Zodiac', 'Pro Open', 'GHI789', 2019),
(4, 'Trek', 'X-Caliber', 'JKL012', 2021),
(5, 'Jeep', 'Wrangler', 'MNO345', 2020),
(6, 'Sea-Doo', 'GTX', 'PQR678', 2023),
(7, 'Volkswagen', 'Buggy', 'STU901', 2018),
(8, 'Chevrolet', 'Blazer', 'VWX234', 2022),
(9, 'Mercury', 'Inflable', 'YZA567', 2021),
(10, 'Robinson', 'R44', 'BCD890', 2020),
(11, 'John Deere', 'Gator', 'EFG123', 2021),
(12, 'Honda', 'CRF250', 'HIJ456', 2020),
(13, 'Pelican', 'Bass Raider', 'KLM789', 2022),
(14, 'Specialized', 'Rockhopper', 'NOP012', 2019),
(15, 'Ford', 'Ranger', 'QRS345', 2023),
(16, 'Yamaha', 'Waverunner', 'TUV678', 2021),
(17, 'Polaris', 'RZR', 'WXY901', 2020),
(18, 'Nissan', 'Patrol', 'ZAB234', 2022),
(19, 'Intex', 'Challenger', 'CDE567', 2019),
(20, 'Cessna', '172', 'FGH890', 2021),
(21, 'Volvo', 'FMX', 'IJK123', 2020),
(22, 'Razor', 'SX500', 'LMN456', 2023),
(23, 'Beneteau', 'Antares', 'OPQ789', 2021),
(24, 'Mule', 'Pro-FX', 'RST012', 2019),
(25, 'Mercedes', 'Sprinter', 'UVW345', 2022),
(26, 'Nautilus', 'Explorer', 'XYZ678', 2020),
(27, 'Lindstrand', 'L77', 'ABC901', 2021),
(28, 'Land Rover', 'Defender', 'DEF234', 2023),
(29, 'Old Town', 'Predator', 'GHI567', 2019),
(30, 'Vespa', 'Primavera', 'JKL890', 2022),
(31, 'BargeCo', 'Flatbed', 'MNO123', 2020),
(32, 'EZ-GO', 'TXT', 'PQR456', 2021),
(33, 'Achilles', 'HB-315', 'STU789', 2023),
(34, 'Raleigh', 'Mojave', 'VWX012', 2019),
(35, 'Renault', 'Kangoo', 'YZA345', 2022),
(36, 'Piper', 'Saratoga', 'BCD678', 2020),
(37, 'Bird', 'Air', 'EFG901', 2021),
(38, 'Carver', 'Trawler', 'HIJ234', 2023),
(39, 'Toyota', 'Land Cruiser', 'KLM567', 2019),
(40, 'Airbus', 'H125', 'NOP890', 2022),
(41, 'Ford', 'F-150', 'QRS123', 2020),
(42, 'Walker Bay', 'Odyssey', 'TUV456', 2021),
(43, 'Suzuki', 'Jimny', 'WXY789', 2023),
(44, 'Kawasaki', 'Teryx', 'ZAB012', 2019),
(45, 'DJI', 'Mavic', 'CDE345', 2022),
(46, 'TugMaster', 'Tug 600', 'FGH678', 2020),
(47, 'Isuzu', 'NPR', 'IJK901', 2021),
(48, 'Saturn', 'RIB', 'LMN234', 2023),
(49, 'Mitsubishi', 'Outlander', 'OPQ567', 2019),
(50, 'Bell', '206', 'RST890', 2022);

-- Tabla personal_vigilancia
INSERT INTO personal_vigilancia (id_personal, id_vehiculo) VALUES
(2, 1), (6, 2), (10, 3), (3, 4), (7, 5),
(5, 6), (8, 7), (1, 8), (4, 9), (9, 10),
(2, 11), (6, 12), (10, 13), (14, 14), (18, 15),
(22, 16), (26, 17), (30, 18), (34, 19), (38, 20),
(42, 21), (46, 22), (2, 23), (6, 24), (10, 25),
(14, 26), (18, 27), (22, 28), (26, 29), (30, 30),
(34, 31), (38, 32), (42, 33), (46, 34), (2, 35),
(6, 36), (10, 37), (14, 38), (18, 39), (22, 40),
(26, 41), (30, 42), (34, 43), (38, 44), (42, 45),
(46, 46), (2, 47), (6, 48), (10, 49), (14, 50);

-- Tabla area_vigilancia
INSERT INTO area_vigilancia (id_personal, id_area, fecha_asignacion) VALUES
(2, 1, '2023-01-10'), (6, 2, '2023-02-15'), (10, 3, '2023-03-20'),
(3, 4, '2023-04-25'), (7, 5, '2023-05-05'), (5, 6, '2023-06-12'),
(8, 7, '2023-07-18'), (1, 8, '2023-08-22'), (4, 9, '2023-09-30'),
(9, 10, '2023-10-07'), (2, 11, '2023-11-01'), (6, 12, '2023-11-05'),
(10, 13, '2023-11-10'),(14, 14, '2023-11-15'), (18, 15, '2023-11-20'),
(26, 17, '2023-12-01'), (30, 18, '2023-12-05'), (34, 19, '2023-12-10'),
(38, 20, '2023-12-15'), (42, 21, '2023-12-20'), (46, 22, '2023-12-25'),
(2, 23, '2024-01-01'), (6, 24, '2024-01-05'), (10, 25, '2024-01-10'),
(14, 26, '2024-01-15'), (18, 27, '2024-01-20'), (22, 28, '2024-01-25'),
(26, 29, '2024-02-01'), (30, 30, '2024-02-05'), (34, 31, '2024-02-10'),
(38, 32, '2024-02-15'), (42, 33, '2024-02-20'), (46, 34, '2024-02-25'),
(2, 35, '2024-03-01'), (6, 36, '2024-03-05'), (10, 37, '2024-03-10'),
(14, 38, '2024-03-15'), (18, 39, '2024-03-20'), (22, 40, '2024-03-25'),
(26, 41, '2024-04-01'), (30, 42, '2024-04-05'), (34, 43, '2024-04-10'),
(38, 44, '2024-04-15'), (42, 45, '2024-04-20'), (46, 46, '2024-04-25'),
(2, 47, '2024-05-01'), (6, 48, '2024-05-05'), (10, 49, '2024-05-10'),
(22, 16, '2023-11-25'), (14, 50, '2024-05-15');

-- Tabla especialidad_conservacion
INSERT INTO especialidad_conservacion (nombre, descripcion) VALUES
('Limpieza de senderos', 'Mantenimiento de rutas turísticas'),
('Reforestación', 'Siembra de especies nativas'),
('Control de erosión', 'Protección de suelos'),
('Monitoreo de fauna', 'Seguimiento de poblaciones animales'),
('Educación ambiental', 'Charlas a visitantes'),
('Manejo de residuos', 'Reciclaje en áreas públicas'),
('Restauración ecológica', 'Recuperación de ecosistemas'),
('Combate de incendios', 'Prevención y control de fuego'),
('Cuidado de humedales', 'Protección de cuerpos de agua'),
('Jardinería nativa', 'Cultivo de plantas autóctonas'),
('Control de especies invasoras', 'Eliminación de flora y fauna no nativa'),
('Monitoreo de agua', 'Análisis de calidad en ríos y lagunas'),
('Protección de nidos', 'Cuidado de aves en reproducción'),
('Reparación de cercas', 'Mantenimiento de límites del parque'),
('Cartografía ecológica', 'Mapeo de ecosistemas'),
('Control de plagas', 'Gestión de insectos dañinos'),
('Reintroducción de especies', 'Liberación de animales nativos'),
('Mantenimiento de puentes', 'Reparación de estructuras en senderos'),
('Vigilancia de caza ilegal', 'Prevención de actividades furtivas'),
('Conservación de suelos', 'Técnicas para evitar desertificación'),
('Monitoreo climático', 'Registro de cambios meteorológicos'),
('Protección de arrecifes', 'Cuidado de ecosistemas marinos'),
('Recuperación de manglares', 'Restauración de bosques costeros'),
('Gestión de pastizales', 'Mantenimiento de áreas de sabana'),
('Control de ruido', 'Reducción de impacto sonoro'),
('Manejo de caminos', 'Acondicionamiento de vías internas'),
('Protección de cuevas', 'Conservación de sistemas subterráneos'),
('Monitoreo de flora', 'Seguimiento de plantas endémicas'),
('Prevención de deslizamientos', 'Estabilización de terrenos'),
('Cuidado de glaciares', 'Protección de zonas de hielo'),
('Gestión de visitantes', 'Control de aforo en áreas sensibles'),
('Restauración de ríos', 'Limpieza y recuperación de cauces'),
('Control de contaminación', 'Mitigación de desechos químicos'),
('Protección de aves migratorias', 'Cuidado de rutas estacionales'),
('Mantenimiento de miradores', 'Reparación de puntos de observación'),
('Conservación de semillas', 'Banco de germoplasma nativo'),
('Monitoreo de incendios', 'Detección temprana de fuego'),
('Cuidado de dunas', 'Protección de ecosistemas desérticos'),
('Gestión de pesca sostenible', 'Regulación en cuerpos de agua'),
('Protección de pinturas rupestres', 'Cuidado de patrimonio arqueológico'),
('Rehabilitación de fauna', 'Atención a animales heridos'),
('Control de tráfico', 'Gestión de vehículos en el parque'),
('Manejo de zonas buffer', 'Protección de áreas periféricas'),
('Monitoreo de aire', 'Medición de calidad atmosférica'),
('Restauración de páramos', 'Recuperación de ecosistemas de altura'),
('Cuidado de playas', 'Limpieza y protección costera'),
('Gestión de energía renovable', 'Mantenimiento de paneles solares'),
('Protección de humedales altos', 'Cuidado de turberas'),
('Control de erosión costera', 'Estabilización de litorales'),
('Mantenimiento de señalización', 'Reparación de carteles informativos');

-- Tabla personal_conservacion
INSERT INTO personal_conservacion (id_personal, id_especialidad) VALUES
(3, 1), (7, 2), (5, 3), (8, 4), (1, 5),
(4, 6), (9, 7), (2, 8), (6, 9), (10, 10),
(3, 11), (7, 12), (11, 13), (15, 14), (19, 15),
(23, 16), (27, 17), (31, 18), (35, 19), (39, 20),
(43, 21), (47, 22), (3, 23), (7, 24), (11, 25),
(15, 26), (19, 27), (23, 28), (27, 29), (31, 30),
(35, 31), (39, 32), (43, 33), (47, 34), (3, 35),
(7, 36), (11, 37), (15, 38), (19, 39), (23, 40),
(27, 41), (31, 42), (35, 43), (39, 44), (43, 45),
(47, 46), (3, 47), (7, 48), (11, 49), (15, 50);

-- Tabla area_conservacion
INSERT INTO area_conservacion (id_personal, id_area, fecha_asignacion) VALUES
(3, 1, '2023-01-05'), (7, 2, '2023-02-10'), (5, 3, '2023-03-15'),
(8, 4, '2023-04-20'), (1, 5, '2023-05-25'), (4, 6, '2023-06-30'),
(9, 7, '2023-07-05'), (2, 8, '2023-08-10'), (6, 9, '2023-09-15'),
(10, 10, '2023-10-20'), (3, 11, '2023-11-01'), (7, 12, '2023-11-05'),
(15, 14, '2023-11-15'), (19, 15, '2023-11-20'), (23, 16, '2023-11-25'),
(27, 17, '2023-12-01'), (31, 18, '2023-12-05'), (35, 19, '2023-12-10'),
(39, 20, '2023-12-15'), (43, 21, '2023-12-20'), (47, 22, '2023-12-25'),
(3, 23, '2024-01-01'), (7, 24, '2024-01-05'), (11, 25, '2024-01-10'),
(15, 26, '2024-01-15'), (19, 27, '2024-01-20'), (23, 28, '2024-01-25'),
(27, 29, '2024-02-01'), (31, 30, '2024-02-05'), (35, 31, '2024-02-10'),
(39, 32, '2024-02-15'), (43, 33, '2024-02-20'), (47, 34, '2024-02-25'),
(3, 35, '2024-03-01'), (7, 36, '2024-03-05'), (11, 37, '2024-03-10'),
(15, 38, '2024-03-15'), (19, 39, '2024-03-20'), (23, 40, '2024-03-25'),
(27, 41, '2024-04-01'), (31, 42, '2024-04-05'), (35, 43, '2024-04-10'),
(39, 44, '2024-04-15'), (43, 45, '2024-04-20'), (47, 46, '2024-04-25'),
(3, 47, '2024-05-01'), (7, 48, '2024-05-05'), (11, 49, '2024-05-10'),
(11, 13, '2023-11-10'), (15, 50, '2024-05-15');

-- Tabla proyecto_investigacion
INSERT INTO proyecto_investigacion (nombre, descripcion, fecha_inicio, fecha_fin, presupuesto, estado) VALUES
('Estudio del Jaguar', 'Monitoreo de población en Chiribiquete', '2023-01-01', '2025-12-31', 500000000.00, 'En Proceso'),
('Biodiversidad Marina', 'Especies en Gorgona', '2022-06-15', '2024-06-15', 300000000.00, 'Aprobado'),
('Restauración de Páramos', 'Recuperación en Puracé', '2023-03-10', NULL, 250000000.00, 'Propuesto'),
('Minerales Andinos', 'Análisis en Cocuy', '2021-09-01', '2023-12-31', 150000000.00, 'Completado'),
('Aves Migratorias', 'Rutas en Tayrona', '2023-07-01', '2024-07-01', 180000000.00, 'En Proceso'),
('Impacto Turístico', 'Utría', '2022-12-01', '2023-11-30', 90000000.00, 'Cancelado'),
('Flora Endémica', 'Catálogo en Amacayacu', '2023-04-20', '2026-04-20', 400000000.00, 'En Proceso'),
('Cambio Climático', 'Monitoreo en Sierra Macarena', '2024-01-15', NULL, 600000000.00, 'Propuesto'),
('Ecosistemas Acuáticos', 'Humedales de Iguaque', '2023-08-10', '2025-08-10', 350000000.00, 'Aprobado'),
('Especies Invasoras', 'Control en Los Nevados', '2023-05-05', '2024-05-05', 120000000.00, 'En Proceso'),
('Selva Tinigua', 'Estudio de biodiversidad en Tinigua', '2022-05-10', '2024-05-10', 450000000.00, 'En Proceso'),
('Relámpagos Catatumbo', 'Análisis de fenómenos eléctricos', '2021-08-15', '2023-08-15', 200000000.00, 'Completado'),
('Flora Farallones', 'Inventario de plantas en Farallones', '2023-02-20', '2025-02-20', 280000000.00, 'Aprobado'),
('Páramo Sumapaz', 'Monitoreo hídrico en Sumapaz', '2024-03-01', NULL, 320000000.00, 'Propuesto'),
('Peces Cahuinarí', 'Diversidad íctica en el río', '2022-07-15', '2024-07-15', 260000000.00, 'En Proceso'),
('Tiburones Malpelo', 'Seguimiento de poblaciones marinas', '2023-06-10', '2025-06-10', 380000000.00, 'Aprobado'),
('Corales Rosario', 'Restauración de arrecifes', '2021-11-01', '2023-11-01', 150000000.00, 'Completado'),
('Arrecifes Providence', 'Estudio de ecosistemas coralinos', '2022-09-20', '2024-09-20', 340000000.00, 'En Proceso'),
('Aves Munchique', 'Censo de aves endémicas', '2023-01-15', '2025-01-15', 220000000.00, 'Aprobado'),
('Glaciares Hermosas', 'Impacto del deshielo', '2024-04-10', NULL, 400000000.00, 'Propuesto'),
('Biodiversidad Paramillo', 'Estudio de fauna y flora', '2022-03-25', '2024-03-25', 300000000.00, 'En Proceso'),
('Páramo Pisba', 'Recuperación de suelos', '2021-12-15', '2023-12-15', 180000000.00, 'Completado'),
('Osos Tamá', 'Seguimiento de osos andinos', '2023-05-20', '2025-05-20', 250000000.00, 'Aprobado'),
('Selva La Paya', 'Monitoreo de mamíferos', '2022-08-10', '2024-08-10', 320000000.00, 'En Proceso'),
('Cuevas Guácharos', 'Estudio de aves nocturnas', '2023-07-25', '2025-07-25', 140000000.00, 'Aprobado'),
('Oasis Macuira', 'Conservación en desierto', '2021-10-05', '2023-10-05', 200000000.00, 'Completado'),
('Manglares Salamanca', 'Restauración de ecosistemas', '2022-04-15', '2024-04-15', 270000000.00, 'En Proceso'),
('Sabanas Tuparro', 'Estudio de pastizales', '2023-09-01', NULL, 350000000.00, 'Propuesto'),
('Río Puré', 'Monitoreo de calidad hídrica', '2022-06-20', '2024-06-20', 230000000.00, 'Aprobado'),
('Bosques Yariguíes', 'Censo de árboles nativos', '2023-02-10', '2025-02-10', 290000000.00, 'En Proceso'),
('Nublados Tatamá', 'Estudio de bosques de niebla', '2021-11-20', '2023-11-20', 160000000.00, 'Completado'),
('Selva Baudó', 'Diversidad de anfibios', '2022-07-05', '2024-07-05', 310000000.00, 'En Proceso'),
('Frontera Katíos', 'Interacción ecológica fronteriza', '2023-03-15', '2025-03-15', 370000000.00, 'Aprobado'),
('Flora Orquídeas', 'Catálogo de orquídeas nativas', '2024-01-20', NULL, 420000000.00, 'Propuesto'),
('Árboles Gallineral', 'Estudio de especies arbóreas', '2022-05-30', '2024-05-30', 190000000.00, 'En Proceso'),
('Piedemonte Fragua', 'Monitoreo de transición ecológica', '2023-08-15', '2025-08-15', 260000000.00, 'Aprobado'),
('Cocuy Norte', 'Análisis de glaciares', '2021-12-01', '2023-12-01', 240000000.00, 'Completado'),
('Estuarios Sanquianga', 'Estudio de manglares', '2022-09-10', '2024-09-10', 300000000.00, 'En Proceso'),
('Cordillera Picachos', 'Seguimiento de aves rapaces', '2023-04-25', '2025-04-25', 210000000.00, 'Aprobado'),
('Selva Churumbelos', 'Inventario de reptiles', '2024-02-15', NULL, 380000000.00, 'Propuesto'),
('Tamá Norte', 'Monitoreo de mamíferos', '2022-06-25', '2024-06-25', 270000000.00, 'En Proceso'),
('Cascadas Chorrera', 'Estudio hidrológico', '2023-01-05', '2025-01-05', 230000000.00, 'Aprobado'),
('Agua Chingaza', 'Calidad de recursos hídricos', '2021-10-15', '2023-10-15', 200000000.00, 'Completado'),
('Humedales Mono', 'Diversidad de anfibios', '2022-07-20', '2024-07-20', 310000000.00, 'En Proceso'),
('Rupestres Lindosa', 'Análisis de arte prehistórico', '2023-05-15', '2025-05-15', 340000000.00, 'Aprobado'),
('Aves Flamencos', 'Seguimiento de aves costeras', '2024-03-20', NULL, 290000000.00, 'Propuesto'),
('Costas Portete', 'Erosión costera', '2022-08-05', '2024-08-05', 250000000.00, 'En Proceso'),
('Marina Gorgonilla', 'Estudio de fauna marina', '2023-02-25', '2025-02-25', 360000000.00, 'Aprobado'),
('Páramo Matarredonda', 'Restauración de turberas', '2021-11-10', '2023-11-10', 180000000.00, 'Completado'),
('Río Bita', 'Monitoreo de peces migratorios', '2022-04-10', '2024-04-10', 320000000.00, 'En Proceso');

-- Tabla personal_investigador
INSERT INTO personal_investigador (id_personal, especialidad, grado_academico) VALUES
(4, 'Biología de Felinos', 'Doctorado'),
(8, 'Ecología Marina', 'Maestría'),
(9, 'Geología', 'Licenciatura'),
(2, 'Botánica', 'Doctorado'),
(5, 'Ornitología', 'Maestría'),
(10, 'Sociología Ambiental', 'Licenciatura'),
(1, 'Climatología', 'Doctorado'),
(3, 'Hidrología', 'Maestría'),
(6, 'Microbiología', 'Doctorado'),
(7, 'Zoología', 'Licenciatura'),
(12, 'Ecología Forestal', 'Maestría'),
(16, 'Herpetología', 'Doctorado'),
(20, 'Ictiología', 'Licenciatura'),
(24, 'Entomología', 'Maestría'),
(28, 'Paleontología', 'Doctorado'),
(32, 'Fitopatología', 'Licenciatura'),
(36, 'Limnología', 'Maestría'),
(40, 'Mamalogía', 'Doctorado'),
(44, 'Micología', 'Licenciatura'),
(48, 'Oceanografía', 'Maestría'),
(4, 'Genética Animal', 'Doctorado'),
(8, 'Biogeografía', 'Licenciatura'),
(12, 'Conservación de Suelos', 'Maestría'),
(16, 'Etología', 'Doctorado'),
(20, 'Fisiología Vegetal', 'Licenciatura'),
(24, 'Taxonomía', 'Maestría'),
(28, 'Hidrogeología', 'Doctorado'),
(32, 'Biotecnología', 'Licenciatura'),
(36, 'Ecotoxicología', 'Maestría'),
(40, 'Arqueología Ambiental', 'Doctorado'),
(44, 'Silvicultura', 'Licenciatura'),
(48, 'Meteorología', 'Maestría'),
(4, 'Parasitología', 'Doctorado'),
(8, 'Ecología de Humedales', 'Licenciatura'),
(12, 'Gestión de Recursos', 'Maestría'),
(16, 'Biología Molecular', 'Doctorado'),
(20, 'Edafología', 'Licenciatura'),
(24, 'Bioacústica', 'Maestría'),
(28, 'Geobotánica', 'Doctorado'),
(32, 'Ecología Urbana', 'Licenciatura'),
(36, 'Química Ambiental', 'Maestría'),
(40, 'Paleoecología', 'Doctorado'),
(44, 'Fenología', 'Licenciatura'),
(48, 'Hidrobiología', 'Maestría'),
(4, 'Epidemiología Animal', 'Doctorado'),
(8, 'Dinámica de Poblaciones', 'Licenciatura'),
(12, 'Ecología del Paisaje', 'Maestría'),
(16, 'Biometría', 'Doctorado'),
(20, 'Sistemática', 'Licenciatura'),
(24, 'Ecología de Arrecifes', 'Maestría');

-- Tabla proyecto_investigador
INSERT INTO proyecto_investigador (id_proyecto, id_personal, rol, fecha_asignacion) VALUES
(1, 4, 'Investigador Principal', '2023-01-15'),
(2, 8, 'Coordinador de Campo', '2022-07-01'),
(3, 9, 'Asistente', '2023-03-20'),
(4, 2, 'Geólogo Senior', '2021-09-10'),
(5, 5, 'Ornitólogo', '2023-07-05'),
(6, 10, 'Analista de Datos', '2022-12-10'),
(7, 1, 'Botánico', '2023-05-01'),
(8, 3, 'Especialista en Clima', '2024-01-20'),
(9, 6, 'Hidrólogo', '2023-08-15'),
(10, 7, 'Coordinador', '2023-05-10'),
(11, 12, 'Investigador Principal', '2022-05-15'),
(12, 16, 'Coordinador de Campo', '2021-08-20'),
(13, 20, 'Botánico Senior', '2023-02-25'),
(14, 24, 'Analista de Datos', '2024-03-05'),
(15, 28, 'Ictiólogo', '2022-07-20'),
(16, 32, 'Especialista Marino', '2023-06-15'),
(17, 36, 'Asistente de Investigación', '2021-11-05'),
(18, 40, 'Oceanógrafo', '2022-09-25'),
(19, 44, 'Ornitólogo Principal', '2023-01-20'),
(20, 48, 'Glaciólogo', '2024-04-15'),
(21, 4, 'Ecólogo', '2022-03-30'),
(22, 8, 'Coordinador', '2021-12-20'),
(23, 12, 'Zoólogo Senior', '2023-05-25'),
(24, 16, 'Analista de Fauna', '2022-08-15'),
(25, 20, 'Espeleólogo', '2023-07-30'),
(26, 24, 'Botánico', '2021-10-10'),
(27, 28, 'Especialista en Manglares', '2022-04-20'),
(28, 32, 'Geógrafo', '2023-09-05'),
(29, 36, 'Hidrólogo Principal', '2022-06-25'),
(30, 40, 'Arborista', '2023-02-15'),
(31, 44, 'Entomólogo', '2021-11-25'),
(32, 48, 'Herpetólogo', '2022-07-10'),
(33, 4, 'Investigador Senior', '2023-03-20'),
(34, 8, 'Botánico Principal', '2024-01-25'),
(35, 12, 'Analista de Suelos', '2022-06-05'),
(36, 16, 'Ecólogo de Transición', '2023-08-20'),
(37, 20, 'Glaciólogo Senior', '2021-12-05'),
(38, 24, 'Coordinador de Campo', '2022-09-15'),
(39, 28, 'Ornitólogo', '2023-04-30'),
(40, 32, 'Reptilólogo', '2024-02-20'),
(41, 36, 'Zoólogo', '2022-06-30'),
(42, 40, 'Hidrólogo', '2023-01-10'),
(43, 44, 'Especialista en Agua', '2021-10-20'),
(44, 48, 'Anfibiólogo', '2022-07-25'),
(45, 4, 'Arqueólogo', '2023-05-20'),
(46, 8, 'Ornitólogo Senior', '2024-03-25'),
(47, 12, 'Geólogo Costero', '2022-08-10'),
(48, 16, 'Biólogo Marino', '2023-03-01'),
(49, 20, 'Especialista en Turberas', '2021-11-15'),
(50, 24, 'Ictiólogo Principal', '2022-04-15');

-- Tabla proyecto_especie
INSERT INTO proyecto_especie (id_proyecto, id_especie, observaciones) VALUES
(1, 2, 'Monitoreo con cámaras trampa en selva'),                  -- Jaguar en Chiribiquete
(2, 18, 'Estudio de hábitos alimenticios marinos'),              -- Guacamaya en Gorgona (adaptada, aves marinas)
(3, 7, 'Reforestación para estabilizar suelos'),                 -- Moriche en Puracé
(4, 3, 'Análisis de depósitos en zonas altas'),                  -- Cuarzo en Cocuy
(5, 8, 'Conteo de nidos en rutas migratorias'),                  -- Tucán andino en Tayrona
(6, 10, 'Impacto de senderos en poblaciones'),                   -- Oso de anteojos en Utría
(7, 14, 'Catálogo de especies endémicas'),                       -- Caoba en Amacayacu
(8, 30, 'Efectos en comportamiento por clima'),                  -- Perezoso en Sierra Macarena
(9, 15, 'Monitoreo de calidad en humedales'),                    -- Caimán en Iguaque
(10, 22, 'Control de especies invasoras'),                       -- Anaconda en Los Nevados
(11, 1, 'Censo de árboles en selva'),                            -- Ceiba en Tinigua
(12, 12, 'Seguimiento de felinos nocturnos'),                    -- Puma en Catatumbo
(13, 4, 'Registro de especies arbóreas'),                        -- Caracolí en Farallones
(14, 9, 'Análisis de suelos en páramo'),                         -- Calcita en Sumapaz
(15, 50, 'Estudio de migración fluvial'),                        -- Caimán del Orinoco en Cahuinarí
(16, 20, 'Monitoreo de mamíferos marinos'),                      -- Chigüiro en Malpelo (adaptado, fauna cercana)
(17, 17, 'Restauración de corales con palmas'),                  -- Chambira en Rosario
(18, 19, 'Análisis de depósitos en arrecifes'),                  -- Hematita en Providence
(19, 25, 'Conteo de hormigueros en bosques'),                    -- Oso hormiguero en Munchique
(20, 23, 'Muestras de minerales en glaciares'),                  -- Granate en Hermosas
(21, 5, 'Seguimiento de herbívoros'),                            -- Danta en Paramillo
(22, 11, 'Reforestación de páramo'),                             -- Açaí en Pisba (adaptado)
(23, 10, 'Monitoreo con cámaras en altura'),                     -- Oso de anteojos en Tamá
(24, 21, 'Censo de madera en selva'),                            -- Cedro en La Paya
(25, 8, 'Registro de aves en cuevas'),                           -- Tucán andino en Guácharos
(26, 13, 'Análisis mineral en oasis'),                           -- Feldespato en Macuira
(27, 27, 'Estudio de frutos en manglares'),                      -- Chontaduro en Salamanca
(28, 6, 'Control de minerales en sabanas'),                      -- Pirita en Tuparro
(29, 15, 'Monitoreo de calidad hídrica'),                        -- Caimán en Puré
(30, 31, 'Catálogo de árboles florales'),                        -- Roble en Yariguíes
(31, 24, 'Censo de árboles en nublados'),                        -- Guaba en Tatamá
(32, 35, 'Seguimiento de monos en selva'),                       -- Mono ardilla en Baudó
(33, 28, 'Estudio de mamíferos fronterizos'),                    -- Armadillo en Katíos
(34, 34, 'Catálogo de flora endémica'),                          -- Cachicamo en Orquídeas
(35, 16, 'Análisis de mica en suelos'),                          -- Mica en Gallineral
(36, 32, 'Monitoreo de roedores'),                               -- Agutí en Fragua
(37, 26, 'Muestras de turmalina en glaciares'),                  -- Turmalina en Cocuy Norte
(38, 37, 'Estudio de palmas en estuarios'),                      -- Milpesos en Sanquianga
(39, 40, 'Conteo de nidos en cordillera'),                       -- Tucán pico blanco en Picachos
(40, 42, 'Seguimiento de roedores en selva'),                    -- Agutí en Churumbelos
(41, 44, 'Estudio de árboles medicinales'),                      -- Andiroba en Tamá Norte
(42, 29, 'Análisis de obsidiana en cascadas'),                   -- Obsidiana en Chorrera
(43, 33, 'Muestras de amatista en agua'),                        -- Amatista en Chingaza
(44, 45, 'Seguimiento de primates'),                             -- Mono araña en Mono
(45, 36, 'Análisis de malaquita en rupestres'),                  -- Malaquita en Lindosa
(46, 38, 'Conteo de armadillos costeros'),                       -- Armadillo gigante en Flamencos
(47, 39, 'Muestras de fluorita en costas'),                      -- Fluorita en Portete
(48, 47, 'Estudio de resina en marina'),                         -- Copaiba en Gorgonilla
(49, 41, 'Reforestación con caucho'),                            -- Caucho en Matarredonda
(50, 50, 'Monitoreo de migración fluvial');                      -- Caimán del Orinoco en Bita

-- Tabla visitante
INSERT INTO visitante (cedula, nombre, apellido, direccion, telefono, email, profesion) VALUES
('9988776655', 'Laura', 'Vega', 'Calle 50, Bogotá', '3001234567', 'laura@gmail.com', 'Bióloga'),
('8877665544', 'Juan', 'Mendoza', 'Av. 22, Medellín', '3102345678', 'juan@hotmail.com', 'Estudiante'),
('7766554433', 'Carmen', 'Ríos', 'Carrera 18, Cali', '3203456789', 'carmen@yahoo.com', 'Fotógrafo'),
('6655443322', 'Ricardo', 'Soto', 'Calle 9, Leticia', '3154567890', 'ricardo@outlook.com', 'Guía Turístico'),
('5544332211', 'Fernanda', 'Guzmán', 'Av. 3, Santa Marta', '3005678901', 'fernanda@gmail.com', 'Ingeniera'),
('4433221100', 'Héctor', 'Miranda', 'Carrera 5, Villavicencio', '3106789012', 'hector@hotmail.com', 'Docente'),
('3322110099', 'Isabel', 'Cortés', 'Calle 12, San José', '3207890123', 'isabel@yahoo.com', 'Arquitecta'),
('2211009988', 'Gabriel', 'Paredes', 'Av. 45, Pereira', '3158901234', 'gabriel@gmail.com', 'Médico'),
('1100998877', 'Valeria', 'Navarro', 'Carrera 30, Manizales', '3009012345', 'valeria@outlook.com', 'Abogada'),
('0099887766', 'Óscar', 'Fuentes', 'Calle 7, Pasto', '3100123456', 'oscar@hotmail.com', 'Periodista'),
('9876543210', 'Sofía', 'López', 'Calle 15, Bogotá', '3201234567', 'sofia@gmail.com', 'Diseñadora'),
('8765432109', 'Andrés', 'Gómez', 'Av. 10, Medellín', '3152345678', 'andres@yahoo.com', 'Contador'),
('7654321098', 'Paula', 'Rojas', 'Carrera 25, Cali', '3003456789', 'paula@outlook.com', 'Bióloga'),
('6543210987', 'Diego', 'Cruz', 'Calle 20, Cartagena', '3104567890', 'diego@gmail.com', 'Fotógrafo'),
('5432109876', 'Camila', 'Pérez', 'Av. 5, Barranquilla', '3205678901', 'camila@hotmail.com', 'Estudiante'),
('4321098765', 'Luis', 'Hernández', 'Calle 8, Bucaramanga', '3156789012', 'luis@yahoo.com', 'Ingeniero'),
('3210987654', 'Natalia', 'Díaz', 'Carrera 12, Bogotá', '3007890123', 'natalia@outlook.com', 'Médica'),
('2109876543', 'Santiago', 'Ortiz', 'Av. 30, Medellín', '3108901234', 'santiago@gmail.com', 'Guía Turístico'),
('1098765432', 'Elena', 'Vargas', 'Calle 3, Cali', '3209012345', 'elena@hotmail.com', 'Arquitecta'),
('0987654321', 'Javier', 'Castro', 'Carrera 7, Santa Marta', '3150123456', 'javier@yahoo.com', 'Periodista'),
('9876543201', 'Mónica', 'Gil', 'Av. 15, Bogotá', '3001235678', 'monica@outlook.com', 'Docente'),
('8765432012', 'Pablo', 'Reyes', 'Calle 25, Medellín', '3102346789', 'pablo@gmail.com', 'Estudiante'),
('7654320123', 'Adriana', 'Luna', 'Carrera 10, Cali', '3203457890', 'adriana@hotmail.com', 'Fotógrafa'),
('6543201234', 'Sebastián', 'Mejía', 'Av. 8, Leticia', '3154568901', 'sebastian@yahoo.com', 'Biólogo'),
('5432012345', 'Claudia', 'Salazar', 'Calle 18, Santa Marta', '3005679012', 'claudia@outlook.com', 'Ingeniera'),
('4320123456', 'Tomás', 'Cano', 'Carrera 20, Villavicencio', '3106780123', 'tomas@gmail.com', 'Abogado'),
('3210234567', 'Sara', 'Moreno', 'Av. 40, Pereira', '3207891234', 'sara@hotmail.com', 'Diseñadora'),
('2102345678', 'Daniel', 'Santos', 'Calle 6, Manizales', '3158902345', 'daniel@yahoo.com', 'Médico'),
('1023456789', 'Lorena', 'Flores', 'Carrera 15, Pasto', '3009013456', 'lorena@outlook.com', 'Guía Turística'),
('9876543120', 'Alejandra', 'Ruiz', 'Av. 12, Bogotá', '3100124567', 'alejandra@gmail.com', 'Periodista'),
('8765431209', 'Mateo', 'Herrera', 'Calle 30, Medellín', '3201235678', 'mateo@hotmail.com', 'Contador'),
('7654312098', 'Valentina', 'León', 'Carrera 22, Cali', '3152346789', 'valentina@yahoo.com', 'Bióloga'),
('6543120987', 'Felipe', 'Céspedes', 'Av. 4, Cartagena', '3003457890', 'felipe@outlook.com', 'Estudiante'),
('5431209876', 'Carolina', 'Mora', 'Calle 14, Barranquilla', '3104568901', 'carolina@gmail.com', 'Fotógrafa'),
('4321098760', 'Jorge', 'Vega', 'Carrera 9, Bucaramanga', '3205679012', 'jorge@hotmail.com', 'Ingeniero'),
('3210987609', 'Ana', 'Guzmán', 'Av. 35, Bogotá', '3156780123', 'ana@yahoo.com', 'Abogada'),
('2109876098', 'Leonardo', 'Ríos', 'Calle 11, Medellín', '3007891234', 'leonardo@outlook.com', 'Docente'),
('1098760987', 'María', 'Soto', 'Carrera 28, Cali', '3108902345', 'maria.g@gmail.com', 'Diseñadora'),
('0987609876', 'Pedro', 'Cortés', 'Av. 6, Leticia', '3209013456', 'pedro@gmail.com', 'Médico'),
('9876098765', 'Lucía', 'Paredes', 'Calle 17, Santa Marta', '3150124567', 'lucia@hotmail.com', 'Guía Turística'),
('8760987654', 'Simón', 'Navarro', 'Carrera 13, Villavicencio', '3001236789', 'simon@yahoo.com', 'Periodista'),
('7650987643', 'Diana', 'Fuentes', 'Av. 50, Pereira', '3102347890', 'diana@outlook.com', 'Bióloga'),
('6549876543', 'Miguel', 'López', 'Calle 5, Manizales', '3203458901', 'miguel@gmail.com', 'Estudiante'),
('5438765432', 'Juliana', 'Gómez', 'Carrera 19, Pasto', '3154569012', 'juliana@hotmail.com', 'Fotógrafa'),
('4327654321', 'Rafael', 'Rojas', 'Av. 7, Bogotá', '3005670123', 'rafael@yahoo.com', 'Ingeniero'),
('3216543210', 'Clara', 'Cruz', 'Calle 23, Medellín', '3106781234', 'clara@outlook.com', 'Abogada'),
('2105432109', 'Esteban', 'Pérez', 'Carrera 16, Cali', '3207892345', 'esteban@gmail.com', 'Docente'),
('1094321098', 'Patricia', 'Hernández', 'Av. 9, Cartagena', '3158903456', 'patricia@hotmail.com', 'Diseñadora'),
('0983210987', 'Carlos', 'Díaz', 'Calle 21, Barranquilla', '3009014567', 'carlos.d@yahoo.com', 'Médico'),
('9872109876', 'Beatriz', 'Ortiz', 'Carrera 24, Bucaramanga', '3100125678', 'beatriz@outlook.com', 'Guía Turística');

-- Tabla categoria_alojamiento
INSERT INTO categoria_alojamiento (nombre, descripcion) VALUES
('Ecolodge', 'Alojamiento sostenible en la naturaleza'),
('Camping', 'Zona para carpas con servicios básicos'),
('Hostal', 'Habitaciones compartidas económicas'),
('Cabaña Premium', 'Lujo en medio del bosque'),
('Refugio de Montaña', 'Albergue rústico para excursionistas'),
('Glamping', 'Camping con comodidades hoteleras'),
('Hotel 3 Estrellas', 'Confort moderado en áreas cercanas'),
('Posada Familiar', 'Ambiente hogareño y comida local'),
('Albergue Juvenil', 'Para mochileros y grupos'),
('Suite VIP', 'Experiencia exclusiva con guía privado'),
('Cabaña Básica', 'Estructura sencilla sin lujos'),
('Hamaca', 'Redes al aire libre con protección'),
('Bungalow', 'Casa pequeña con terraza privada'),
('Cabaña Flotante', 'Alojamiento sobre ríos o lagunas'),
('Carpa Fija', 'Tienda instalada con base sólida'),
('Cabaña Arbórea', 'Construcción en árboles'),
('Hotel 4 Estrellas', 'Mayor confort y servicios'),
('Posada Rural', 'Estilo campestre tradicional'),
('Refugio Costero', 'Alojamiento cerca del mar'),
('Glamping Costero', 'Lujo en playas o acantilados'),
('Cabaña en Cueva', 'Espacio en formaciones rocosas'),
('Campamento Familiar', 'Zona de carpas para grupos'),
('Hostal Ecológico', 'Habitaciones compartidas sostenibles'),
('Cabaña de Madera', 'Diseño rústico con troncos'),
('Suite en Bosque', 'Exclusividad entre vegetación'),
('Cabaña en Playa', 'Alojamiento frente al océano'),
('Refugio en Páramo', 'Adaptado a climas fríos'),
('Glamping en Selva', 'Lujo en zonas tropicales'),
('Hotel Boutique', 'Diseño único y personalizado'),
('Posada Indígena', 'Réplica de vivienda nativa'),
('Albergue en Altura', 'Para escaladores y montañistas'),
('Cabaña en Islote', 'Alojamiento en pequeñas islas'),
('Campamento de Lujo', 'Carpas premium con servicios'),
('Hostal en Ciudad', 'Cerca de accesos al parque'),
('Cabaña en Río', 'Ubicada junto a corrientes'),
('Suite Marina', 'Exclusividad en zonas costeras'),
('Refugio en Desierto', 'Alojamiento en áreas áridas'),
('Glamping en Páramo', 'Lujo en ecosistemas altos'),
('Hotel 5 Estrellas', 'Máximo confort y servicios'),
('Posada en Manglar', 'Ambiente costero ecológico'),
('Albergue Costero', 'Espacio sencillo en playas'),
('Cabaña en Volcán', 'Cerca de zonas volcánicas'),
('Suite en Cueva', 'Lujo en cavidades naturales'),
('Campamento en Sabana', 'Carpas en áreas abiertas'),
('Hostal Rural', 'Habitaciones en zonas campestres'),
('Cabaña en Laguna', 'Vista a cuerpos de agua'),
('Refugio en Glaciar', 'Adaptado a zonas heladas'),
('Glamping en Isla', 'Lujo en entornos insulares'),
('Hotel en Selva', 'Confort en áreas tropicales'),
('Posada en Llano', 'Estilo de sabanas y llanuras');

-- Tabla alojamiento
INSERT INTO alojamiento (id_parque, nombre, id_categoria, capacidad, precio_noche, descripcion) VALUES
(2, 'Ecohabs Tayrona', 1, 20, 250000.00, 'Cabañas frente al mar'),
(1, 'Campamento Selva', 2, 50, 50000.00, 'Zona con baños compartidos'),
(3, 'Refugio del Ruiz', 5, 15, 120000.00, 'Calefacción y comedor'),
(5, 'Glamping Cristales', 6, 10, 400000.00, 'Tiendas de lujo con jacuzzi'),
(8, 'Posada Utría', 8, 12, 180000.00, 'Comida típica del Pacífico'),
(4, 'Hostal Amazonas', 3, 30, 80000.00, 'Habitaciones con ventiladores'),
(7, 'Hotel El Cocuy', 7, 25, 150000.00, 'Vistas al nevado'),
(9, 'Cabañas Puracé', 4, 8, 300000.00, 'Chimenea y terraza privada'),
(10, 'Albergue Iguaque', 9, 40, 60000.00, 'Actividades grupales incluidas'),
(6, 'Suite Gorgona', 10, 4, 600000.00, 'Acceso exclusivo a playa'),
(11, 'Cabaña Tinigua', 11, 6, 90000.00, 'Estructura sencilla en selva'),
(12, 'Hamacas Catatumbo', 12, 15, 30000.00, 'Redes bajo techo al aire libre'),
(13, 'Bungalow Farallones', 13, 8, 110000.00, 'Terraza con vista a montañas'),
(14, 'Cabaña Flotante Sumapaz', 14, 4, 200000.00, 'Sobre laguna de páramo'),
(15, 'Carpa Cahuinarí', 15, 10, 45000.00, 'Base fija en la selva'),
(16, 'Cabaña Arbórea Malpelo', 16, 3, 150000.00, 'Elevada en árboles costeros'),
(17, 'Hotel Rosario', 17, 20, 180000.00, 'Confort con piscina'),
(18, 'Posada Providence', 18, 12, 100000.00, 'Estilo rural caribeño'),
(19, 'Refugio Munchique', 19, 8, 70000.00, 'Sencillo cerca del mar'),
(20, 'Glamping Hermosas', 20, 6, 350000.00, 'Lujo con vistas glaciares'),
(21, 'Cabaña Paramillo Playa', 21, 5, 130000.00, 'Integrada en cueva costera'),
(22, 'Campamento Pisba', 22, 25, 60000.00, 'Zona para familias en páramo'),
(23, 'Hostal Tamá', 23, 15, 75000.00, 'Ecológico con energía solar'),
(24, 'Cabaña La Paya', 24, 6, 95000.00, 'Rústica de madera en selva'),
(25, 'Suite Guácharos', 25, 4, 500000.00, 'Exclusiva cerca de cuevas'),
(26, 'Cabaña Macuira Playa', 26, 5, 120000.00, 'Frente a playas desérticas'),
(27, 'Refugio Salamanca', 27, 10, 80000.00, 'Adaptado a clima frío'),
(28, 'Glamping Tuparro', 28, 8, 380000.00, 'Lujo en sabanas abiertas'),
(29, 'Hotel Puré', 29, 12, 160000.00, 'Diseño boutique en selva'),
(30, 'Posada Yariguíes', 30, 10, 90000.00, 'Estilo indígena local'),
(31, 'Albergue Tatamá', 31, 20, 65000.00, 'Para montañistas en nublados'),
(32, 'Cabaña Baudó Islote', 32, 4, 140000.00, 'En pequeña isla fluvial'),
(33, 'Campamento Katíos', 33, 30, 55000.00, 'Carpas premium con duchas'),
(34, 'Hostal Orquídeas', 34, 18, 70000.00, 'Cerca de accesos al parque'),
(35, 'Cabaña Gallineral Río', 35, 6, 110000.00, 'Junto a corriente natural'),
(36, 'Suite Fragua', 36, 3, 550000.00, 'Exclusiva en zona marina'),
(37, 'Refugio Cocuy', 37, 8, 85000.00, 'Sencillo en desierto montañoso'),
(38, 'Glamping Sanquianga', 38, 6, 360000.00, 'Lujo en ecosistema alto'),
(39, 'Hotel Picachos', 39, 25, 200000.00, 'Confort máximo en cordillera'),
(40, 'Posada Churumbelos', 40, 12, 95000.00, 'En manglares del Pacífico'),
(41, 'Albergue Tamá Norte', 41, 15, 60000.00, 'Sencillo en costa alta'),
(42, 'Cabaña Chorrera Volcán', 42, 5, 130000.00, 'Cerca de cráter activo'),
(43, 'Suite Chingaza', 43, 4, 600000.00, 'Lujo en cueva de páramo'),
(44, 'Campamento Mono', 44, 20, 50000.00, 'Carpas en sabanas abiertas'),
(45, 'Hostal Lindosa', 45, 10, 80000.00, 'Rural cerca de pinturas'),
(46, 'Cabaña Flamencos Laguna', 46, 6, 100000.00, 'Vista a laguna costera'),
(47, 'Refugio Portete', 47, 8, 70000.00, 'Sencillo en glaciar desierto'),
(48, 'Glamping Gorgonilla', 48, 6, 370000.00, 'Lujo en isla marina'),
(49, 'Hotel Matarredonda', 49, 15, 190000.00, 'Confort en selva alta'),
(50, 'Posada Bita', 50, 12, 90000.00, 'Estilo llanero tradicional');

-- Tabla reserva
INSERT INTO reserva (id_visitante, id_alojamiento, fecha_inicio, fecha_fin, numero_personas, precio_total, estado) VALUES
(1, 1, '2023-11-01', '2023-11-05', 2, 1000000.00, 'Confirmada'), -- 4 noches x 250K
(2, 2, '2023-12-10', '2023-12-15', 4, 250000.00, 'Pendiente'),   -- 5 noches x 50K
(3, 3, '2024-01-20', '2024-01-25', 1, 600000.00, 'Confirmada'),   -- 5 noches x 120K
(4, 4, '2023-10-15', '2023-10-20', 2, 2000000.00, 'Completada'),  -- 5 noches x 400K
(5, 5, '2023-09-05', '2023-09-10', 3, 540000.00, 'Cancelada'),    -- 5 noches x 180K
(6, 6, '2024-02-14', '2024-02-18', 2, 320000.00, 'Confirmada'),   -- 4 noches x 80K
(7, 7, '2023-11-30', '2023-12-05', 2, 750000.00, 'Pendiente'),    -- 5 noches x 150K
(8, 8, '2024-03-22', '2024-03-27', 1, 1500000.00, 'Confirmada'),  -- 5 noches x 300K
(9, 9, '2023-12-25', '2023-12-30', 5, 300000.00, 'Completada'),   -- 5 noches x 60K
(10, 10, '2024-04-10', '2024-04-15', 2, 3000000.00, 'Pendiente'), -- 5 noches x 600K
(11, 11, '2024-05-01', '2024-05-04', 3, 270000.00, 'Confirmada'), -- 3 noches x 90K
(12, 12, '2023-11-15', '2023-11-18', 4, 90000.00, 'Completada'),  -- 3 noches x 30K
(13, 13, '2024-06-10', '2024-06-15', 2, 550000.00, 'Pendiente'),  -- 5 noches x 110K
(14, 14, '2023-12-01', '2023-12-05', 1, 800000.00, 'Confirmada'), -- 4 noches x 200K
(15, 15, '2024-07-20', '2024-07-25', 5, 225000.00, 'Cancelada'),  -- 5 noches x 45K
(16, 16, '2023-10-10', '2023-10-13', 2, 450000.00, 'Completada'), -- 3 noches x 150K
(17, 17, '2024-08-15', '2024-08-20', 3, 900000.00, 'Confirmada'), -- 5 noches x 180K
(18, 18, '2023-09-20', '2023-09-23', 4, 300000.00, 'Pendiente'),  -- 3 noches x 100K
(19, 19, '2024-02-01', '2024-02-05', 2, 280000.00, 'Completada'), -- 4 noches x 70K
(20, 20, '2023-11-10', '2023-11-15', 1, 1750000.00, 'Confirmada'),-- 5 noches x 350K
(21, 21, '2024-03-05', '2024-03-08', 3, 390000.00, 'Pendiente'),  -- 3 noches x 130K
(22, 22, '2023-12-20', '2023-12-25', 5, 300000.00, 'Completada'), -- 5 noches x 60K
(23, 23, '2024-04-15', '2024-04-20', 2, 375000.00, 'Confirmada'), -- 5 noches x 75K
(24, 24, '2023-10-25', '2023-10-28', 4, 285000.00, 'Cancelada'),  -- 3 noches x 95K
(25, 25, '2024-05-10', '2024-05-15', 1, 2500000.00, 'Pendiente'), -- 5 noches x 500K
(26, 26, '2023-11-25', '2023-11-30', 3, 360000.00, 'Confirmada'), -- 5 noches x 120K
(27, 27, '2024-06-01', '2024-06-04', 2, 240000.00, 'Completada'), -- 3 noches x 80K
(28, 28, '2023-12-15', '2023-12-20', 4, 1900000.00, 'Confirmada'),-- 5 noches x 380K
(29, 29, '2024-07-10', '2024-07-15', 5, 800000.00, 'Pendiente'),  -- 5 noches x 160K
(30, 30, '2023-09-15', '2023-09-18', 2, 270000.00, 'Completada'), -- 3 noches x 90K
(31, 31, '2024-08-01', '2024-08-05', 3, 260000.00, 'Confirmada'), -- 4 noches x 65K
(32, 32, '2023-10-05', '2023-10-08', 1, 420000.00, 'Cancelada'),  -- 3 noches x 140K
(33, 33, '2024-02-20', '2024-02-25', 4, 275000.00, 'Pendiente'),  -- 5 noches x 55K
(34, 34, '2023-11-05', '2023-11-10', 2, 350000.00, 'Completada'), -- 5 noches x 70K
(35, 35, '2024-03-15', '2024-03-20', 3, 330000.00, 'Confirmada'), -- 5 noches x 110K
(36, 36, '2023-12-25', '2023-12-28', 1, 1650000.00, 'Pendiente'), -- 3 noches x 550K
(37, 37, '2024-04-01', '2024-04-05', 2, 340000.00, 'Completada'), -- 4 noches x 85K
(38, 38, '2023-09-25', '2023-09-30', 4, 1800000.00, 'Confirmada'),-- 5 noches x 360K
(39, 39, '2024-05-15', '2024-05-20', 5, 1000000.00, 'Cancelada'), -- 5 noches x 200K
(40, 40, '2023-10-15', '2023-10-18', 2, 285000.00, 'Pendiente'),  -- 3 noches x 95K
(41, 41, '2024-06-20', '2024-06-25', 3, 180000.00, 'Completada'), -- 5 noches x 60K
(42, 42, '2023-11-15', '2023-11-20', 1, 650000.00, 'Confirmada'), -- 5 noches x 130K
(43, 43, '2024-07-01', '2024-07-04', 2, 1800000.00, 'Pendiente'), -- 3 noches x 600K
(44, 44, '2023-12-05', '2023-12-10', 4, 250000.00, 'Completada'), -- 5 noches x 50K
(45, 45, '2024-08-10', '2024-08-15', 5, 400000.00, 'Confirmada'), -- 5 noches x 80K
(46, 46, '2023-09-10', '2023-09-13', 2, 300000.00, 'Cancelada'),  -- 3 noches x 100K
(47, 47, '2024-02-15', '2024-02-20', 3, 350000.00, 'Pendiente'),  -- 5 noches x 70K
(48, 48, '2023-11-20', '2023-11-25', 1, 1850000.00, 'Completada'),-- 5 noches x 370K
(49, 49, '2024-03-25', '2024-03-30', 4, 950000.00, 'Confirmada'), -- 5 noches x 190K
(50, 50, '2023-10-20', '2023-10-23', 2, 270000.00, 'Pendiente');  -- 3 noches x 90K

-- Tabla visita
INSERT INTO visita (id_visitante, id_parque, id_entrada, fecha_entrada, fecha_salida, id_personal_registro, observaciones) VALUES
(1, 2, 2, '2023-11-01 08:30:00', '2023-11-01 17:00:00', 1, 'Visita guiada incluida'),
(2, 1, 1, '2023-12-10 09:15:00', NULL, 5, 'Permiso de acampado'),
(3, 3, 3, '2024-01-20 10:00:00', '2024-01-20 16:45:00', 9, 'Trajo equipo de montaña'),
(4, 5, 5, '2023-10-15 07:45:00', '2023-10-15 18:30:00', 4, 'Fotografía profesional'),
(5, 8, 8, '2023-09-05 11:20:00', '2023-09-05 15:00:00', 3, 'Cancelación por clima'),
(6, 6, 6, '2024-02-14 08:00:00', NULL, 7, 'Grupo estudiantil'),
(7, 7, 7, '2023-11-30 13:00:00', '2023-11-30 19:00:00', 8, 'Tour nocturno'),
(8, 9, 9, '2024-03-22 06:30:00', '2024-03-22 14:00:00', 2, 'Ascenso al volcán'),
(9, 10, 10, '2023-12-25 09:45:00', '2023-12-25 12:30:00', 6, 'Ceremonia ancestral'),
(10, 4, 4, '2024-04-10 10:10:00', NULL, 10, 'Investigación autorizada'),
(11, 11, 11, '2024-05-01 08:45:00', '2024-05-01 16:00:00', 13, 'Exploración de selva'),
(12, 12, 12, '2023-11-15 09:30:00', NULL, 17, 'Observación de relámpagos'),
(13, 13, 13, '2024-06-10 07:00:00', '2024-06-10 15:30:00', 21, 'Senderismo guiado'),
(14, 14, 14, '2023-12-01 10:15:00', '2023-12-01 17:45:00', 25, 'Fotografía de páramo'),
(15, 15, 15, '2024-07-20 08:00:00', NULL, 29, 'Estudio de peces'),
(16, 16, 16, '2023-10-10 11:00:00', '2023-10-10 14:30:00', 33, 'Buceo autorizado'),
(17, 17, 17, '2024-08-15 09:00:00', '2024-08-15 16:00:00', 37, 'Visita a corales'),
(18, 18, 18, '2023-09-20 07:30:00', NULL, 41, 'Snorkel en arrecifes'),
(19, 19, 19, '2024-02-01 08:15:00', '2024-02-01 13:00:00', 45, 'Avistamiento de aves'),
(20, 20, 20, '2023-11-10 10:30:00', '2023-11-10 18:00:00', 1, 'Trekking en glaciares'),
(21, 21, 21, '2024-03-05 09:45:00', NULL, 5, 'Exploración costera'),
(22, 22, 22, '2023-12-20 08:00:00', '2023-12-20 15:00:00', 9, 'Senderismo en páramo'),
(23, 23, 23, '2024-04-15 07:15:00', '2024-04-15 14:30:00', 13, 'Observación de osos'),
(24, 24, 24, '2023-10-25 10:00:00', NULL, 17, 'Fotografía de selva'),
(25, 25, 25, '2024-05-10 09:00:00', '2024-05-10 17:00:00', 21, 'Visita a cuevas'),
(26, 26, 26, '2023-11-25 08:30:00', '2023-11-25 16:00:00', 25, 'Exploración desértica'),
(27, 27, 27, '2024-06-01 07:45:00', NULL, 29, 'Estudio de manglares'),
(28, 28, 28, '2023-12-15 10:15:00', '2023-12-15 18:30:00', 33, 'Safari en sabanas'),
(29, 29, 29, '2024-07-10 09:30:00', '2024-07-10 15:00:00', 37, 'Monitoreo de ríos'),
(30, 30, 30, '2023-09-15 08:00:00', NULL, 41, 'Censo de árboles'),
(31, 31, 31, '2024-08-01 07:00:00', '2024-08-01 14:00:00', 45, 'Senderismo nublado'),
(32, 32, 32, '2023-10-05 10:45:00', '2023-10-05 17:00:00', 1, 'Visita a islotes'),
(33, 33, 33, '2024-02-20 09:15:00', NULL, 5, 'Exploración fronteriza'),
(34, 34, 34, '2023-11-05 08:30:00', '2023-11-05 16:00:00', 9, 'Fotografía de orquídeas'),
(35, 35, 35, '2024-03-15 07:45:00', '2024-03-15 15:30:00', 13, 'Paseo por el río'),
(36, 36, 36, '2023-12-25 10:00:00', NULL, 17, 'Estudio marino'),
(37, 37, 37, '2024-04-01 09:00:00', '2024-04-01 17:00:00', 21, 'Ascenso glacial'),
(38, 38, 38, '2023-09-25 08:15:00', '2023-09-25 14:00:00', 25, 'Visita a estuarios'),
(39, 39, 39, '2024-05-15 07:30:00', NULL, 29, 'Observación de aves'),
(40, 40, 40, '2023-10-15 10:30:00', '2023-10-15 18:00:00', 33, 'Exploración de selva'),
(41, 41, 41, '2024-06-20 09:45:00', '2024-06-20 16:00:00', 37, 'Senderismo montañoso'),
(42, 42, 42, '2023-11-15 08:00:00', NULL, 41, 'Fotografía de cascadas'),
(43, 43, 43, '2024-07-01 07:15:00', '2024-07-01 15:00:00', 45, 'Monitoreo de agua'),
(44, 44, 44, '2023-12-05 10:00:00', '2023-12-05 17:30:00', 1, 'Visita a humedales'),
(45, 45, 45, '2024-08-10 09:30:00', NULL, 5, 'Estudio rupestre'),
(46, 46, 46, '2023-09-10 08:45:00', '2023-09-10 16:00:00', 9, 'Avistamiento costero'),
(47, 47, 47, '2024-02-15 07:00:00', '2024-02-15 14:30:00', 13, 'Exploración de costas'),
(48, 48, 48, '2023-11-20 10:15:00', NULL, 17, 'Buceo en isla'),
(49, 49, 49, '2024-03-25 09:00:00', '2024-03-25 17:00:00', 21, 'Senderismo en páramo'),
(50, 50, 50, '2023-10-20 08:30:00', '2023-10-20 15:00:00', 25, 'Pesca autorizada');

-- Tabla actividad
INSERT INTO actividad (id_parque, nombre, descripcion, duracion_minutos, capacidad_maxima, precio) VALUES
(2, 'Snorkel en Playa', 'Exploración de arrecifes', 120, 15, 50000.00),
(1, 'Caminata Nocturna', 'Avistamiento de fauna', 180, 10, 30000.00),
(3, 'Ascenso al Nevado', 'Ruta guiada al Ruiz', 360, 8, 150000.00),
(5, 'Paseo en Canoa', 'Recorrido por Caño Cristales', 90, 12, 80000.00),
(8, 'Avistamiento de Ballenas', 'Temporada julio-noviembre', 240, 20, 120000.00),
(4, 'Canopy Amazonas', 'Tirolinas en la selva', 150, 10, 75000.00),
(7, 'Trekking Glaciares', 'Sendero Ritacuba Blanco', 300, 6, 200000.00),
(9, 'Termales Volcánicas', 'Relajación en aguas termales', 60, 25, 40000.00),
(10, 'Ritual Muisca', 'Ceremonia ancestral en la laguna', 90, 30, 25000.00),
(6, 'Buceo en Gorgona', 'Exploración de coral', 180, 8, 180000.00),
(11, 'Censo de Fauna', 'Registro de animales en selva', 120, 10, 35000.00),
(12, 'Observación de Relámpagos', 'Fenómeno nocturno', 150, 15, 45000.00),
(13, 'Senderismo Farallones', 'Ruta por bosques nublados', 240, 12, 60000.00),
(14, 'Fotografía de Páramo', 'Taller al aire libre', 180, 8, 70000.00),
(15, 'Pesca Tradicional', 'Actividad con guías locales', 90, 10, 30000.00),
(16, 'Snorkel Malpelo', 'Exploración marina', 120, 6, 150000.00),
(17, 'Kayak en Rosario', 'Recorrido por corales', 150, 12, 65000.00),
(18, 'Buceo Providence', 'Inmersión en arrecifes', 180, 8, 140000.00),
(19, 'Avistamiento de Aves', 'Censo con binoculares', 120, 15, 40000.00),
(20, 'Ascenso Glacial', 'Ruta técnica en Hermosas', 300, 6, 180000.00),
(21, 'Paseo Costero', 'Exploración de playas', 90, 20, 35000.00),
(22, 'Trekking Pisba', 'Sendero en páramo', 240, 10, 55000.00),
(23, 'Observación de Osos', 'Safari con guías', 180, 8, 80000.00),
(24, 'Caminata Selva', 'Exploración guiada', 150, 12, 45000.00),
(25, 'Visita a Cuevas', 'Recorrido subterráneo', 120, 10, 50000.00),
(26, 'Ruta Desértica', 'Exploración en Macuira', 180, 15, 60000.00),
(27, 'Kayak en Manglares', 'Navegación ecológica', 90, 12, 40000.00),
(28, 'Safari Tuparro', 'Recorrido por sabanas', 240, 10, 70000.00),
(29, 'Monitoreo de Ríos', 'Taller educativo', 120, 8, 35000.00),
(30, 'Censo de Árboles', 'Registro botánico', 150, 15, 30000.00),
(31, 'Senderismo Nublado', 'Ruta en Tatamá', 180, 10, 55000.00),
(32, 'Paseo en Islote', 'Exploración en Baudó', 90, 12, 45000.00),
(33, 'Fotografía Fronteriza', 'Taller en Katíos', 120, 8, 60000.00),
(34, 'Caminata Orquídeas', 'Exploración floral', 150, 10, 40000.00),
(35, 'Rafting Gallineral', 'Descenso por el río', 180, 6, 90000.00),
(36, 'Snorkel Fragua', 'Exploración acuática', 120, 12, 50000.00),
(37, 'Ascenso Cocuy Norte', 'Ruta glacial técnica', 300, 8, 170000.00),
(38, 'Kayak Sanquianga', 'Recorrido por estuarios', 150, 10, 45000.00),
(39, 'Observación de Rapaces', 'Censo en Picachos', 180, 15, 60000.00),
(40, 'Caminata Churumbelos', 'Exploración de selva', 240, 12, 55000.00),
(41, 'Trekking Tamá Norte', 'Sendero montañoso', 180, 10, 70000.00),
(42, 'Fotografía de Cascadas', 'Taller en Chorrera', 120, 8, 40000.00),
(43, 'Monitoreo de Agua', 'Análisis en Chingaza', 150, 12, 35000.00),
(44, 'Paseo en Humedales', 'Recorrido en Mono', 90, 15, 30000.00),
(45, 'Visita Rupestre', 'Exploración en Lindosa', 180, 10, 50000.00),
(46, 'Avistamiento Costero', 'Censo en Flamencos', 120, 20, 45000.00),
(47, 'Ruta Portete', 'Exploración de costas', 150, 12, 40000.00),
(48, 'Buceo Gorgonilla', 'Inmersión en isla', 180, 8, 160000.00),
(49, 'Senderismo Matarredonda', 'Ruta en páramo', 240, 10, 60000.00),
(50, 'Pesca en Bita', 'Actividad con guías', 120, 15, 35000.00);

-- Tabla actividad_visitante
INSERT INTO actividad_visitante (id_actividad, id_visita, fecha_hora, numero_personas, precio_pagado) VALUES
(1, 1, '2023-11-01 10:00:00', 2, 100000.00), -- Snorkel en Playa (2 x 50K)
(2, 2, '2023-12-10 20:00:00', 4, 120000.00), -- Caminata Nocturna (4 x 30K)
(3, 3, '2024-01-20 08:00:00', 1, 150000.00), -- Ascenso al Nevado (1 x 150K)
(4, 4, '2023-10-15 09:30:00', 2, 160000.00), -- Paseo en Canoa (2 x 80K)
(5, 5, '2023-09-05 13:00:00', 3, 360000.00), -- Avistamiento de Ballenas (3 x 120K)
(6, 6, '2024-02-14 10:30:00', 2, 150000.00), -- Canopy Amazonas (2 x 75K)
(7, 7, '2023-11-30 14:00:00', 2, 400000.00), -- Trekking Glaciares (2 x 200K)
(8, 8, '2024-03-22 07:00:00', 1, 40000.00),  -- Termales Volcánicas (1 x 40K)
(9, 9, '2023-12-25 10:00:00', 5, 125000.00), -- Ritual Muisca (5 x 25K)
(10, 10, '2024-04-10 11:00:00', 2, 360000.00),-- Buceo en Gorgona (2 x 180K)
(11, 11, '2024-05-01 09:00:00', 3, 105000.00),-- Censo de Fauna (3 x 35K)
(12, 12, '2023-11-15 21:00:00', 4, 180000.00),-- Observación de Relámpagos (4 x 45K)
(13, 13, '2024-06-10 08:00:00', 2, 120000.00),-- Senderismo Farallones (2 x 60K)
(14, 14, '2023-12-01 10:30:00', 1, 70000.00), -- Fotografía de Páramo (1 x 70K)
(15, 15, '2024-07-20 09:00:00', 5, 150000.00),-- Pesca Tradicional (5 x 30K)
(16, 16, '2023-10-10 11:30:00', 2, 300000.00),-- Snorkel Malpelo (2 x 150K)
(17, 17, '2024-08-15 10:00:00', 3, 195000.00),-- Kayak en Rosario (3 x 65K)
(18, 18, '2023-09-20 08:00:00', 4, 560000.00),-- Buceo Providence (4 x 140K)
(19, 19, '2024-02-01 09:00:00', 2, 80000.00), -- Avistamiento de aves (5 x 40k)
(20, 20, '2024-03-15 09:00:00', 2, 360000.00), -- Ascenso Glacial (2 x 180K)
(21, 21, '2023-11-25 10:30:00', 3, 105000.00), -- Paseo Costero (3 x 35K)
(22, 22, '2024-04-05 14:00:00', 1, 55000.00),  -- Trekking Pisba (1 x 55K)
(23, 23, '2023-12-15 08:00:00', 4, 320000.00), -- Observación de Osos (4 x 80K)
(24, 24, '2024-05-10 11:00:00', 2, 90000.00),  -- Caminata Selva (2 x 45K)
(25, 25, '2023-10-20 13:00:00', 5, 250000.00), -- Visita a Cuevas (5 x 50K)
(26, 26, '2024-06-15 09:30:00', 3, 180000.00), -- Ruta Desértica (3 x 60K)
(27, 27, '2023-09-15 15:00:00', 1, 40000.00),  -- Kayak en Manglares (1 x 40K)
(28, 28, '2024-07-01 10:00:00', 2, 140000.00), -- Safari Tuparro (2 x 70K)
(29, 29, '2023-11-10 11:30:00', 4, 140000.00), -- Monitoreo de Ríos (4 x 35K)
(30, 30, '2024-08-05 08:00:00', 3, 90000.00),  -- Censo de Árboles (3 x 30K)
(31, 31, '2023-12-20 14:00:00', 2, 110000.00), -- Senderismo Nublado (2 x 55K)
(32, 32, '2024-01-15 09:00:00', 1, 45000.00),  -- Paseo en Islote (1 x 45K)
(33, 33, '2023-10-05 10:30:00', 5, 300000.00), -- Fotografía Fronteriza (5 x 60K)
(34, 34, '2024-02-10 13:00:00', 3, 120000.00), -- Caminata Orquídeas (3 x 40K)
(35, 35, '2023-09-25 08:00:00', 2, 180000.00), -- Rafting Gallineral (2 x 90K)
(36, 36, '2024-03-20 11:00:00', 4, 200000.00), -- Snorkel Fragua (4 x 50K)
(37, 37, '2023-11-05 09:00:00', 1, 170000.00), -- Ascenso Cocuy Norte (1 x 170K)
(38, 38, '2024-04-25 14:00:00', 3, 135000.00), -- Kayak Sanquianga (3 x 45K)
(39, 39, '2023-12-30 10:00:00', 2, 120000.00), -- Observación de Rapaces (2 x 60K)
(40, 40, '2024-05-15 08:30:00', 5, 275000.00), -- Caminata Churumbelos (5 x 55K)
(41, 41, '2023-10-15 11:30:00', 1, 70000.00),  -- Trekking Tamá Norte (1 x 70K)
(42, 42, '2024-06-20 09:00:00', 4, 160000.00), -- Fotografía de Cascadas (4 x 40K)
(43, 43, '2023-11-20 13:00:00', 2, 70000.00),  -- Monitoreo de Agua (2 x 35K)
(44, 44, '2024-07-10 10:00:00', 3, 90000.00),  -- Paseo en Humedales (3 x 30K)
(45, 45, '2023-09-10 08:00:00', 1, 50000.00),  -- Visita Rupestre (1 x 50K)
(46, 46, '2024-08-25 11:00:00', 2, 90000.00),  -- Avistamiento Costero (2 x 45K)
(47, 47, '2023-12-05 14:00:00', 4, 160000.00), -- Ruta Portete (4 x 40K)
(48, 48, '2024-01-25 09:30:00', 3, 480000.00), -- Buceo Gorgonilla (3 x 160K)
(49, 49, '2023-10-25 10:00:00', 2, 120000.00), -- Senderismo Matarredonda (2 x 60K)
(50, 50, '2024-02-15 13:00:00', 5, 175000.00); -- Pesca en Bita (5 x 35K)

