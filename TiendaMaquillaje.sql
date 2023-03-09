
CREATE DATABASE TiendaMaquillaje
GO
USE TiendaMaquillaje

--//************************ TABLAS GENERALES ************************--//
GO
CREATE SCHEMA Gral
GO

CREATE TABLE Gral.tbEstadoCivil(
		est_ID				INT IDENTITY(1,1) PRIMARY KEY,
		est_Descripcion		NVARCHAR(250)			NOT NULL,
		est_UsuarioCrea		INT						NOT NULL,
		est_FechaCrea		DATETIME				DEFAULT GETDATE(),
		est_UsuarioModi		INT,
		est_FechaModi		DATETIME

);

-------------------------------------------------** INSERTS DE ESTADOS CIVILES **--------------------------------------------------------------------------
INSERT INTO Gral.tbEstadoCivil (est_Descripcion, est_UsuarioCrea)
VALUES							('Soltero(a)',		1),
								('Casado(a)',		1),
								('Viudo(a)',		1),
								('Divorciado(a)',	1),
								('Unión Libre',		1)


CREATE TABLE Gral.tbDepartamentos(
		dep_ID				INT IDENTITY(1,1) PRIMARY KEY,
		dep_Descripcion		NVARCHAR(250)			NOT NULL,
		dep_UsuarioCrea		INT						NOT NULL,
		dep_FechaCrea		DATETIME				DEFAULT GETDATE(),
		dep_UsuarioModi		INT,
		dep_FechaModi		DATETIME

);

-------------------------------------------------** INSERTS DE DEPARTAMENTOS **---------------------------------------------------------------------
INSERT INTO Gral.tbDepartamentos(dep_Descripcion, dep_UsuarioCrea)
VALUES							('Atlántida',			1),
								('Colón',				1),
								('Comayagua',			1),
								('Copán',				1),
								('Choluteca',			1),
								('El Paraíso',			1),

								('Francisco Morazán',	1),
								('Gracias a Dios',		1),
								('Intibucá',			1),
								('Islas de la Bahía',	1)





CREATE TABLE Gral.tbMunicipios(
		mun_ID				INT IDENTITY(1,1) PRIMARY KEY,
		mun_depID			INT						NOT NULL,
		mun_Descripcion		NVARCHAR(250)			NOT NULL,
		mun_UsuarioCrea		INT						NOT NULL,
		mun_FechaCrea		DATETIME				DEFAULT GETDATE(),
		mun_UsuarioModi		INT,
		mun_FechaModi		DATETIME

		CONSTRAINT FK_Gral_tbMunicipios_mun_depID_Gral_tbDepartamentos_dep_ID	FOREIGN KEY (mun_depID) REFERENCES Gral.tbDepartamentos (dep_ID)
);


CREATE TABLE Gral.tbSucursales (
		suc_Id				INT IDENTITY(1,1)	NOT NULL PRIMARY KEY,
		suc_Descripcion		NVARCHAR(100)		NOT NULL,
		suc_Municipio		INT					NOT NULL,

		suc_UsuCrea			INT,
		suc_FechaCrea		DATETIME			DEFAULT GETDATE(),
		suc_usuModi			INT,
		suc_FechaModi		DATETIME,
		suc_Estado			BIT DEFAULT 1,

		CONSTRAINT FK_Maqui_tbSucursales_Gral_tbMunicipios FOREIGN KEY (suc_Municipio) REFERENCES Gral.tbMunicipios(mun_Id)
);



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
		CONSTRAINT FK_Gral_tbEmpleados_emp_EstadoCivil_Gral_tbEstadoCivil_est_ID			FOREIGN KEY (emp_EstadoCivil)	REFERENCES Gral.tbEstadoCivil (est_ID)
);

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
		CONSTRAINT FK_Gral_tbClientes_cli_EstadoCivil_Gral_tbEstadoCivil_est_ID	FOREIGN KEY (cli_EstadoCivil)	REFERENCES Gral.tbEstadoCivil (est_ID)
);

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

		CONSTRAINT	UQ_Gral_tbUsuarios_usu_Usuario	UNIQUE (usu_Usuario),
		CONSTRAINT	FK_Gral_tbUsuarios_usu_empID_Gral_tbEmpleados_emp_ID	FOREIGN KEY (usu_empID) REFERENCES Gral.tbEmpleados (emp_ID)

)





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
		prv_Direccion			NVARCHAR(200)		NOT NULL,

		prv_UsuarioCrea			INT					NOT NULL,
		prv_FechaCrea		    DATETIME			DEFAULT GETDATE(),
		prv_UsuarioModi			INT,
		prv_FechaModi		    DATETIME,
		prv_Estado			    BIT					DEFAULT 1,

		
		CONSTRAINT PK_Maqui_tbprveedores_Gral_tbMunicipios_prv_Municipio	FOREIGN KEY (prv_Municipio)	    REFERENCES Gral.tbMunicipios  (mun_ID),

);








CREATE TABLE Maqui.tbCategorias(
		cat_Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		cat_Descripcion NVARCHAR(100) NOT NULL,

		cat_UsuCrea INT,
		cat_FechaCrea DATETIME DEFAULT GETDATE(),
		cat_UsuModi INT,
		cat_FechaModi DATETIME,
		cat_Estado BIT DEFAULT 1
);






CREATE TABLE Maqui.tbMetodoPago (
		met_Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		met_Descripcion NVARCHAR(100) NOT NULL,

		met_UsuCrea INT,
		met_FechaCrea DATETIME DEFAULT GETDATE(),
		met_usuModi INT,
		met_FechaModi DATETIME,
		met_Estado BIT DEFAULT 1
);






