CREATE DATABASE TiendaMaquillaje
USE TiendaMaquillaje

--//************************ TABLAS GENERALES ************************--//
GO
CREATE SCHEMA Gral
GO

CREATE TABLE Gral.EstadoCivil(
		est_ID				INT IDENTITY(1,1),
		est_Descripcion		NVARCHAR(250)			NOT NULL,
		est_UsuarioCrea		INT					NOT NULL,
		est_FechaCrea		DATETIME			NOT NULL,
		est_UsuarioModi		INT,
		est_FechaModi		DATETIME

		CONSTRAINT PK_Gral_EstadoCivil_est_ID PRIMARY KEY (est_ID)
);

CREATE TABLE Gral.Departamentos(
		dep_ID			INT IDENTITY(1,1),
		dep_Descripcion	NVARCHAR(250)			NOT NULL,
		dep_UsuarioCrea		INT					NOT NULL,
		dep_FechaCrea		DATETIME			NOT NULL,
		dep_UsuarioModi		INT,
		dep_FechaModi		DATETIME

		CONSTRAINT PK_Gral_Departamentos_dep_ID PRIMARY KEY (dep_ID)
);

CREATE TABLE Gral.Municipios(
		mun_ID			INT IDENTITY(1,1),
		mun_depID		INT						NOT NULL,
		mun_Descripcion	NVARCHAR(250)			NOT NULL,
		mun_UsuarioCrea		INT					NOT NULL,
		mun_FechaCrea		DATETIME			NOT NULL,
		mun_UsuarioModi		INT,
		mun_FechaModi		DATETIME

		CONSTRAINT PK_Gral_Municipios_mun_ID PRIMARY KEY (mun_ID)
		CONSTRAINT FK_Gral_Municipios_mun_depID_Gral_Departamentos_dep_ID	FOREIGN KEY (mun_depID) REFERENCES Gral.Departamentos (dep_ID)
);

CREATE TABLE Gral.Empleados(
		emp_ID				INT IDENTITY(1,1),
		emp_Nombre			NVARCHAR(250)		NOT NULL,
		emp_Apellido		NVARCHAR(250)		NOT NULL,
		emp_DNI				VARCHAR(13)			NOT NULL,
		emp_FechaNacimiento DATE				NOT NULL,
		emp_Sexo			CHAR(1)				NOT NULL,
		emp_Municipio		INT					NOT NULL,
		emp_EstadoCivil		INT					NOT NULL,
		emp_UsuarioCrea		INT					NOT NULL,
		emp_FechaCrea		DATETIME			NOT NULL,
		emp_UsuarioModi		INT,
		emp_FechaModi		DATETIME,
		emp_Estado			BIT					NOT NULL

		CONSTRAINT PK_Gral_Empleados_emp_ID			PRIMARY KEY (emp_ID),
		CONSTRAINT UQ_Gral_Empleados_emp_DNI		UNIQUE		(emp_DNI),
		CONSTRAINT CK_Gral_Empleados_emp_Sexo		CHECK		(emp_Sexo IN ('F', 'M')),
		CONSTRAINT FK_Gral_Empleados_emp_Municipio_Gral_Municipios_mun_ID		FOREIGN KEY (emp_Municipio)		REFERENCES Gral.Municipios  (mun_ID),
		CONSTRAINT FK_Gral_Empleados_emp_EstadoCivil_Gral_EstadoCivil_est_ID	FOREIGN KEY (emp_EstadoCivil)	REFERENCES Gral.EstadoCivil (est_ID)
);

CREATE TABLE Gral.Clientes(

		cli_ID				INT IDENTITY(1,1),
		cli_Nombre			NVARCHAR(250)		NOT NULL,
		cli_Apellido		NVARCHAR(250)		NOT NULL,
		cli_DNI				VARCHAR(13)			NOT NULL,
		cli_FechaNacimiento DATE				NOT NULL,
		cli_Sexo			CHAR(1)				NOT NULL,
		cli_Municipio		INT					NOT NULL,
		cli_EstadoCivil		INT					NOT NULL,
		cli_UsuarioCrea		INT					NOT NULL,
		cli_FechaCrea		DATETIME			NOT NULL,
		cli_UsuarioModi		INT,
		cli_FechaModi		DATETIME,
		cli_Estado			BIT					NOT NULL

		CONSTRAINT PK_Gral_Clientes_cli_ID			PRIMARY KEY (cli_ID),
		CONSTRAINT UQ_Gral_Clientes_cli_DNI			UNIQUE		(cli_DNI),
		CONSTRAINT CK_Gral_Clientes_cli_Sexo		CHECK		(cli_Sexo IN ('F', 'M')),
		CONSTRAINT FK_Gral_Clientes_cli_Municipio_Gral_Municipios_mun_ID	FOREIGN KEY (cli_Municipio)	    REFERENCES Gral.Municipios  (mun_ID),
		CONSTRAINT FK_Gral_Clientes_cli_EstadoCivil_Gral_EstadoCivil_est_ID	FOREIGN KEY (cli_EstadoCivil)	REFERENCES Gral.EstadoCivil (est_ID)
);

CREATE TABLE Gral.Usuarios(
		usu_ID				INT IDENTITY(1,1),
		usu_Usuario			NVARCHAR(100)		NOT NULL,
		usu_empID			INT					NOT NULL,
		usu_Clave			NVARCHAR(MAX)		NOT NULL,
		usu_EsAdmin			BIT					NOT NULL,
		usu_UsuarioCrea		INT					NOT NULL,
		usu_FechaCrea		DATETIME			NOT NULL,
		usu_UsuarioModi		INT,
		usu_FechaModi		DATETIME,
		usu_Estado			BIT					NOT NULL

		CONSTRAINT	PK_Gral_Usuarios_usu_ID			PRIMARY KEY (usu_ID),
		CONSTRAINT	UQ_Gral_Usuarios_usu_Usuario	UNIQUE (usu_Usuario),
		CONSTRAINT	FK_Gral_Usuarios_usu_empID_Gral_Empleados_emp_ID	FOREIGN KEY (usu_empID) REFERENCES Gral.Empleados (emp_ID)

)
