CREATE DATABASE TiendaMaquillaje
GO
USE TiendaMaquillaje

--//************************ TABLAS GENERALES ************************--//
GO
CREATE SCHEMA Gral
GO

CREATE TABLE Gral.tbUsuarios(
		usu_ID				INT IDENTITY(1,1) PRIMARY KEY,
		usu_Usuario			NVARCHAR(100)		NOT NULL,
		usu_empID			INT					NOT NULL,
		usu_Clave			NVARCHAR(MAX)		NOT NULL,
		usu_EsAdmin			BIT					NOT NULL,
		usu_UsuarioCrea		INT					NOT NULL,
		usu_FechaCrea		DATETIME			DEFAULT GETDATE(),
		usu_UsuarioModi		INT,
		usu_FechaModi		DATETIME,
		usu_Estado			BIT					DEFAULT 1

		CONSTRAINT	UQ_Gral_tbUsuarios_usu_Usuario	UNIQUE (usu_Usuario)
);

INSERT INTO Gral.tbUsuarios
VALUES  ('admin', 1, '123', 1, 1, GETDATE(), NULL, NULL, 1);


CREATE TABLE Gral.tbEstadosCiviles(
		est_ID				INT IDENTITY(1,1) PRIMARY KEY,
		est_Descripcion		NVARCHAR(250)			NOT NULL,

		est_UsuarioCrea		INT						NOT NULL,
		est_FechaCrea		DATETIME				DEFAULT GETDATE(),
		est_UsuarioModi		INT,
		est_FechaModi		DATETIME

		CONSTRAINT FK_Gral_tbEstadosCiviles_est_UsuarioCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(est_UsuarioCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Gral_tbEstadosCiviles_est_UsuarioModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(est_UsuarioModi) REFERENCES Gral.tbUsuarios(usu_ID)

);

INSERT INTO Gral.tbEstadosCiviles
VALUES  ('Amante',			1, GETDATE(), null, null),
		('Casado(a)',		1, GETDATE(), null, null),
		('Comprometido(a)', 1, GETDATE(), null, null),
		('Divorciado(a)',	1, GETDATE(), null, null),
		('Soltero(a)',		1, GETDATE(), null, null),
		('Unión Libre',		1, GETDATE(), null, null),
		('Viudo(a)',		1, GETDATE(), null, null);


CREATE TABLE Gral.tbDepartamentos(
		dep_ID					INT IDENTITY(1,1) PRIMARY KEY,
		dep_Descripcion			NVARCHAR(250)			NOT NULL,

		dep_UsuarioCrea			INT						NOT NULL,
		dep_FechaCrea			DATETIME				DEFAULT GETDATE(),
		dep_UsuarioModi			INT,
		dep_FechaModi			DATETIME

		CONSTRAINT FK_Gral_tbDepartamentos_dep_UsuarioCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(dep_UsuarioCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Gral_tbDepartamentos_dep_UsuarioModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(dep_UsuarioModi) REFERENCES Gral.tbUsuarios(usu_ID)

);

INSERT INTO Gral.tbDepartamentos
VALUES	('Atlántida',		    1, GETDATE(), NULL, NULL),
		('Colón',			    1, GETDATE(), NULL, NULL),
		('Comayagua',		    1, GETDATE(), NULL, NULL),
		('Copán',			    1, GETDATE(), NULL, NULL),
		('Cortés',			    1, GETDATE(), NULL, NULL),
		('Choluteca',		    1, GETDATE(), NULL, NULL),
		('El Paraíso',		    1, GETDATE(), NULL, NULL),
		('Francisco Morazán',   1, GETDATE(), NULL, NULL),
		('Gracias a Dios',	    1, GETDATE(), NULL, NULL),
		('Intibuca',		    1, GETDATE(), NULL, NULL),
		('Islas de la Bahía',   1, GETDATE(), NULL, NULL),
		('La Paz',			    1, GETDATE(), NULL, NULL),
		('Lempira',			    1, GETDATE(), NULL, NULL),
		('Ocotepeque',		    1, GETDATE(), NULL, NULL),
		('Olancho',			    1, GETDATE(), NULL, NULL),
		('Santa Bárbara',	    1, GETDATE(), NULL, NULL),
		('Valle',			    1, GETDATE(), NULL, NULL),
		('Yoro',			    1, GETDATE(), NULL, NULL);

		








CREATE TABLE Gral.tbMunicipios(
		mun_ID				INT IDENTITY(1,1) PRIMARY KEY,
		mun_depID			INT						NOT NULL,
		mun_Descripcion		NVARCHAR(250)			NOT NULL,
		mun_UsuarioCrea		INT						NOT NULL,
		mun_FechaCrea		DATETIME				DEFAULT GETDATE(),
		mun_UsuarioModi		INT,
		mun_FechaModi		DATETIME

		CONSTRAINT FK_Gral_tbMunicipios_mun_depID_Gral_tbDepartamentos_dep_ID	FOREIGN KEY (mun_depID) REFERENCES Gral.tbDepartamentos (dep_ID),
		CONSTRAINT FK_Gral_tbMunicipios_mun_UsuarioCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(mun_UsuarioCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Gral_tbMunicipios_mun_UsuarioModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(mun_UsuarioModi) REFERENCES Gral.tbUsuarios(usu_ID)
);

INSERT INTO Gral.tbMunicipios
VALUES   ( 1, 'La Ceiba',				   1, GETDATE(), NULL, NULL),
		 ( 1, 'Tela',					   1, GETDATE(), NULL, NULL),
	     ( 1, 'La Masica',				   1, GETDATE(), NULL, NULL),
		 ( 1, 'Arizona',				   1, GETDATE(), NULL, NULL),
		 ( 1, 'Jutiapa',				   1, GETDATE(), NULL, NULL),
		 ( 1, 'El Porvenir',			   1, GETDATE(), NULL, NULL),
		 ( 1, 'Esparta',				   1, GETDATE(), NULL, NULL),
	     ( 1, 'San Francisco',			   1, GETDATE(), NULL, NULL),
		 ( 2, 'Trujillo',				   1, GETDATE(), NULL, NULL),
		 ( 2, 'Balfate',				   1, GETDATE(), NULL, NULL),
		 ( 2, 'Iriona',					   1, GETDATE(), NULL, NULL),
		 ( 2, 'Limón',					   1, GETDATE(), NULL, NULL),
		 ( 2, 'Sabá',					   1, GETDATE(), NULL, NULL),
		 ( 2, 'Santa Fé',				   1, GETDATE(), NULL, NULL),
		 ( 2, 'Santa Rosa de Aguán',	   1, GETDATE(), NULL, NULL),
		 ( 2, 'Sonaguera',				   1, GETDATE(), NULL, NULL),
		 ( 2, 'Tocoa',					   1, GETDATE(), NULL, NULL),
		 ( 2, 'Bonito Oriental',		   1, GETDATE(), NULL, NULL),
		 ( 3, 'Comayagua',				   1, GETDATE(), NULL, NULL),
		 ( 3, 'Ajuterique',				   1, GETDATE(), NULL, NULL),
		 ( 3, 'El Rosario',				   1, GETDATE(), NULL, NULL),
		 ( 3, 'Esquías',				   1, GETDATE(), NULL, NULL),
		 ( 3, 'Humuya',					   1, GETDATE(), NULL, NULL),
		 ( 3, 'La Libertad',			   1, GETDATE(), NULL, NULL),
		 ( 3, 'Lamaní',					   1, GETDATE(), NULL, NULL),
		 ( 3, 'La Trinidad',			   1, GETDATE(), NULL, NULL),
		 ( 3, 'Lejamaní',				   1, GETDATE(), NULL, NULL),
		 ( 3, 'Meambár',				   1, GETDATE(), NULL, NULL),
		 ( 3, 'Minas de Oro',			   1, GETDATE(), NULL, NULL),
		 ( 3, 'Ojos de Agua',			   1, GETDATE(), NULL, NULL),
		 ( 3, 'San Jerónimo',			   1, GETDATE(), NULL, NULL),
		 ( 3, 'San José de Comayagua',	   1, GETDATE(), NULL, NULL),
		 ( 3, 'San José del Potrero',	   1, GETDATE(), NULL, NULL),
		 ( 3, 'San Luis',				   1, GETDATE(), NULL, NULL),
		 ( 3, 'San Sebastián',			   1, GETDATE(), NULL, NULL),
		 ( 3, 'Siguatepeque',			   1, GETDATE(), NULL, NULL),
		 ( 3, 'Villas de San Antonio',	   1, GETDATE(), NULL, NULL),
		 ( 3, 'Las Lajas',				   1, GETDATE(), NULL, NULL),
		 ( 3, 'Taulabé',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'Santa Rosa de Copán',	   1, GETDATE(), NULL, NULL),
		 ( 4, 'Cabañas',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'Concepción',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'Copán Ruinas',			   1, GETDATE(), NULL, NULL),
		 ( 4, 'Corquín',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'Cucuyagua',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'Dolores',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'Dulce Nombre',			   1, GETDATE(), NULL, NULL),
		 ( 4, 'El Paraíso',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'Florida',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'Lajigua',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'La Unión',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'Nueva Arcadia',			   1, GETDATE(), NULL, NULL),
		 ( 4, 'San Agustín',			   1, GETDATE(), NULL, NULL),
		 ( 4, 'San Antonio',			   1, GETDATE(), NULL, NULL),
		 ( 4, 'San Jerónimo',			   1, GETDATE(), NULL, NULL),
		 ( 4, 'San José',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'San Juan de Ocoa',		   1, GETDATE(), NULL, NULL),
		 ( 4, 'San Nicolás',			   1, GETDATE(), NULL, NULL),
		 ( 4, 'San Pedro',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'Santa Rita',				   1, GETDATE(), NULL, NULL),
		 ( 4, 'Trinidad de Copán',		   1, GETDATE(), NULL, NULL),
		 ( 4, 'Veracrúz',				   1, GETDATE(), NULL, NULL),
		 ( 5, 'San Pedro Sula',			   1, GETDATE(), NULL, NULL),
		 ( 5, 'Choloma',				   1, GETDATE(), NULL, NULL),
		 ( 5, 'Omoa',					   1, GETDATE(), NULL, NULL),
		 ( 5, 'Pimienta',				   1, GETDATE(), NULL, NULL),
		 ( 5, 'Potrerillos',			   1, GETDATE(), NULL, NULL),
		 ( 5, 'Puerto Cortés',			   1, GETDATE(), NULL, NULL),
		 ( 5, 'San Antonio de Cortés',	   1, GETDATE(), NULL, NULL),
	     ( 5, 'San Francisco de Yojoa',    1, GETDATE(), NULL, NULL),
		 ( 5, 'San Manuel',				   1, GETDATE(), NULL, NULL),
		 ( 5, 'Santa Cruz de Yoja',		   1, GETDATE(), NULL, NULL),
		 ( 5, 'La Lima',				   1, GETDATE(), NULL, NULL),
		 ( 6, 'Pascilagua',				   1, GETDATE(), NULL, NULL),
		 ( 6, 'Comcepción de María',	   1, GETDATE(), NULL, NULL),
		 ( 6, 'Duyure',					   1, GETDATE(), NULL, NULL),
		 ( 6, 'El Corpues',				   1, GETDATE(), NULL, NULL),
		 ( 6, 'El Triunfo',				   1, GETDATE(), NULL, NULL),
		 ( 6, 'Marcovia',				   1, GETDATE(), NULL, NULL),
		 ( 6, 'Morolica',				   1, GETDATE(), NULL, NULL),
		 ( 6, 'Namasigue',				   1, GETDATE(), NULL, NULL),
		 ( 6, 'Orocuina',				   1, GETDATE(), NULL, NULL),
		 ( 6, 'Pespire',				   1, GETDATE(), NULL, NULL),
		 ( 6, 'San Antonio de Flores',	   1, GETDATE(), NULL, NULL),
		 ( 6, 'San Isidrio',			   1, GETDATE(), NULL, NULL),
		 ( 6, 'San José',				   1, GETDATE(), NULL, NULL),
		 ( 6, 'San Marcos de Colón',	   1, GETDATE(), NULL, NULL),
		 ( 6, 'Santa Ana de Yuscuare',	   1, GETDATE(), NULL, NULL),
		 ( 7, 'Yuscarán',				   1, GETDATE(), NULL, NULL),
		 ( 7, 'Alauca',					   1, GETDATE(), NULL, NULL),
		 ( 7, 'Danlí',					   1, GETDATE(), NULL, NULL),
		 ( 7, 'El Paraíso',				   1, GETDATE(), NULL, NULL),
		 ( 7, 'Guinope',				   1, GETDATE(), NULL, NULL),
		 ( 7, 'Jacaleapa',				   1, GETDATE(), NULL, NULL),
		 ( 7, 'Liure',					   1, GETDATE(), NULL, NULL),
		 ( 7, 'Morocelí',				   1, GETDATE(), NULL, NULL),
		 ( 7, 'Oropolí',				   1, GETDATE(), NULL, NULL),
		 ( 7, 'Potrerillos',			   1, GETDATE(), NULL, NULL),
		 ( 7, 'San Antonio de Flores',	   1, GETDATE(), NULL, NULL),
		 ( 7, 'San Lucas',				   1, GETDATE(), NULL, NULL),		 
		 ( 7, 'San Matías',				   1, GETDATE(), NULL, NULL),
		 ( 7, 'Soledad',				   1, GETDATE(), NULL, NULL),
		 ( 7, 'Teupasenti',				   1, GETDATE(), NULL, NULL),
		 ( 7, 'Texiguat',				   1, GETDATE(), NULL, NULL),
		 ( 7, 'Vado Ancho',				   1, GETDATE(), NULL, NULL),		
		 ( 7, 'Yauyupe',				   1, GETDATE(), NULL, NULL),
		 ( 7, 'Trojes',					   1, GETDATE(), NULL, NULL),
		 ( 8, 'Distrito Central',		   1, GETDATE(), NULL, NULL),
		 ( 8, 'Alubarén',				   1, GETDATE(), NULL, NULL),
		 ( 8, 'Cedros',					   1, GETDATE(), NULL, NULL),
		 ( 8, 'Cucarén',				   1, GETDATE(), NULL, NULL),
		 ( 8, 'El Porvenir',			   1, GETDATE(), NULL, NULL),
		 ( 8, 'Guaimaca',				   1, GETDATE(), NULL, NULL),
		 ( 8, 'La Libertad',			   1, GETDATE(), NULL, NULL),
		 ( 8, 'La Venta',				   1, GETDATE(), NULL, NULL),
		 ( 8, 'Lepaterique',			   1, GETDATE(), NULL, NULL),
		 ( 8, 'Maraita',				   1, GETDATE(), NULL, NULL),
		 ( 8, 'Maralé',					   1, GETDATE(), NULL, NULL),
		 ( 8, 'Nueva Armedia',			   1, GETDATE(), NULL, NULL),
		 ( 8, 'Ojojona',				   1, GETDATE(), NULL, NULL),
		 ( 8, 'Orica',					   1, GETDATE(), NULL, NULL),
		 ( 8, 'Reitoca',				   1, GETDATE(), NULL, NULL),
		 ( 8, 'Sabana Grande',			   1, GETDATE(), NULL, NULL),
		 ( 8, 'San Antonio de Oriente',    1, GETDATE(), NULL, NULL),
		 ( 8, 'San Buenaventura',		   1, GETDATE(), NULL, NULL),
		 ( 8, 'San Ignacio',			   1, GETDATE(), NULL, NULL),
		 ( 8, 'San Juan de Flores',		   1, GETDATE(), NULL, NULL),
		 ( 8, 'San Miguelito',			   1, GETDATE(), NULL, NULL),
		 ( 8, 'Santa Ana',				   1, GETDATE(), NULL, NULL),
		 ( 8, 'Santa Lucía',			   1, GETDATE(), NULL, NULL),
		 ( 8, 'Talanga',				   1, GETDATE(), NULL, NULL),
		 ( 8, 'Tatumbla',				   1, GETDATE(), NULL, NULL),
		 ( 8, 'Valle de Ángeles',		   1, GETDATE(), NULL, NULL),
		 ( 8, 'Villas de San Fernando',    1, GETDATE(), NULL, NULL),
		 ( 8, 'Vallecillo',				   1, GETDATE(), NULL, NULL),
		 ( 9, 'Puerto Lempira',			   1, GETDATE(), NULL, NULL),
		 ( 9, 'Brus Laguna',			   1, GETDATE(), NULL, NULL),
		 ( 9, 'Hauas',					   1, GETDATE(), NULL, NULL),
		 ( 9, 'Juan Francisco Bulnes',	   1, GETDATE(), NULL, NULL),
		 ( 9, 'Villeda Morales',		   1, GETDATE(), NULL, NULL),
		 ( 9, 'Wanpucirpe',				   1, GETDATE(), NULL, NULL),
		 (10, 'La Esperanza',			   1, GETDATE(), NULL, NULL),
		 (10, 'Camasca',				   1, GETDATE(), NULL, NULL),
		 (10, 'Colomcagua',				   1, GETDATE(), NULL, NULL),
		 (10, 'Concepción',				   1, GETDATE(), NULL, NULL),
		 (10, 'Dolores',				   1, GETDATE(), NULL, NULL),
		 (10, 'Intibuca',				   1, GETDATE(), NULL, NULL),
		 (10, 'Jesus de Otoro',			   1, GETDATE(), NULL, NULL),
		 (10, 'Magadalena',				   1, GETDATE(), NULL, NULL),
		 (10, 'Masaguara',				   1, GETDATE(), NULL, NULL),
		 (10, 'San Antonio',			   1, GETDATE(), NULL, NULL),
		 (10, 'San Isidro',				   1, GETDATE(), NULL, NULL),
		 (10, 'San Juan',				   1, GETDATE(), NULL, NULL),
		 (10, 'San Marcos de la Sierra',   1, GETDATE(), NULL, NULL),
		 (10, 'San Miguelito',			   1, GETDATE(), NULL, NULL),
		 (10, 'Santa Lucía',			   1, GETDATE(), NULL, NULL),
		 (10, 'Yamaranguila',			   1, GETDATE(), NULL, NULL),
		 (10, 'San Francisco de Opalaca',  1, GETDATE(), NULL, NULL),
		 (11, 'Roatán',					   1, GETDATE(), NULL, NULL),
		 (11, 'Guanaja',				   1, GETDATE(), NULL, NULL),
		 (11, 'José Santos Guardiola',	   1, GETDATE(), NULL, NULL),
		 (11, 'Utila',					   1, GETDATE(), NULL, NULL),
		 (12, 'Aguanqueterique',		   1, GETDATE(), NULL, NULL),
		 (12, 'Cabañas',				   1, GETDATE(), NULL, NULL),
		 (12, 'Cane',					   1, GETDATE(), NULL, NULL),
		 (12, 'Chinacla',				   1, GETDATE(), NULL, NULL),
		 (12, 'Guagiquiro',				   1, GETDATE(), NULL, NULL),
		 (12, 'Lauterique',				   1, GETDATE(), NULL, NULL),
		 (12, 'Marcala',				   1, GETDATE(), NULL, NULL),
		 (12, 'Mercedes de Oriente',	   1, GETDATE(), NULL, NULL),
		 (12, 'Opatoro',				   1, GETDATE(), NULL, NULL),
		 (12, 'San Antonio del Norte',	   1, GETDATE(), NULL, NULL),
		 (12, 'San José',				   1, GETDATE(), NULL, NULL),
		 (12, 'San Juan',				   1, GETDATE(), NULL, NULL),
		 (12, 'San Pedro de Tutule',	   1, GETDATE(), NULL, NULL),
		 (12, 'Santa Ana',				   1, GETDATE(), NULL, NULL),
		 (12, 'San Elena',				   1, GETDATE(), NULL, NULL),
		 (12, 'Santa María',			   1, GETDATE(), NULL, NULL),
		 (12, 'Santiago de Puringla',	   1, GETDATE(), NULL, NULL),
		 (12, 'Yarula',					   1, GETDATE(), NULL, NULL),
		 (13, 'Gracias',				   1, GETDATE(), NULL, NULL),
		 (13, 'Belén',					   1, GETDATE(), NULL, NULL),
		 (13, 'Candelaria',				   1, GETDATE(), NULL, NULL),
		 (13, 'Cololaca',				   1, GETDATE(), NULL, NULL),
		 (13, 'Erandique',				   1, GETDATE(), NULL, NULL),
		 (13, 'Guascinse',				   1, GETDATE(), NULL, NULL),
		 (13, 'Guarita',				   1, GETDATE(), NULL, NULL),
		 (13, 'La Campa',				   1, GETDATE(), NULL, NULL),
		 (13, 'La Iguala',				   1, GETDATE(), NULL, NULL),
		 (13, 'Las Flores',				   1, GETDATE(), NULL, NULL),
		 (13, 'La Unión',				   1, GETDATE(), NULL, NULL),
		 (13, 'La Virtud',				   1, GETDATE(), NULL, NULL),
		 (13, 'Lepaera',				   1, GETDATE(), NULL, NULL),
		 (13, 'Mapulaca',				   1, GETDATE(), NULL, NULL),
		 (13, 'Piraera',				   1, GETDATE(), NULL, NULL),
		 (13, 'San Andrés',				   1, GETDATE(), NULL, NULL),
		 (13, 'San Francisco',			   1, GETDATE(), NULL, NULL),
		 (13, 'San Juan Guarita',		   1, GETDATE(), NULL, NULL),
		 (13, 'San Manuel Colohete',	   1, GETDATE(), NULL, NULL),
		 (13, 'San Rafael',				   1, GETDATE(), NULL, NULL),
		 (13, 'San Sebastián',			   1, GETDATE(), NULL, NULL),
		 (13, 'Santa Crúz',				   1, GETDATE(), NULL, NULL),
		 (13, 'Talgua',					   1, GETDATE(), NULL, NULL),
		 (13, 'Tambla',					   1, GETDATE(), NULL, NULL),
		 (13, 'Tomalá',					   1, GETDATE(), NULL, NULL),
		 (13, 'Valladolid',				   1, GETDATE(), NULL, NULL),
		 (13, 'Virginia',				   1, GETDATE(), NULL, NULL),
		 (13, 'San Marcos de Caiquin',	   1, GETDATE(), NULL, NULL),
		 (14, 'Ocotepeque',				   1, GETDATE(), NULL, NULL),
		 (14, 'Belén Gualcho',			   1, GETDATE(), NULL, NULL),
		 (14, 'Concepción',				   1, GETDATE(), NULL, NULL),
		 (14, 'Dolores Merendón',		   1, GETDATE(), NULL, NULL),
		 (14, 'Fraternidad',			   1, GETDATE(), NULL, NULL),
		 (14, 'La Encarnación',			   1, GETDATE(), NULL, NULL),
		 (14, 'La Labor',				   1, GETDATE(), NULL, NULL),
		 (14, 'Lucerna',				   1, GETDATE(), NULL, NULL),
		 (14, 'Mercedes',				   1, GETDATE(), NULL, NULL),
		 (14, 'San Fernando',			   1, GETDATE(), NULL, NULL),
		 (14, 'San Francisco del Valle',   1, GETDATE(), NULL, NULL),
		 (14, 'San Jorge',				   1, GETDATE(), NULL, NULL),
		 (14, 'San Marcos',				   1, GETDATE(), NULL, NULL),
		 (14, 'Santa Fé',				   1, GETDATE(), NULL, NULL),
		 (14, 'Sesenti',				   1, GETDATE(), NULL, NULL),
		 (14, 'Sinuapa',				   1, GETDATE(), NULL, NULL),
		 (15, 'Juticalpa',				   1, GETDATE(), NULL, NULL),
		 (15, 'Campamento',				   1, GETDATE(), NULL, NULL),
		 (15, 'Catacamas',				   1, GETDATE(), NULL, NULL),
		 (15, 'Concordia',				   1, GETDATE(), NULL, NULL),
		 (15, 'Dulce Nombre de Culmí',	   1, GETDATE(), NULL, NULL),
		 (15, 'El Rosario',				   1, GETDATE(), NULL, NULL),
		 (15, 'Esquípulas del Norte',	   1, GETDATE(), NULL, NULL),
		 (15, 'Gualaco',				   1, GETDATE(), NULL, NULL),
		 (15, 'Guarizama',				   1, GETDATE(), NULL, NULL),
		 (15, 'Guata',					   1, GETDATE(), NULL, NULL),
		 (15, 'Guayape',				   1, GETDATE(), NULL, NULL),
		 (15, 'Jano',					   1, GETDATE(), NULL, NULL),
		 (15, 'La Unión',				   1, GETDATE(), NULL, NULL),
		 (15, 'Mangulile',				   1, GETDATE(), NULL, NULL),
		 (15, 'Manto',					   1, GETDATE(), NULL, NULL),
		 (15, 'Salamá',					   1, GETDATE(), NULL, NULL),
		 (15, 'San Esteban',			   1, GETDATE(), NULL, NULL),
		 (15, 'San Francisco de Becerra',  1, GETDATE(), NULL, NULL),
		 (15, 'San Francisco de La Paz',   1, GETDATE(), NULL, NULL),
		 (15, 'San María del Real',		   1, GETDATE(), NULL, NULL),
		 (15, 'Silca',					   1, GETDATE(), NULL, NULL),
		 (15, 'Yocon',					   1, GETDATE(), NULL, NULL),
		 (15, 'Patuca',					   1, GETDATE(), NULL, NULL),
		 (16, 'Santa Bárbara',			   1, GETDATE(), NULL, NULL),
		 (16, 'Arada',					   1, GETDATE(), NULL, NULL),
		 (16, 'Atima',					   1, GETDATE(), NULL, NULL),
		 (16, 'Azacualpa',				   1, GETDATE(), NULL, NULL),
		 (16, 'Ceguaca',				   1, GETDATE(), NULL, NULL),
		 (16, 'Concepción del Norte',	   1, GETDATE(), NULL, NULL),
		 (16, 'Concepción del Sur',		   1, GETDATE(), NULL, NULL),
		 (16, 'Chinda',					   1, GETDATE(), NULL, NULL),
		 (16, 'El Níspero',				   1, GETDATE(), NULL, NULL),
		 (16, 'Gualala',				   1, GETDATE(), NULL, NULL),
		 (16, 'Ilama',					   1, GETDATE(), NULL, NULL),
		 (16, 'Las Vegas',				   1, GETDATE(), NULL, NULL),
		 (16, 'Macuelizo',				   1, GETDATE(), NULL, NULL),
		 (16, 'Naranjito',				   1, GETDATE(), NULL, NULL),
		 (16, 'Nuevo Celilac',			   1, GETDATE(), NULL, NULL),
		 (16, 'Nueva Frontera',			   1, GETDATE(), NULL, NULL),
		 (16, 'Petoa',					   1, GETDATE(), NULL, NULL),
		 (16, 'Protección',				   1, GETDATE(), NULL, NULL),
		 (16, 'Quimistán',				   1, GETDATE(), NULL, NULL),
		 (16, 'San Francisco de Ojuera',   1, GETDATE(), NULL, NULL),
		 (16, 'San José de Colinas',	   1, GETDATE(), NULL, NULL),
		 (16, 'San Luis',				   1, GETDATE(), NULL, NULL),
		 (16, 'San Marcos',				   1, GETDATE(), NULL, NULL),
		 (16, 'San Nicolás',			   1, GETDATE(), NULL, NULL),
		 (16, 'San Pedro Zacapa',		   1, GETDATE(), NULL, NULL),
		 (16, 'San Vicente Centenario',    1, GETDATE(), NULL, NULL),
		 (16, 'Santa Rita',				   1, GETDATE(), NULL, NULL),
		 (16, 'Trinidad',				   1, GETDATE(), NULL, NULL),
		 (17, 'Nacome',					   1, GETDATE(), NULL, NULL),
		 (17, 'Alianza',				   1, GETDATE(), NULL, NULL),
		 (17, 'Amapala',				   1, GETDATE(), NULL, NULL),
		 (17, 'Aramecina',				   1, GETDATE(), NULL, NULL),
		 (17, 'Caridad',				   1, GETDATE(), NULL, NULL),
		 (17, 'Goascorán',				   1, GETDATE(), NULL, NULL),
		 (17, 'Langue',					   1, GETDATE(), NULL, NULL),
		 (17, 'San Francisco de Coray',    1, GETDATE(), NULL, NULL),
		 (17, 'San Lorenzo',			   1, GETDATE(), NULL, NULL),
		 (18, 'Yoro',					   1, GETDATE(), NULL, NULL),
		 (18, 'Arenal',					   1, GETDATE(), NULL, NULL),
		 (18, 'El Negrito',				   1, GETDATE(), NULL, NULL),
		 (18, 'El Progreso',			   1, GETDATE(), NULL, NULL),
		 (18, 'Jocón',					   1, GETDATE(), NULL, NULL),
		 (18, 'Morazán',				   1, GETDATE(), NULL, NULL),
		 (18, 'Olanchito',				   1, GETDATE(), NULL, NULL),
		 (18, 'Santa Rita',				   1, GETDATE(), NULL, NULL),
		 (18, 'Sulaco',					   1, GETDATE(), NULL, NULL),
		 (18, 'Victoria',				   1, GETDATE(), NULL, NULL),
		 (18, 'Yorito',					   1, GETDATE(), NULL, NULL);
		



CREATE TABLE Gral.tbSucursales (
		suc_Id				INT IDENTITY(1,1)	NOT NULL PRIMARY KEY,
		suc_Descripcion		NVARCHAR(100)		NOT NULL,
		suc_Municipio		INT					NOT NULL,

		suc_UsuCrea			INT,
		suc_FechaCrea		DATETIME			DEFAULT GETDATE(),
		suc_usuModi			INT,
		suc_FechaModi		DATETIME,
		suc_Estado			BIT DEFAULT 1,

		CONSTRAINT FK_Maqui_tbSucursales_Gral_tbMunicipios FOREIGN KEY (suc_Municipio) REFERENCES Gral.tbMunicipios(mun_Id),
		CONSTRAINT FK_Gral_tbSucursales_suc_UsuCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(suc_UsuCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Gral_tbSucursales_suc_usuModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(suc_usuModi) REFERENCES Gral.tbUsuarios(usu_ID)
);


INSERT INTO Gral.tbSucursales
VALUES  ('Beaty Face', 64,				 1, GETDATE(), NULL, NULL, 1),
		('Kriz Reales Studio', 64,		 1, GETDATE(), NULL, NULL, 1),
		('Beauty Supply Honduras', 111,  1, GETDATE(), NULL, NULL, 1),
		('Elf Cosmetics HN', 23,	     1, GETDATE(), NULL, NULL, 1),
		('Miami Beaty HN', 45,			 1, GETDATE(), NULL, NULL, 1),
		('Maquillajes Express', 230,	 1, GETDATE(), NULL, NULL, 1),
		('Cosmetics Depot', 67,			 1, GETDATE(), NULL, NULL, 1),
		('Makeup Studio', 98,			 1, GETDATE(), NULL, NULL, 1),
		('Tiendas Alisson', 88,			 1, GETDATE(), NULL, NULL, 1),
		('Tiendas Kelys', 29,			 1, GETDATE(), NULL, NULL, 1),
		('Og Beaty',61,					 1, GETDATE(), NULL, NULL, 1),
		('Sophis Beaty Studio', 130,	 1, GETDATE(), NULL, NULL, 1),
		('Xicero Makeup', 210,			 1, GETDATE(), NULL, NULL, 1),
	    ('Goc Makeup', 246,				 1, GETDATE(), NULL, NULL, 1),
		('Magic Makeup', 176,			 1, GETDATE(), NULL, NULL, 1),
		('Cosmética Mima', 132,			 1, GETDATE(), NULL, NULL, 1),
		('AR Makeup', 155,				 1, GETDATE(), NULL, NULL, 1),
		('Novedades Salomé', 110,		 1, GETDATE(), NULL, NULL, 1),
		('Pretty Rose MakeUp', 284,		 1, GETDATE(), NULL, NULL, 1),
		('Fedcp', 2,					 1, GETDATE(), NULL, NULL, 1);


CREATE TABLE Gral.tbEmpleados(
		emp_ID				INT IDENTITY(1,1) PRIMARY KEY,
		emp_Nombre			NVARCHAR(250)		NOT NULL,
		emp_Apellido		NVARCHAR(250)		NOT NULL,
		emp_DNI				VARCHAR(13)			NOT NULL,
		emp_FechaNacimiento DATE				NOT NULL,
		emp_Sexo			CHAR(1)				NOT NULL,
		emp_Telefono		NVARCHAR(100)		NOT NULL,
		emp_Municipio		INT					NOT NULL,
		emp_Correo			NVARCHAR(250)		NOT NULL,
		emp_EstadoCivil		INT					NOT NULL,
		emp_Sucursal		INT					NOT NULL,

		emp_UsuarioCrea		INT					NOT NULL,
		emp_FechaCrea		DATETIME			DEFAULT GETDATE(),
		emp_UsuarioModi		INT,
		emp_FechaModi		DATETIME,
		emp_Estado			BIT					DEFAULT 1

		CONSTRAINT UQ_Gral_tbEmpleados_emp_DNI		UNIQUE		(emp_DNI),
		CONSTRAINT CK_Gral_tbEmpleados_emp_Sexo		CHECK		(emp_Sexo IN ('F', 'M')),
		CONSTRAINT FK_Gral_tbEmpleados_emp_Sucursal_Gral_tbSucursales_emp_Sucursal_suc_Id	FOREIGN KEY (emp_Sucursal)		REFERENCES Gral.tbSucursales(suc_Id),
		CONSTRAINT FK_Gral_tbEmpleados_emp_Municipio_Gral_tbMunicipios_mun_ID				FOREIGN KEY (emp_Municipio)		REFERENCES Gral.tbMunicipios  (mun_ID),
		CONSTRAINT FK_Gral_tbEmpleados_emp_EstadoCivil_Gral_tbEstadoCivil_est_ID			FOREIGN KEY (emp_EstadoCivil)	REFERENCES Gral.tbEstadosCiviles (est_ID),
		CONSTRAINT FK_Gral_tbEmpleados_emp_UsuarioCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(emp_UsuarioCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Gral_tbEmpleados_emp_UsuarioModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(emp_UsuarioModi) REFERENCES Gral.tbUsuarios(usu_ID)
);

INSERT INTO Gral.tbEmpleados
VALUES  ('Hugo', 'Alcerro', '1615199009008', '1990-08-09', 'M', '+504 9009-6778', 200, 'hugalcerro@gmail.com', 2, 4,		1, GETDATE(), NULL, NULL, 1),
		('Mariela', 'Vega', '0910197600977', '1998-10-23', 'F', '+504 9878-3241', 111, 'marvega@gmail.com', 1, 6,			1, GETDATE(), NULL, NULL, 1),
		('Oliver', 'Membreño', '0901199209034', '1992-12-09', 'M', '+504 8909-3343', 23, 'olimem@gmail.com', 3, 7,			1, GETDATE(), NULL, NULL, 1),
		('Ernestina', 'Mejía', '0304199790567', '1997-02-10', 'F', '+504 9780-5463', 89, 'ernesmia@gmail.com', 6, 14,		1, GETDATE(), NULL, NULL, 1),
		('Sandro', 'Yanez', '0309199009890', '1990-10-26', 'M', '+504 9767-6657', 54, 'sandroyane@gmail.com', 7, 10,		1, GETDATE(), NULL, NULL, 1),
		('Juana', 'Juarez', '1002199062718', '1990-05-21', 'F', '+504 9231-6512', 90, 'juajua@gmail.com', 3, 11,			1, GETDATE(), NULL, NULL, 1),
		('Nelson', 'Umaña', '1102198900090', '1989-02-10', 'M', '+504 9345-5161', 54, 'neluña@gmail.com', 1, 8,				1, GETDATE(), NULL, NULL, 1),
		('Carolina', 'Menjivar', '1109199908956', '1999-05-04', 'F', '+504 9789-5565', 87, 'caromen@gmail.com', 5, 19,		1, GETDATE(), NULL, NULL, 1),
		('Victor', 'Carcasa', '1210197600097', '1976-09-10', 'M', '+504 9451-5643', 23, 'viccarra@gmail.com', 6, 2,			1, GETDATE(), NULL, NULL, 1),
		('Tania', 'Lopez', '0912199090790', '1990-10-29', 'F', '+504 9134-5261', 180, 'tanlope@gmail.com', 1, 3,			1, GETDATE(), NULL, NULL, 1),
		('Betulio', 'Nuñez', '1202199409890', '1997-12-18', 'M', '+504 8909-6473', 121, 'betunu@gmail.com', 2, 18,			1, GETDATE(), NULL, NULL, 1),
		('Yulissa', 'Sanchez', '1202197809001', '1978-12-23', 'F', '+504 9809-6657', 150, 'yulisan@gmail.com', 3, 12,		1, GETDATE(), NULL, NULL, 1),
		('Ilinois', 'Urquía', '1109198500909', '1985-06-25', 'M', '+504 8298-9089', 230, 'ilinourquia@gmail.com', 4, 15,	1, GETDATE(), NULL, NULL, 1),
		('Carla', 'Oliva', '0413198809067', '1988-04-20', 'F', '+504 9567-7789', 241, 'caroli@gmail.com', 5, 14,			1, GETDATE(), NULL, NULL, 1),
		('Rodrigo', 'Buena', '0412199089009', '1990-11-09', 'M', '+504 9587-4521', 143, 'rodribue@gmail.com', 6, 17,		1, GETDATE(), NULL, NULL, 1),
		('Nidia', 'Rodríguez', '0911199809896', '1998-12-20', 'F', '+504 9954-7768', 25, 'nidirodri@gmail.com', 7, 5,		1, GETDATE(), NULL, NULL, 1),
		('Ulises', 'Villega', '1514199609890', '1996-09-02', 'M', '+504 9888-0909', 54, 'uliville@gmail.com', 1, 6,			1, GETDATE(), NULL, NULL, 1),
		('Tiana', 'Petoa', '0915199056281', '1990-10-15', 'F', '+504 9867-5546', 96, 'tuapetoa@gmail.com', 2, 7,			1, GETDATE(), NULL, NULL, 1),
		('Mario', 'Herrera', '0912199072819', '1990-04-21', 'M', '+504 9123-5434', 77, 'marioherre@gmail.com', 3, 8,		1, GETDATE(), NULL, NULL, 1),
		('Elia', 'Mejía', '0917199072819', '1990-09-11', 'F', '+504 9678-4453', 87, 'eliameji@gmail.com', 4, 9,				1, GETDATE(), NULL, NULL, 1);

--*****************************************CONSTRAINT DE EMPLEADOS EN LA TABLA USUARIOS*****************************************--
ALTER TABLE Gral.tbUsuarios
ADD CONSTRAINT FK_Gral_tbUsuarios_usu_empID_Gral_tbEmpleados_emp_ID	FOREIGN KEY (usu_empID) REFERENCES Gral.tbEmpleados (emp_ID)
--*****************************************CONSTRAINT DE EMPLEADOS EN LA TABLA USUARIOS*****************************************--

CREATE TABLE Gral.tbClientes(

		cli_ID				INT IDENTITY(1,1) PRIMARY KEY,
		cli_Nombre			NVARCHAR(250)		NOT NULL,
		cli_Apellido		NVARCHAR(250)		NOT NULL,
		cli_DNI				VARCHAR(13)			NOT NULL,
		cli_FechaNacimiento DATE				NOT NULL,
		cli_Sexo			CHAR(1)				NOT NULL,
		cli_Telefono		NVARCHAR(100)		NOT NULL,
		cli_Municipio		INT					NOT NULL,
		cli_EstadoCivil		INT					NOT NULL,
		

		cli_UsuarioCrea		INT					NOT NULL,
		cli_FechaCrea		DATETIME			DEFAULT GETDATE(),
		cli_UsuarioModi		INT,
		cli_FechaModi		DATETIME,
		cli_Estado			BIT					DEFAULT 1

		CONSTRAINT UQ_Gral_tbClientes_cli_DNI			UNIQUE		(cli_DNI),
		CONSTRAINT CK_Gral_tbClientes_cli_Sexo		CHECK		(cli_Sexo IN ('F', 'M')),
		CONSTRAINT FK_Gral_tbClientes_cli_Municipio_Gral_tbMunicipios_mun_ID	FOREIGN KEY (cli_Municipio)	    REFERENCES Gral.tbMunicipios  (mun_ID),
		CONSTRAINT FK_Gral_tbClientes_cli_EstadoCivil_Gral_tbEstadoCivil_est_ID	FOREIGN KEY (cli_EstadoCivil)	REFERENCES Gral.tbEstadosCiviles (est_ID),
		CONSTRAINT FK_Gral_tbClientes_cli_UsuarioCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(cli_UsuarioCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Gral_tbClientes_cli_UsuarioModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(cli_UsuarioModi) REFERENCES Gral.tbUsuarios(usu_ID)
);


INSERT INTO Gral.tbClientes
VALUES  ('Hugo', 'Mendoza', '1904425167251', '1990-12-15', 'M', '+504 9341-9097', 112, 1, 			1, GETDATE(), NULL, NULL, 1),
		('Sarai', 'Quintanilla', '1109199062781', '1990-12-15', 'F', '+504 9123-5543', 111, 1, 		1, GETDATE(), NULL, NULL, 1),
		('Marco', 'Torrez', '1109199828192', '1998-09-12', 'M', '+504 8908-5463', 23, 3, 			1, GETDATE(), NULL, NULL, 1),
		('Celina', 'Arias', '0912199064782', '1990-09-12', 'F', '+504 9657-7483', 89, 6, 			1, GETDATE(), NULL, NULL, 1),
		('Luis', 'Chicas', '0910199298128', '1992-09-27', 'M', '+504 9834-5621', 54, 7, 			1, GETDATE(), NULL, NULL, 1),
		('Angie', 'Andino', '0912199028739', '1990-05-21', 'F', '+504 9064-7869', 90, 3, 			1, GETDATE(), NULL, NULL, 1),
		('Nelson', 'Umaña', '1102198900090', '1989-02-10', 'M', '+504 9345-5161', 54, 1, 			1, GETDATE(), NULL, NULL, 1),
		('Marbella', 'Gómez', '0815199789023', '1997-09-02', 'F', '+504 9809-5461', 87, 5, 			1, GETDATE(), NULL, NULL, 1),
		('Carlos', 'Amaya', '0914199567281', '1995-09-05', 'M', '+504 9109-6573', 23, 6, 			1, GETDATE(), NULL, NULL, 1),
		('Dayana', 'Erazo', '1805199678934', '1995-03-21', 'F', '+504 9563-7381', 180, 1, 			1, GETDATE(), NULL, NULL, 1),
		('Jasson', 'Zaldívar', '0912199856271', '1998-09-21', 'M', '+504 9100-7584', 121, 2, 		1, GETDATE(), NULL, NULL, 1),
		('Marlin', 'Guzmán', '0213199456721', '1994-10-07', 'F', '+504 9822-5216', 150, 3, 			1, GETDATE(), NULL, NULL, 1),
		('Yoner', 'Zaldívar', '0913199245162', '1992-09-25', 'M', '+504 8145-6627', 230, 4, 		1, GETDATE(), NULL, NULL, 1),
		('Genesis', 'Sagastume', '0914199820192', '1988-09-07', 'F', '+504 9203-8749', 241, 5, 		1, GETDATE(), NULL, NULL, 1),
		('Anthony', 'Leiva', '0415198962592', '1989-11-03', 'M', '+504 9631-7521', 143, 6, 			1, GETDATE(), NULL, NULL, 1),
		('Paola', 'Decas', '0914199678291', '1996-09-23', 'F', '+504 9561-2331', 25, 7, 			1, GETDATE(), NULL, NULL, 1),
		('Caleb', 'Benítez', '1401199078676', '1990-03-27', 'M', '+504 9521-5547', 54, 1, 			1, GETDATE(), NULL, NULL, 1),
		('Exibia', 'Bueso', '0314199800989', '1998-02-15', 'F', '+504 9312-7584', 96, 2, 			1, GETDATE(), NULL, NULL, 1),
		('Carlos', 'Herrera', '0314199062712', '1990-04-22', 'M', '+504 9623-9956', 77, 3, 			1, GETDATE(), NULL, NULL, 1),
		('Ana', 'Fajardo', '0913199092738', '1998-09-23', 'F', '+504 9027-8867', 87, 4,				1, GETDATE(), NULL, NULL, 1);



		



--//************************ TABLAS TIENDA ************************--//
GO
CREATE SCHEMA Maqui
GO

CREATE TABLE Maqui.tbProveedores(
		prv_ID				    INT IDENTITY(1,1) PRIMARY KEY,
		prv_NombreCompañia		NVARCHAR(250)		NOT NULL,
		prv_NombreContacto		NVARCHAR(250)		NOT NULL,
		prv_TelefonoContacto	NVARCHAR(100)		NOT NULL,
		prv_Municipio		    INT					NOT NULL,
		prv_DireccionEmpresa	NVARCHAR(200)		NOT NULL,
		prv_DireccionContacto	NVARCHAR(200)		NOT NULL,
		prv_SexoContacto		CHAR(1)				NOT NULL,

		prv_UsuarioCrea			INT					NOT NULL,
		prv_FechaCrea		    DATETIME			DEFAULT GETDATE(),
		prv_UsuarioModi			INT,
		prv_FechaModi		    DATETIME,
		prv_Estado			    BIT					DEFAULT 1,

		
		CONSTRAINT PK_Maqui_tbProveedores_Gral_tbMunicipios_prv_Municipio	FOREIGN KEY (prv_Municipio)	    REFERENCES Gral.tbMunicipios  (mun_ID),
		CONSTRAINT FK_Maqui_tbProveedores_prv_UsuarioCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(prv_UsuarioCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Maqui_tbProveedores_prv_UsuarioModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(prv_UsuarioModi) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT CK_Maqui_tbProveedores_prv_SexoContacto CHECK (prv_SexoContacto IN ('F','M'))

);
INSERT INTO Maqui.tbProveedores
VALUES  
		('Lubre Cosmética Natural', 'Francsico Mejía', '+504 9878-4562', 25, 'Calle hacia Armenta, atras de Mall Altara.','1ra Calle, Salida a La Lima','F',	1, GETDATE(), NULL, NULL, 1),
		('Ortrade', 'Blanca Wong', '+504 9809-4453', 32, '3ra Avenida, 2da Calle Prolonogación Pasaje Valle','1ra Calle, Salida a La Lima','F',				1, GETDATE(), NULL, NULL, 1),
		('Yesensy', 'Marlon Lee', '+504 9856-6371', 173, '1ra Calle, Salida a La Lima',	'1ra Calle, Salida a La Lima','F',									1, GETDATE(), NULL, NULL, 1),
		('Bamboo Cosmetcis', 'Tristan Thompson', '+504 9801-3561', 289, '1ra Calle, 3ra Avenida, Frente al Parque Central','1ra Calle, Salida a La Lima','F',	1, GETDATE(), NULL, NULL, 1),
		('Laboratorios Anteii', 'Ulises Menjivar', '+504 8790-4352', 231, '5ta Calle, 5ta Avenida, Barrio El Centro','1ra Calle, Salida a La Lima','F',		1, GETDATE(), NULL, NULL, 1),
		('Divasa Cosmetics', 'Pedro Urquía', '+504 8909-5564', 126, '4 y 5 Calle, 2da Avenida, Barrio El Centro','1ra Calle, Salida a La Lima','F',			1, GETDATE(), NULL, NULL, 1),
		('CosmetiChile', 'Maryuri Lee', '+504 8909-5563', 149, '2da Calle, Avenida Junior',	'1ra Calle, Salida a La Lima','F',								1, GETDATE(), NULL, NULL, 1),
		('Kylie Cosmetics', 'Angie Campos', '+504 9756-3311', 105, '1ra Calle, 4ta Avenida, Barrio Concepción',	'1ra Calle, Salida a La Lima','F',			1, GETDATE(), NULL, NULL, 1),
		('Guangzhou Xiran Cosmetics Co.', 'Sandra Xiang', '+504 9867-8954', 209, 'Bo. del Norte', '1ra Calle, Salida a La Lima','F',						1, GETDATE(), NULL, NULL, 1),
		('Bause Cosmetcis', 'Julissa Liang', '+504 8756-3412', 243, '5ta Calle, 3ra Avenida, Atrás de Tropigas','1ra Calle, Salida a La Lima','F',			1, GETDATE(), NULL, NULL, 1),
		('Frida Cosmetics', 'Karla Eraza', '+504 9756-3526', 122, '16 Avenida, Barrio Suyapa',	'1ra Calle, Salida a La Lima','F',							1, GETDATE(), NULL, NULL, 1),
		('Paulis MakeUp', 'Yana Rodríguez', '+504 9786-4451', 245, 'Calle Salida Vieja a La Lima',	'1ra Calle, Salida a La Lima','F',						1, GETDATE(), NULL, NULL, 1),
		('Maquillaje Stock', 'Oliver Memphis', '+504 8967-4251', 128, 'Barrio El Calvario, Calle Principal',	'1ra Calle, Salida a La Lima','F',			1, GETDATE(), NULL, NULL, 1),
		('Seytú', 'Ernesto Lopez', '+504 9878-3300', 133, 'Col. El Carmen, Calle Principal',		'1ra Calle, Salida a La Lima','F',						1, GETDATE(), NULL, NULL, 1),
		('Ibella', 'Vanessa Banegas', '+504 9878-5536', 244, 'Avenida Circunvalación',	'1ra Calle, Salida a La Lima','F',									1, GETDATE(), NULL, NULL, 1),
		('Estudio Juvenil', 'Juana Jeréx', '+504 9299-5637', 267, 'Avenida los Olivos, 6ta Calle, 1ra Avenida',	'1ra Calle, Salida a La Lima','F',			1, GETDATE(), NULL, NULL, 1),
		('Cosméticos al por Mayor', 'Paulina Guatusa', '+504 8900-6738', 128, 'Avenida Francisco Olivos',	'1ra Calle, Salida a La Lima','F',				1, GETDATE(), NULL, NULL, 1),
		('DisDroper', 'Fanny Hungría', '+504 9877-5362', 162, 'Col. Trinidad Yanez',	'1ra Calle, Salida a La Lima','F',									1, GETDATE(), NULL, NULL, 1),
		('Cosbelly Profesional', 'Deiby Guerra', '+504 9877-4412', 169, 'Col. Villa Nuria',		'1ra Calle, Salida a La Lima','F',							1, GETDATE(), NULL, NULL, 1),
		('Fransua', 'Maicoll Hungaro', '+504 9677-3142', 169, 'Col. Yanez',			'1ra Calle, Salida a La Lima','F',										1, GETDATE(), NULL, NULL, 1);



CREATE TABLE Maqui.tbCategorias(
		cat_Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		cat_Descripcion NVARCHAR(100) NOT NULL,

		cat_UsuCrea INT,
		cat_FechaCrea DATETIME DEFAULT GETDATE(),
		cat_UsuModi INT,
		cat_FechaModi DATETIME,
		cat_Estado BIT DEFAULT 1

		CONSTRAINT FK_Maqui_tbCategorias_cat_UsuCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(cat_UsuCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Maqui_tbCategorias_cat_UsuModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(cat_UsuModi) REFERENCES Gral.tbUsuarios(usu_ID)
);

INSERT INTO Maqui.tbCategorias
VALUES	('Labiales',				1, GETDATE(), NULL, NULL, 1),
		('Sombras',					1, GETDATE(), NULL, NULL, 1),
		('Rubores',					1, GETDATE(), NULL, NULL, 1),
		('Polvos',					1, GETDATE(), NULL, NULL, 1),
		('Bases',					1, GETDATE(), NULL, NULL, 1),
		('Cuidado para la Piel',	1, GETDATE(), NULL, NULL, 1),
		('Delineadores',			1, GETDATE(), NULL, NULL, 1),
		('Rímeles',					1, GETDATE(), NULL, NULL, 1);





CREATE TABLE Maqui.tbMetodoPago (
		met_Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		met_Descripcion NVARCHAR(100) NOT NULL,

		met_UsuCrea INT,
		met_FechaCrea DATETIME DEFAULT GETDATE(),
		met_usuModi INT,
		met_FechaModi DATETIME,
		met_Estado BIT DEFAULT 1

		CONSTRAINT FK_Maqui_tbMetodoPago_met_UsuCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(met_UsuCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Maqui_tbMetodoPago_met_usuModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(met_usuModi) REFERENCES Gral.tbUsuarios(usu_ID)
);


INSERT INTO maqui.tbMetodoPago
VALUES  ('Efectivo',							 1, GETDATE(), NULL, NULL, 1),
		('Cheques',								 1, GETDATE(), NULL, NULL, 1),
		('Tarjeta de Débito',					 1, GETDATE(), NULL, NULL, 1),
		('Tarjeta de Crédito',					 1, GETDATE(), NULL, NULL, 1),
		('Pagos Móviles',						 1, GETDATE(), NULL, NULL, 1),
		('Tranferencias Bancarias Electrónicas', 1, GETDATE(), NULL, NULL, 1);


CREATE TABLE Maqui.tbProductos(
		pro_Id				INT IDENTITY(1,1) PRIMARY KEY	NOT NULL,
		pro_Codigo			NVARCHAR(100)					NOT NULL,
		pro_Nombre			NVARCHAR(100)					NOT NULL,
		pro_StockInicial	NVARCHAR(100)					NOT NULL,
		pro_PrecioUnitario	DECIMAL(18,2)					NOT NULL,
		pro_Proveedor		INT,
		pro_Categoria		INT,
		pro_usuCrea			INT,
		pro_FechaCrea		DATETIME						DEFAULT GETDATE(),
		pro_UsuModi			INT,
		pro_FechaModi		DATETIME,
		pro_Estado			BIT								DEFAULT 1

		CONSTRAINT UK_Maqui_tbProductos_pro_Codigo UNIQUE(pro_Codigo),
		CONSTRAINT FK_Maqui_tbProductos_Maqui_tbProveedores_pro_Proveedor FOREIGN KEY (pro_Proveedor) REFERENCES Maqui.tbProveedores(prv_Id),
		CONSTRAINT FK_Maqui_tbProductos_pro_usuCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(pro_usuCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Maqui_tbProductos_pro_UsuModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(pro_UsuModi) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Maqui_tbProductos_pro_Categoria_Maqui_tbCategorias_cat_ID FOREIGN KEY(pro_Categoria) REFERENCES Maqui.tbCategorias (cat_ID)
);

INSERT INTO Maqui.tbProductos
VALUES  ('LBLRM', 'Labial rojo líquido de tinta mate.', '200', 50.00, 1,1,		1, GETDATE(), NULL, NULL, 1),
		('LBGLB', 'Labial gloss con brillantina.', '200', 60.00, 4,1,				1, GETDATE(), NULL, NULL, 1),
		('LBROM', 'Labial rosado de tinta mate.', '200', 70.00, 7,1	,			1, GETDATE(), NULL, NULL, 1),
		('LBNTM', 'Labial nude de tinta mate.', '200', 80.00, 9,1	,			1, GETDATE(), NULL, NULL, 1),
		('LBMTC', 'Labial morado de tinta cremosa.', '200', 45.00, 10,1,			1, GETDATE(), NULL, NULL, 1),
		('PTNNP', 'Paleta The New Nude Palette', '200', 200.00, 15,	2	,		1, GETDATE(), NULL, NULL, 1),
		('PNLEP', 'Paleta Natural Lust Eye Palette', '200',  400.00, 19,	2,	1, GETDATE(), NULL, NULL, 1),
		('PNHPA', 'Paleta Naked Heat Palette', '200',  560.00, 12,	2			,1, GETDATE(), NULL, NULL, 1),
		('PTBPA', 'Paleta The Burgundy Palette', '200',450.00, 11,		2		,1, GETDATE(), NULL, NULL, 1),
		('PTIBP', 'Paleta Tartelette in Bloom Palette', '200',  3400.00, 15,2	,1, GETDATE(), NULL, NULL, 1),
		('RBBBL', 'Rubor Baked Blush', '200', 2300.00, 3,	3					,1, GETDATE(), NULL, NULL, 1),
		('RBMON', 'Rubor Monochromatic', '200', 2350.00, 17,	3				,1, GETDATE(), NULL, NULL, 1),
		('RBFIT', 'Rubor FitMe', '200', 540.00, 18,				3				,1, GETDATE(), NULL, NULL, 1),
		('RBPPB', 'Rubor Pink Peach Bums', '200', 340.00, 20,	3				,1, GETDATE(), NULL, NULL, 1),
		('RBCHE', 'Rubor Cheekers', '200', 2300.00, 4,			3				,1, GETDATE(), NULL, NULL, 1),
		('POLPU', 'Polvo PUR', '200',  450.00, 17,				4				,1, GETDATE(), NULL, NULL, 1),
		('POLFM', 'Polvo FitMe Mate', '200',  340.00, 15,		4				,1, GETDATE(), NULL, NULL, 1),
		('POLHG', 'Polvo Halo Glow', '200', 570.00, 20,			4				,1, GETDATE(), NULL, NULL, 1),
		('POLSF', 'Polvo Soft Flex', '200',  230.00, 20,		4				,1, GETDATE(), NULL, NULL, 1),
		('POLTM', 'Polvo True Match', '200', 657.00, 19,		4				,1, GETDATE(), NULL, NULL, 1),
		('BASSA', 'Base Simply Ageless', '200',120.00, 12,		5				,1, GETDATE(), NULL, NULL, 1),
		('BASLI', 'Base Liquida', '200', 340.00, 15,			5				,1, GETDATE(), NULL, NULL, 1),
		('BASSM', 'Base StayMate', '200', 450.00, 9,			5				,1, GETDATE(), NULL, NULL, 1),
		('BASDM', 'Base Dermacol', '200', 100.00, 8,			5				,1, GETDATE(), NULL, NULL, 1),
		('BASCF', 'Base Clean Fresh', '200', 200.00, 7,			5				,1, GETDATE(), NULL, NULL, 1),
		('LIMAS', 'Limpiador de ácido salicílico.', '200', 1200.00, 7, 6		,	1, GETDATE(), NULL, NULL, 1),
		('EXFLI', 'Exfoliante líquido.', '200', 500.00, 7,				6		,1, GETDATE(), NULL, NULL, 1),
		('CRENO', 'Crema renovación de noche', '200', 1980.00, 12,		6		,1, GETDATE(), NULL, NULL, 1),
		('SEVIC', 'Serúm con vitamina ', '200', 870.00, 5,				6		,1, GETDATE(), NULL, NULL, 1),
		('MABAN', 'Mascarilla de barro del mar.', '200', 560.00, 4,		6		,1, GETDATE(), NULL, NULL, 1),
		('DLIGR', 'Delineador Infallible Grip', '200',  460.00, 14,		7		,1, GETDATE(), NULL, NULL, 1),
		('DLNOB', 'Delineador No Budget', '200', 580.00, 12,			7		,1, GETDATE(), NULL, NULL, 1),
		('DLNYX', 'Delineador NYX Mecánico', '200', 1000.00, 17,		7		,1, GETDATE(), NULL, NULL, 1),
		('DLSRE', 'Delineador Stila resistente al agua.', '200', 450.00, 4,7	,	1, GETDATE(), NULL, NULL, 1),
		('DLCOL', 'Delineador Colorstay', '200', 235.00, 7,				7		,1, GETDATE(), NULL, NULL, 1),
		('RIEXA', 'Rimel Exaggerete', '200', 230.00, 3,					8		,1, GETDATE(), NULL, NULL, 1),
		('RIDUF', 'Rimel Durable ', '200', 450.00, 16,					8		,1, GETDATE(), NULL, NULL, 1),
		('RIMAE', 'Rimel Magnific Eyes', '200', 600.00, 17,				8		,1, GETDATE(), NULL, NULL, 1),
		('RILSM', 'Rimel London Stay Matte', '200', 700.00, 12,			8		,1, GETDATE(), NULL, NULL, 1),
		('RISGL', 'Rimel Stay Gloss', '200',500.00, 2,					8		,1, GETDATE(), NULL, NULL, 1);


--CREATE TABLE Maqui.tbCategoriaProductos(
--		cpr_Id				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
--		cpr_Categoria		INT NOT NULL,
--		cpr_Producto		INT NOT NULL,
		
--		cpr_UsuCrea			INT,
--		cpr_FechaCrea		DATETIME DEFAULT GETDATE(),
--		cpr_usuModi			INT,
--		cpr_FechaModi		DATETIME,
--		cpr_Estado			BIT DEFAULT 1

--		CONSTRAINT FK_Maqui_tbCategoriaProductos_Maqui_tbCategorias_cpr_Categoria	FOREIGN KEY (cpr_Categoria) REFERENCES Maqui.tbCategorias(cat_Id),
--		CONSTRAINT FK_Maqui_tbCategoriaProductos_Maqui_tbProductos_cpr_Producto		FOREIGN KEY (cpr_Producto)	REFERENCES Maqui.tbProductos(pro_Id),
--		CONSTRAINT FK_Maqui_tbCategoriaProductos_cpr_UsuCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(cpr_UsuCrea) REFERENCES Gral.tbUsuarios(usu_ID),
--		CONSTRAINT FK_Maqui_tbCategoriaProductos_cpr_usuModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(cpr_usuModi) REFERENCES Gral.tbUsuarios(usu_ID)
--);

--INSERT INTO Maqui.tbCategoriaProductos
--VALUES  (1,  1, 1, GETDATE(), NULL, NULL,1),
--		(1,  2, 1, GETDATE(), NULL, NULL, 1),
--		(1,  3, 1, GETDATE(), NULL, NULL,1),
--		(1,  4, 1, GETDATE(), NULL, NULL,1),
--		(1,  5, 1, GETDATE(), NULL, NULL,1),
--		(2,  6, 1, GETDATE(), NULL, NULL,1),
--		(2,  7, 1, GETDATE(), NULL, NULL,1),
--		(2,  8, 1, GETDATE(), NULL, NULL,1),
--		(2,  9, 1, GETDATE(), NULL, NULL,1),
--		(2, 10, 1, GETDATE(), NULL, NULL,1),
--		(3, 11, 1, GETDATE(), NULL, NULL,1),
--		(3, 12, 1, GETDATE(), NULL, NULL,1),
--		(3, 13, 1, GETDATE(), NULL, NULL,1),
--		(3, 14, 1, GETDATE(), NULL, NULL,1),
--		(3, 15, 1, GETDATE(), NULL, NULL,1),
--		(4, 16, 1, GETDATE(), NULL, NULL,1),
--		(4, 17, 1, GETDATE(), NULL, NULL,1),
--		(4, 18, 1, GETDATE(), NULL, NULL,1),
--		(4, 19, 1, GETDATE(), NULL, NULL,1),
--		(4, 20, 1, GETDATE(), NULL, NULL,1),
--		(5, 21, 1, GETDATE(), NULL, NULL,1),
--		(5, 22, 1, GETDATE(), NULL, NULL,1),
--		(5, 23, 1, GETDATE(), NULL, NULL,1),
--		(5, 24, 1, GETDATE(), NULL, NULL,1),
--		(5, 25, 1, GETDATE(), NULL, NULL,1),
--		(6, 26, 1, GETDATE(), NULL, NULL,1),
--		(6, 27, 1, GETDATE(), NULL, NULL,1),
--		(6, 28, 1, GETDATE(), NULL, NULL,1),
--		(6, 29, 1, GETDATE(), NULL, NULL,1),
--		(6, 30, 1, GETDATE(), NULL, NULL,1),
--		(7, 31, 1, GETDATE(), NULL, NULL,1),
--		(7, 32, 1, GETDATE(), NULL, NULL,1),
--		(7, 33, 1, GETDATE(), NULL, NULL,1),
--		(7, 34, 1, GETDATE(), NULL, NULL,1),
--		(7, 35, 1, GETDATE(), NULL, NULL,1),
--		(8, 36, 1, GETDATE(), NULL, NULL,1),
--		(8, 37, 1, GETDATE(), NULL, NULL,1),
--		(8, 38, 1, GETDATE(), NULL, NULL,1),
--		(8, 39, 1, GETDATE(), NULL, NULL,1),
--		(8, 40, 1, GETDATE(), NULL, NULL,1);



CREATE TABLE Maqui.tbInventario(
		inv_Id				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		inv_Cantidad		INT NOT NULL,
		inv_Producto		INT NOT NULL,

		inv_UsuCrea			INT,
		inv_FechaCrea		DATETIME DEFAULT GETDATE(),
		inv_usuModi			INT,
		inv_FechaModi		DATETIME,
		inv_Estado			BIT DEFAULT 1

		CONSTRAINT FK_Maqui_tbInventario_Maqui_tbProducto FOREIGN KEY (inv_Producto) REFERENCES Maqui.tbProductos(pro_Id),
		CONSTRAINT FK_Maqui_tbInventario_inv_UsuCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(inv_UsuCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Maqui_tbInventario_inv_usuModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(inv_usuModi) REFERENCES Gral.tbUsuarios(usu_ID)
);

INSERT INTO Maqui.tbInventario
VALUES  (230,  1, 1, GETDATE(), NULL, NULL,1),
		(120,  2, 1, GETDATE(), NULL, NULL,1),
		(320,  3, 1, GETDATE(), NULL, NULL,1),
		(129,  4, 1, GETDATE(), NULL, NULL,1),
		( 78,  5, 1, GETDATE(), NULL, NULL,1),
		(435,  6, 1, GETDATE(), NULL, NULL,1),
		(122,  7, 1, GETDATE(), NULL, NULL,1),
		(133,  8, 1, GETDATE(), NULL, NULL,1),
		(181,  9, 1, GETDATE(), NULL, NULL,1),
		(174, 10, 1, GETDATE(), NULL, NULL,1),
		(165, 11, 1, GETDATE(), NULL, NULL,1),
		( 29, 12, 1, GETDATE(), NULL, NULL,1),
		(163, 13, 1, GETDATE(), NULL, NULL,1),
		(200, 14, 1, GETDATE(), NULL, NULL,1),
		(203, 15, 1, GETDATE(), NULL, NULL,1),
		(328, 16, 1, GETDATE(), NULL, NULL,1),
		(139, 17, 1, GETDATE(), NULL, NULL,1),
		(100, 18, 1, GETDATE(), NULL, NULL,1),
		(107, 19, 1, GETDATE(), NULL, NULL,1),
		(104, 20, 1, GETDATE(), NULL, NULL,1),
		( 10, 21, 1, GETDATE(), NULL, NULL,1),
		(109, 22, 1, GETDATE(), NULL, NULL,1),
		(205, 23, 1, GETDATE(), NULL, NULL,1),
		(258, 24, 1, GETDATE(), NULL, NULL,1),
		(176, 25, 1, GETDATE(), NULL, NULL,1),
		(189, 26, 1, GETDATE(), NULL, NULL,1),
		(293, 27, 1, GETDATE(), NULL, NULL,1),
		(301, 28, 1, GETDATE(), NULL, NULL,1),
		(230, 29, 1, GETDATE(), NULL, NULL,1),
		(231, 30, 1, GETDATE(), NULL, NULL,1),
		(439, 31, 1, GETDATE(), NULL, NULL,1),
		(126, 32, 1, GETDATE(), NULL, NULL,1),
		(132, 33, 1, GETDATE(), NULL, NULL,1),
		(231, 34, 1, GETDATE(), NULL, NULL,1),
		(161, 35, 1, GETDATE(), NULL, NULL,1),
		(182, 36, 1, GETDATE(), NULL, NULL,1),
		(172, 37, 1, GETDATE(), NULL, NULL,1),
		(281, 38, 1, GETDATE(), NULL, NULL,1),
		(190, 39, 1, GETDATE(), NULL, NULL,1),
		(192, 40, 1, GETDATE(), NULL, NULL,1);



CREATE TABLE Maqui.tbVentas(
		ven_Id				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		ven_Cliente			INT NOT NULL,
		ven_Empleado		INT NOT NULL,
		ven_Fecha			DATETIME,
		ven_Sucursal		INT NOT NULL,
		ven_MetodoPago		INT NOT NULL,


		ven_UsuCrea			INT,
		ven_FechaCrea		DATETIME DEFAULT GETDATE(),
		ven_UsuModi			INT,
		ven_FechaModi		DATETIME,
		ven_Estado			BIT DEFAULT 1

		CONSTRAINT FK_Maqui_tbVentas_Gral_tbClientes_ven_Cliente		FOREIGN KEY (ven_Cliente)		REFERENCES Gral.tbClientes(cli_Id),
		CONSTRAINT FK_Maqui_tbVentas_Gral_tbClientes_ven_Empleado		FOREIGN KEY (ven_Empleado)		REFERENCES Gral.tbEmpleados(emp_Id),
		CONSTRAINT FK_Maqui_tbVentas_Maqui_tbSucursales_ven_Sucursal	FOREIGN KEY (ven_Sucursal)		REFERENCES  Gral.tbSucursales (suc_Id),
		CONSTRAINT FK_Maqui_tbVentas_Maqui_tbMetodoPago_ven_MetodoPago	FOREIGN KEY (ven_MetodoPago)	REFERENCES Maqui.tbMetodoPago (met_Id),
		CONSTRAINT FK_Maqui_tbVentas_ven_UsuCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(ven_UsuCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Maqui_tbVentas_ven_UsuModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(ven_UsuModi) REFERENCES Gral.tbUsuarios(usu_ID)
);

INSERT INTO Maqui.tbVentas
VALUES  (12, 10, '2023-09-10',  2, 1, 1, GETDATE(), NULL, NULL, 1),
		(11, 02, '2023-09-10', 11, 3, 1, GETDATE(), NULL, NULL, 1),
		(02, 08, '2023-09-10',  3, 2, 1, GETDATE(), NULL, NULL, 1),
		(15, 19, '2023-09-10', 20, 4, 1, GETDATE(), NULL, NULL, 1),
		(20, 14, '2023-09-10', 19, 5, 1, GETDATE(), NULL, NULL, 1),
		(19,  1, '2023-09-10', 18, 6, 1, GETDATE(), NULL, NULL, 1),
		(15,  2, '2023-09-10', 15, 1, 1, GETDATE(), NULL, NULL, 1),
		(05, 04, '2023-09-10', 03, 2, 1, GETDATE(), NULL, NULL, 1),
		(03, 09, '2023-09-10', 04, 3, 1, GETDATE(), NULL, NULL, 1),
		(02, 01, '2023-09-10', 09, 4, 1, GETDATE(), NULL, NULL, 1);




CREATE TABLE Maqui.tbVentasDetalle(
		vde_Id			INT IDENTITY(1,1)	NOT NULL PRIMARY KEY,
		vde_VentaId		INT					NOT NULL,
		vde_Producto	INT					NOT NULL,
		vde_Cantidad	INT					NOT NULL,
		
		vde_UsuCrea		INT,
		vde_FechaCrea	DATETIME			DEFAULT GETDATE(),
		vde_UsuModi		INT,
		vde_FechaModi	DATETIME,
		vde_Estado		BIT					DEFAULT 1

		CONSTRAINT FK_Maqui_tbVentas_MaquiDetalles_tbVentasDetalle_VD_VentaId	FOREIGN KEY (vde_VentaId)		REFERENCES Maqui.tbVentas(ven_Id),
		CONSTRAINT FK_Maqui_tbVentasDetalles_tbMaqui_Produtos_VD_Producto		FOREIGN KEY (vde_Producto)		REFERENCES Maqui.tbProductos(pro_Id),
		CONSTRAINT FK_Maqui_tbVentasDetalle_vde_UsuCrea_Gral_tbUsuarios_usu_ID FOREIGN KEY(vde_UsuCrea) REFERENCES Gral.tbUsuarios(usu_ID),
		CONSTRAINT FK_Maqui_tbVentasDetalle_vde_UsuModi_Gral_tbUsuarios_usu_ID FOREIGN KEY(vde_UsuModi) REFERENCES Gral.tbUsuarios(usu_ID)
);
GO

INSERT INTO Maqui.tbVentasDetalle
VALUES  (1,  03,  4, 1, GETDATE(), NULL, NULL, 1),
		(1,  23,  8, 1, GETDATE(), NULL, NULL, 1),
		(1,  21,  2, 1, GETDATE(), NULL, NULL, 1),
		(2,  34,  3, 1, GETDATE(), NULL, NULL, 1),
		(2,  09,  5, 1, GETDATE(), NULL, NULL, 1),
		(2,  32,  1, 1, GETDATE(), NULL, NULL, 1),
		(3,  09,  4, 1, GETDATE(), NULL, NULL, 1),
		(3,  19, 4, 1, GETDATE(), NULL, NULL, 1),
		(3,  15,  4, 1, GETDATE(), NULL, NULL, 1),
		(4,  32,  5, 1, GETDATE(), NULL, NULL, 1),
		(4,  11,  2, 1, GETDATE(), NULL, NULL, 1),
		(4,  06,  3, 1, GETDATE(), NULL, NULL, 1),
		(5,  08,  4, 1, GETDATE(), NULL, NULL, 1),
	    (5,  12,  6, 1, GETDATE(), NULL, NULL, 1),
		(5,  13,  7, 1, GETDATE(), NULL, NULL, 1),
		(6,  40,  3, 1, GETDATE(), NULL, NULL, 1),
		(6,  33, 4, 1, GETDATE(), NULL, NULL, 1),
		(6,  34,  2, 1, GETDATE(), NULL, NULL, 1),
		(7,  21,  1, 1, GETDATE(), NULL, NULL, 1),
		(7,  36, 6, 1, GETDATE(), NULL, NULL, 1),
		(7,  21,  9, 1, GETDATE(), NULL, NULL, 1),
		(8,  11,  3, 1, GETDATE(), NULL, NULL, 1),
		(8,  30, 8, 1, GETDATE(), NULL, NULL, 1),
		(8,  29,  4, 1, GETDATE(), NULL, NULL, 1),
		(9,  21,  8, 1, GETDATE(), NULL, NULL, 1),
		(9,  24,  6, 1, GETDATE(), NULL, NULL, 1),
        (9,  29,  3, 1, GETDATE(), NULL, NULL, 1),
		(10, 37,  9, 1, GETDATE(), NULL, NULL, 1),
		(10, 23,  9, 1, GETDATE(), NULL, NULL, 1),
		(10, 12,  9, 1, GETDATE(), NULL, NULL, 1);
GO


/************************UDPS VISTA************************/


CREATE OR ALTER VIEW Vw_Gral_tbClientes_LIST
AS

SELECT cli_ID, 
	   cli_Nombre + ' ' + cli_Apellido AS cli_Nombre, 
	   cli_DNI, 
	   cli_FechaNacimiento, 
	   CASE cli_Sexo
	   WHEN 'F' THEN 'Femenino'
	   WHEN 'M' THEN 'Masculino'
	   ELSE 'Otro' END AS cli_sexo, 
	   cli_Telefono, 
	   cli_Municipio = mun_Descripcion, 
	   cli_EstadoCivil = est_Descripcion
	   FROM Gral.tbClientes T1
	   INNER JOIN Gral.tbMunicipios T2
	   ON T1.cli_Municipio = T2.mun_ID
	   INNER JOIN Gral.tbEstadosCiviles T3
	   ON T1.cli_EstadoCivil = T3.est_ID
	   WHERE cli_Estado = 1;

GO





CREATE OR ALTER VIEW Vw_Gral_tbEmpleados_LIST
AS 

SELECT emp_ID, 
	   emp_Nombre + ' ' + emp_Apellido AS emp_Nombre, 
	   emp_DNI, 
	   emp_FechaNacimiento, 
	   CASE emp_Sexo
	   WHEN 'F' THEN 'Femenino'
	   WHEN 'M' THEN 'Masculino'
	   ELSE 'Otro' END AS emp_Sexo, 
	   emp_Telefono, 
	   emp_Municipio = mun_Descripcion, 
	   emp_Correo, 
	   emp_EstadoCivil = est_Descripcion, 
	   emp_Sucursal = suc_Descripcion
	   FROM Gral.tbEmpleados T1
	   INNER JOIN Gral.tbMunicipios T2
	   ON T1.emp_Municipio = T2.mun_ID
	   INNER JOIN Gral.tbEstadosCiviles T3
	   ON T1.emp_EstadoCivil = T3.est_ID
	   INNER JOIN Gral.tbSucursales T4
	   ON T1.emp_Sucursal = T4.suc_Id
	   WHERE emp_Estado = 1;

GO





CREATE OR ALTER VIEW Vw_Gral_tbDepartamentos_LIST
AS 

SELECT dep_ID, 
	   dep_Descripcion
	   FROM Gral.tbDepartamentos


GO



CREATE OR ALTER VIEW Vw_Gral_tbMunicipios_LIST
AS 

SELECT mun_ID, 
	   mun_depID = dep_Descripcion, 
	   mun_Descripcion 
	   FROM Gral.tbMunicipios T1
	   INNER JOIN Gral.tbDepartamentos T2
	   ON T1.mun_depID = T2.dep_ID

GO




CREATE OR ALTER VIEW Vw_Gral_tbSucursales_LIST
AS 

SELECT suc_Id, 
	   suc_Descripcion, 
	   suc_Municipio = mun_Descripcion
	   FROM Gral.tbSucursales T1
	   INNER JOIN Gral.tbMunicipios T2
	   ON T1.suc_Municipio = T2.mun_ID
	   WHERE suc_Estado = 1

GO




CREATE OR ALTER VIEW Vw_Gral_tbEstadosCiviles_LIST
AS 

SELECT est_ID, 
	   est_Descripcion
	   FROM Gral.tbEstadosCiviles


GO

CREATE OR ALTER VIEW Vw_Gral_tbUsuarios_LIST
AS

SELECT
		usu.usu_ID,
		usu.usu_Usuario,
		emple.emp_Nombre + ' ' + emple.emp_Apellido AS 'Empleado'
		FROM Gral.tbUsuarios usu INNER JOIN Gral.tbEmpleados emple 
		ON	 usu.usu_empID = emple.emp_ID
		WHERE usu.usu_Estado = 1


GO



CREATE OR ALTER VIEW Vw_Maqui_tbCategorias_LIST
AS 

SELECT cat_Id, 
	   cat_Descripcion
	   FROM Maqui.tbCategorias
	   WHERE cat_Estado = 1;


GO





CREATE OR ALTER VIEW Vw_Maqui_tbInventario_LIST
AS 

SELECT  inv_Id,
		produc.pro_Nombre,	
	    inv_Cantidad
	    FROM Maqui.tbInventario inven INNER JOIN Maqui.tbProductos produc
		ON	 inven.inv_Producto = produc.pro_Id
		WHERE inven.inv_Estado = 1

GO





CREATE OR ALTER VIEW Vw_Maqui_tbMetodoPago_LIST
AS 

SELECT met_Id, 
	   met_Descripcion
	   FROM Maqui.tbMetodoPago
	   WHERE met_Estado = 1;

GO





CREATE OR ALTER VIEW Vw_Maqui_tbProductos_LIST
AS 

SELECT pro_Codigo, 
	   pro_Nombre, 
	   pro_StockInicial, 
	   pro_PrecioUnitario,
	   cate.cat_Descripcion,
	   prv_NombreCompañia,
	   pro_Proveedor = prv_NombreContacto
	   FROM Maqui.tbProductos T1
	   INNER JOIN Maqui.tbProveedores T2
	   ON T1.pro_Proveedor = T2.prv_ID
	   INNER JOIN Maqui.tbCategorias cate
	   ON T1.pro_Categoria = cate.cat_Id
	   WHERE pro_Estado = 1;

GO





CREATE OR ALTER VIEW Vw_Maqui_tbProveedores_LIST
AS

SELECT prv_NombreCompañia, 
	   prv_NombreContacto, 
	   prv_TelefonoContacto, 
	   prv_Municipio = mun_Descripcion, 
	   prv_DireccionEmpresa,
	   prv_DireccionContacto,
	   prv_SexoContacto
	   FROM Maqui.tbProveedores T1
	   INNER JOIN Gral.tbMunicipios T2
	   ON T1.prv_Municipio = T2.mun_Id
	   WHERE prv_Estado = 1;


GO






CREATE OR ALTER VIEW Vw_Maqui_tbVentas_LIST
AS 

SELECT ven_Id, 
	   ven_Cliente = cli_Nombre + ' ' + cli_Apellido, 
	   ven_Empleado = emp_Nombre + ' ' + emp_Apellido,
	   ven_Fecha, 
	   suc_Descripcion, 
	   met_Descripcion
	   FROM Maqui.tbVentas T1
	   INNER JOIN Gral.tbSucursales T2
	   ON T1.ven_Sucursal = T2.suc_Id
	   INNER JOIN Maqui.tbMetodoPago T3
	   ON T1.ven_MetodoPago = T3.met_Id
	   INNER JOIN Gral.tbClientes T4
	   ON T1.ven_Cliente = T4.cli_ID
	   INNER JOIN Gral.tbEmpleados T5
	   ON T1.ven_Empleado = T5.emp_ID
	   WHERE ven_Estado = 1;

GO





CREATE OR ALTER VIEW Vw_Maqui_tbVentasDetalle_LIST
AS 

SELECT vde_Id, 
	   vde_VentaId,
	   vde_Producto = pro_Nombre,
	   vde_Cantidad 
	   FROM Maqui.tbVentasDetalle T1
	   INNER JOIN Maqui.tbVentas T2
	   ON T1.vde_Id = T2.ven_Id
	   INNER JOIN Maqui.tbProductos T3
	   ON T1.vde_Producto = T3.pro_Id
	   WHERE vde_Estado = 1;
GO




/************************UDPS INSERT************************/

CREATE OR ALTER PROC UDP_Gral_tbEstadosCiviles_CREAR(
@est_Descripcion NVARCHAR(100),
@est_UsuCrea INT)
AS BEGIN

DECLARE @est_UsuModi INT = NULL;
DECLARE @est_FechaCrea DATETIME = GETDATE();
DECLARE @est_FechaModi DATETIME = NULL;

INSERT INTO Gral.tbEstadosCiviles
VALUES  (@est_Descripcion,
		 @est_UsuCrea,
		 @est_FechaCrea,
		 @est_UsuModi,
		 @est_FechaModi
		);
END
GO


CREATE OR ALTER PROC UDP_Gral_tbDepartamentos_CREAR(
@dep_Descripcion NVARCHAR(100),
@dep_UsuCrea INT)
AS BEGIN

DECLARE @dep_UsuModi INT = NULL;
DECLARE @dep_FechaCrea DATETIME = GETDATE();
DECLARE @dep_FechaModi DATETIME = NULL;

INSERT INTO Gral.tbDepartamentos
VALUES  (@dep_Descripcion,
		 @dep_UsuCrea,
		 @dep_FechaCrea,
		 @dep_UsuModi,
		 @dep_FechaModi
		);
END
GO

CREATE OR ALTER PROC UDP_Gral_tbSucursales_CREAR
	@suc_Descripcion	NVARCHAR(100),
	@suc_Municipio		INT, 
	@suc_UsuCrea		INT 	
AS
BEGIN
	DECLARE @suc_FechaCrea  DATETIME = GETDATE()
	DECLARE @suc_Estado		BIT = 1

		INSERT INTO Gral.tbSucursales
			(suc_Descripcion, suc_Municipio, suc_UsuCrea, suc_FechaCrea, suc_usuModi, 
			 suc_FechaModi, suc_Estado)
		VALUES
			(@suc_Descripcion, @suc_Municipio, @suc_UsuCrea, @suc_FechaCrea, NULL, 
			 NULL, @suc_Estado)
END
GO


CREATE OR ALTER PROC UDP_Gral_tbMunicipios_CREAR(
@mun_Descripcion NVARCHAR(100),
@mun_DepId INT,
@mun_UsuCrea INT)
AS BEGIN

DECLARE @mun_UsuModi INT = NULL;
DECLARE @mun_FechaCrea DATETIME = GETDATE();
DECLARE @mun_FechaModi DATETIME = NULL;

INSERT INTO Gral.tbMunicipios
VALUES  (@mun_Descripcion,
		 @mun_DepId,
		 @mun_UsuCrea,
		 @mun_FechaCrea,
		 @mun_UsuModi,
		 @mun_FechaModi
		);
END
GO


CREATE OR ALTER PROC UDP_Gral_tbEmpleados_CREAR(
@emp_Nombre				NVARCHAR(250),		
@emp_Apellido			NVARCHAR(250),		
@emp_DNI				VARCHAR(13)	,		
@emp_FechaNacimiento	DATE	,			
@emp_Sexo				CHAR(1)	,			
@emp_Municipio			INT		,	
@emp_Telefono			NVARCHAR(100),
@emp_Correo				NVARCHAR(100),
@emp_EstadoCivil		INT	,			
@emp_Sucursal			INT,
@emp_UsuarioCrea		INT	)
AS BEGIN

DECLARE @emp_UsuModi    INT = NULL;
DECLARE @emp_FechaCrea  DATETIME = GETDATE();
DECLARE @emp_Estado     BIT = 1;
DECLARE @emp_FechaModi  DATETIME = NULL;

INSERT INTO Gral.tbEmpleados
VALUES  (@emp_Nombre,				
		 @emp_Apellido,			
		 @emp_DNI	,			
		 @emp_FechaNacimiento,	
		 @emp_Sexo		,	
		 @emp_Telefono	,
		 @emp_Municipio	,		
		 @emp_Correo		,
		 @emp_EstadoCivil	,	
		 @emp_Sucursal,
		 @emp_UsuarioCrea,	
		 @emp_FechaCrea,
		 @emp_UsuModi,  
		 @emp_FechaModi,
		 @emp_Estado)
END
GO




CREATE OR ALTER PROC UDP_Gral_tbClientes_CREAR(
@cli_Nombre				NVARCHAR(250),		
@cli_Apellido			NVARCHAR(250),		
@cli_DNI				VARCHAR(13)	,		
@cli_FechaNacimiento	DATE	,			
@cli_Sexo				CHAR(1)	,		
@cli_Telefono			NVARCHAR(100),
@cli_Municipio			INT		,			
@cli_EstadoCivil		INT	,				
@cli_UsuarioCrea		INT	)
AS BEGIN

DECLARE @cli_UsuModi    INT = NULL;
DECLARE @cli_FechaCrea  DATETIME = GETDATE();
DECLARE @cli_FechaModi  DATETIME = NULL;
DECLARE @cli_Estado     BIT = 1;

INSERT INTO Gral.tbClientes
VALUES  (@cli_Nombre,				
		 @cli_Apellido,			
		 @cli_DNI	,			
		 @cli_FechaNacimiento,	
		 @cli_Sexo		,
		 @cli_Telefono,
		 @cli_Municipio	,		
		 @cli_EstadoCivil	,	
		 @cli_UsuarioCrea,		
		 @cli_FechaCrea,
		 @cli_UsuModi,  
		 @cli_FechaModi,
		 @cli_Estado)
END
GO




CREATE OR ALTER PROC UDP_Gral_tbUsuarios_CREAR(
@usu_Usuario			NVARCHAR(100)		,
@usu_empID			INT					,
@usu_Clave			NVARCHAR(MAX)		,
@usu_EsAdmin			BIT					,
@usu_UsuarioCrea		INT					)
AS BEGIN

DECLARE @usu_UsuModi    INT = NULL;
DECLARE @usu_FechaCrea  DATETIME = GETDATE();
DECLARE @usu_FechaModi  DATETIME = NULL;
DECLARE @usu_Estado     BIT = 1;

INSERT INTO Gral.tbUsuarios
VALUES  (@usu_Usuario,				
		 @usu_empID,			
		 @usu_Clave	,	
		 @usu_EsAdmin,
		 @usu_UsuarioCrea,		
		 @usu_FechaCrea,
		 @usu_UsuModi,  
		 @usu_FechaModi,
		 @usu_Estado)
END
GO

--CREATE OR ALTER PROC UDP_Maqui_tbCategoriasProducto_CREAR
--	@cpr_Categoria		INT,
--	@cpr_Producto		INT, 
--	@cpr_UsuCrea		INT
--AS
--BEGIN

--DECLARE @cpr_FechaCrea DATETIME = GETDATE()
--DECLARE @cpr_Estado	   BIT = 1

--INSERT INTO Maqui.tbCategoriaProductos
--		(cpr_Categoria, cpr_Producto, cpr_UsuCrea, cpr_FechaCrea, cpr_usuModi, cpr_FechaModi, cpr_Estado)
--VALUES	(@cpr_Categoria, @cpr_Producto,@cpr_UsuCrea,@cpr_FechaCrea, NULL,		NULL,		  @cpr_Estado)

--END
--GO

CREATE OR ALTER PROC UDP_Maqui_tbMetodoPago_CREAR
	@met_Descripcion	NVARCHAR(100), 
	@met_UsuCrea		INT
AS
BEGIN
	DECLARE @met_FechaCrea	DATETIME = GETDATE()
	DECLARE @met_Estado		BIT		 = 1
	
	INSERT INTO Maqui.tbMetodoPago
			(met_Descripcion, met_UsuCrea, met_FechaCrea, met_usuModi, met_FechaModi, met_Estado)
	VALUES	(@met_Descripcion,@met_UsuCrea,@met_FechaCrea, NULL,		NULL,		 @met_Estado)
END
GO

CREATE OR ALTER PROC UDP_Maqui_tbCategorias_CREAR
	@cat_Descripcion	NVARCHAR(100), 
	@cat_UsuCrea		INT
AS
BEGIN
	DECLARE @cat_FechaCrea DATETIME = GETDATE()
	DECLARE @cat_Estado	   BIT =		1

	INSERT INTO Maqui.tbCategorias
			(cat_Descripcion, cat_UsuCrea, cat_FechaCrea, cat_UsuModi, cat_FechaModi, cat_Estado)
	VALUES	(@cat_Descripcion,@cat_UsuCrea,@cat_FechaCrea,  NULL,		NULL,		  @cat_Estado)
END
GO

CREATE OR ALTER PROC UDP_Maqui_tbInventario_CREAR
	@inv_Cantidad	INT,
	@inv_Producto	INT, 
	@inv_UsuCrea	INT
AS
BEGIN
		DECLARE @inv_FechaCrea  DATETIME = GETDATE()
		DECLARE @inv_Estado		BIT		 =	1

		INSERT INTO Maqui.tbInventario
				(inv_Cantidad, inv_Producto, inv_UsuCrea, inv_FechaCrea, inv_usuModi, inv_FechaModi, inv_Estado)
		VALUES	(@inv_Cantidad,@inv_Producto,@inv_UsuCrea, @inv_FechaCrea, NULL,       NULL,		 @inv_Estado)

END
GO

CREATE OR ALTER PROC UDP_Maqui_tbProductos_CREAR
	@pro_Codigo			NVARCHAR(100),
	@pro_Nombre			NVARCHAR(100), 
	@pro_StockInicial	NVARCHAR(100), 
	@pro_PrecioUnitario	DECIMAL(18,2), 
	@pro_Proveedor		INT, 
	@pro_usuCrea		INT,
	@pro_Categoria		INT
AS
BEGIN
	DECLARE @pro_FechaCrea  DATETIME = GETDATE()
	DECLARE @pro_Estado		BIT		 = 1

	INSERT INTO Maqui.tbProductos
			(pro_Codigo, pro_Nombre, pro_StockInicial, pro_PrecioUnitario, pro_Proveedor, pro_Categoria, pro_usuCrea, 
			 pro_FechaCrea, pro_UsuModi, pro_FechaModi, pro_Estado)

	VALUES  (@pro_Codigo, @pro_Nombre, @pro_StockInicial, @pro_PrecioUnitario, @pro_Proveedor, @pro_Categoria, @pro_usuCrea,
			 @pro_FechaCrea, NULL, NULL, @pro_Estado)

END
GO

CREATE OR ALTER PROC UDP_Maqui_tbProveedores_CREAR
	@prv_NombreCompañia		NVARCHAR(250),
	@prv_NombreContacto		NVARCHAR(250), 
	@prv_TelefonoContacto   NVARCHAR(100), 
	@prv_Municipio			INT, 
	@prv_DireccionEmpresa	NVARCHAR(200), 
	@prv_DireccionContacto	NVARCHAR(200),
	@prv_SexoContacto		CHAR(1),
	@prv_UsuarioCrea		INT 
AS
BEGIN
		DECLARE @prv_FechaCrea DATETIME = GETDATE() 
		DECLARE @prv_Estado	   BIT =	1	

		INSERT INTO Maqui.tbProveedores
				(prv_NombreCompañia, prv_NombreContacto, prv_TelefonoContacto, prv_Municipio, 
				 prv_DireccionEmpresa, prv_DireccionContacto, prv_SexoContacto, prv_UsuarioCrea, prv_FechaCrea, prv_UsuarioModi, 
				 prv_FechaModi, prv_Estado)

		VALUES	(@prv_NombreCompañia,@prv_NombreContacto, @prv_TelefonoContacto, @prv_Municipio,
				 @prv_DireccionEmpresa, @prv_DireccionContacto, @prv_SexoContacto, @prv_UsuarioCrea, @prv_FechaCrea, NULL,
				 NULL, @prv_Estado)

END
GO

CREATE OR ALTER PROC UDP_Maqui_tbVentas_CREAR
	@ven_Cliente		INT, 
	@ven_Empleado		INT, 
	@ven_Fecha			DATETIME, 
	@ven_Sucursal		INT, 
	@ven_MetodoPago		INT, 
	@ven_UsuCrea		INT
AS
BEGIN
	DECLARE @ven_FechaCrea  DATETIME = GETDATE()
	DECLARE @ven_Estado		BIT		 = 1

	INSERT INTO Maqui.tbVentas
			(ven_Cliente, ven_Empleado, ven_Fecha, ven_Sucursal, ven_MetodoPago, ven_UsuCrea, 
			 ven_FechaCrea, ven_UsuModi, ven_FechaModi, ven_Estado)

	VALUES	 (@ven_Cliente,@ven_Empleado,@ven_Fecha,@ven_Sucursal,@ven_MetodoPago, @ven_UsuCrea,
			  @ven_FechaCrea, NULL,		  NULL,          @ven_Estado)

END
GO

CREATE OR ALTER PROC UDP_Maqui_tbVentasDetalle_CREAR
	@vde_VentaId			INT, 
	@vde_Producto			INT,
	@vde_Cantidad			INT, 
	@vde_UsuCrea			INT 
AS
BEGIN
		DECLARE @vde_FechaCrea DATETIME = GETDATE() 
		DECLARE @vde_Estado    BIT		= 1

		INSERT INTO Maqui.tbVentasDetalle
				(vde_VentaId, vde_Producto, vde_Cantidad, vde_UsuCrea, vde_FechaCrea, 
				 vde_UsuModi, vde_FechaModi, vde_Estado)

		VALUES	(@vde_VentaId, @vde_Producto, @vde_Cantidad,@vde_UsuCrea,@vde_FechaCrea,
				 NULL,         NULL,		@vde_Estado)
END
GO