CREATE TABLE Maqui.tbProductos(
		pro_Id				INT IDENTITY(1,1) PRIMARY KEY	NOT NULL,
		pro_Codigo			NVARCHAR(100)					NOT NULL,
		pro_Nombre			NVARCHAR(100)					NOT NULL,
		pro_StockInicial	NVARCHAR(100)					NOT NULL,
		pro_Precio			DECIMAL(18,2)					NOT NULL,
		pro_Proveedor		INT,

		pro_usuCrea			INT,
		pro_FechaCrea		DATETIME						DEFAULT GETDATE(),
		pro_UsuModi			INT,
		pro_FechaModi		DATETIME,
		pro_Estado			BIT								DEFAULT 1

		CONSTRAINT UK_Maqui_tbProductos_pro_Codigo UNIQUE(pro_Codigo),
		CONSTRAINT FK_Maqui_tbProductos_Maqui_tbProveedores_pro_Proveedor FOREIGN KEY (pro_Proveedor) REFERENCES Maqui.tbProveedores(prv_Id)
);






CREATE TABLE Maqui.tbCategoriaProductos(
		cpr_Id				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		cpr_Categoria		INT NOT NULL,
		cpr_Producto		INT NOT NULL,
		
		cpr_UsuCrea			INT,
		cpr_FechaCrea		DATETIME DEFAULT GETDATE(),
		cpr_usuModi			INT,
		cpr_FechaModi		DATETIME DEFAULT 1

		CONSTRAINT FK_Maqui_tbCategoriaProductos_Maqui_tbCategorias_cpr_Categoria	FOREIGN KEY (cpr_Categoria) REFERENCES Maqui.tbCategorias(cat_Id),
		CONSTRAINT FK_Maqui_tbCategoriaProductos_Maqui_tbProductos_cpr_Producto		FOREIGN KEY (cpr_Producto)	REFERENCES Maqui.tbProductos(pro_Id)
);





CREATE TABLE Maqui.tbInventario(
		inv_Id				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		inv_Producto		INT NOT NULL,
		inv_Cantidad		INT NOT NULL,
		

		inv_UsuCrea			INT,
		inv_FechaCrea		DATETIME DEFAULT GETDATE(),
		inv_usuModi			INT,
		inv_FechaModi		DATETIME

		CONSTRAINT FK_Maqui_tbInventario_Maqui_tbProducto FOREIGN KEY (inv_Producto) REFERENCES Maqui.tbProductos(pro_Id)
);





CREATE TABLE Maqui.tbVentas(
		ven_Id				INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
		ven_Cliente			INT NOT NULL,
		ven_Fecha			DATETIME,
		ven_Sucursal		INT NOT NULL,
		ven_MetodoPago		INT NOT NULL,


		ven_UsuCrea			INT,
		ven_FechaCrea		DATETIME DEFAULT GETDATE(),
		ven_UsuModi			INT,
		ven_FechaModi		DATETIME,
		ven_Estado			BIT DEFAULT 1

		CONSTRAINT FK_Maqui_tbVentas_Gral_tbClientes_ven_Cliente		FOREIGN KEY (ven_Cliente)		REFERENCES Gral.tbClientes(cli_Id),
		CONSTRAINT FK_Maqui_tbVentas_Maqui_tbSucursales_ven_Sucursal	FOREIGN KEY (ven_Sucursal)		REFERENCES  Gral.tbSucursales (suc_Id),
		CONSTRAINT FK_Maqui_tbVentas_Maqui_tbMetodoPago_ven_MetodoPago	FOREIGN KEY (ven_MetodoPago)	REFERENCES Maqui.tbMetodoPago (met_Id)
);






CREATE TABLE Maqui.tbVentasDetalle(
		vde_Id			INT IDENTITY(1,1)	NOT NULL PRIMARY KEY,
		vde_VentaId		INT					NOT NULL,
		vde_Producto	INT					NOT NULL,
		vde_Precio		DECIMAL(18,2)		NOT NULL,
		vde_Cantidad	INT					NOT NULL,

		vde_UsuCrea		INT,
		vde_FechaCrea	DATETIME			DEFAULT GETDATE(),
		vde_UsuModi		INT,
		vde_FechaModi	DATETIME,
		vde_Estado		BIT					DEFAULT 1

		CONSTRAINT FK_Maqui_tbVentas_MaquiDetalles_tbVentasDetalle_VD_VentaId	FOREIGN KEY (vde_VentaId)		REFERENCES Maqui.tbVentas(ven_Id),
		CONSTRAINT FK_Maqui_tbVentasDetalles_tbMaqui_Produtos_VD_Producto		FOREIGN KEY (vde_Producto)		REFERENCES Maqui.tbProductos(pro_Id),
);
GO


















/************************UDPS************************/

CREATE OR ALTER PROC UDP_tbEstadosCiviles_Crear(
@est_Descripcion NVARCHAR(100),
@est_UsuCrea INT)
AS BEGIN

DECLARE @est_UsuModi INT = NULL;
DECLARE @est_FechaCrea DATETIME = GETDATE();
DECLARE @est_FechaModi DATETIME = NULL;

INSERT INTO Gral.tbEstadoCivil
VALUES  (@est_Descripcion,
		 @est_UsuCrea,
		 @est_FechaCrea,
		 @est_UsuModi,
		 @est_FechaModi
		);
END
GO


CREATE OR ALTER PROC UDP_tbDepartamentos_Crear(
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


CREATE OR ALTER PROC UDP_tbMunicipios_Crear(
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


CREATE OR ALTER PROC UDP_Empleados_Crear(
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




CREATE OR ALTER PROC UDP_tbClientes_Crear(
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




CREATE OR ALTER PROC UDP_tbUsuarios_Crear(
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