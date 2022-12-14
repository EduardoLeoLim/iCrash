USE [iCrash]
GO
/****** Object:  User [icrash]    Script Date: 14/12/2022 11:12:10 p. m. ******/
CREATE USER [icrash] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [iCrashUser]    Script Date: 14/12/2022 11:12:10 p. m. ******/
CREATE USER [iCrashUser] FOR LOGIN [iCrashUser] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [icrash]
GO
ALTER ROLE [db_owner] ADD MEMBER [iCrashUser]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 14/12/2022 11:12:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellidoPaterno] [varchar](50) NOT NULL,
	[apellidoMaterno] [varchar](50) NOT NULL,
	[nombreUsuario] [varchar](50) NOT NULL,
	[claveAcceso] [varchar](50) NOT NULL,
	[estado] [int] NULL,
	[idConductor] [int] NULL,
	[idEmpleado] [int] NULL,
	[role] [int] NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Poliza]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Poliza](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precioFinal] [float] NOT NULL,
	[idConductor] [int] NOT NULL,
	[idPlazo] [int] NOT NULL,
	[idCobertura] [int] NOT NULL,
 CONSTRAINT [PK_Poliza] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReporteSiniestro]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReporteSiniestro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estatus] [varchar](50) NOT NULL,
	[fechaRegistro] [date] NOT NULL,
	[idMunicipio] [int] NOT NULL,
	[latitud] [float] NOT NULL,
	[longitud] [float] NOT NULL,
	[idPoliza] [int] NOT NULL,
	[idEmpleado] [int] NULL,
	[idDictamen] [int] NULL,
	[horaAccidente] [datetime] NOT NULL,
 CONSTRAINT [PK_ReporteSiniestro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[ReporteSiniestroDetalle]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[ReporteSiniestroDetalle] as
SELECT rs.*, u.idConductor, u.nombre AS nombreConductor, u.apellidoPaterno, u.apellidoMaterno FROM ReporteSiniestro AS rs INNER JOIN Poliza AS p on (rs.idPoliza = p.id) INNER JOIN Usuario u on p.idConductor = u.idConductor
GO
/****** Object:  Table [dbo].[Cobertura]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cobertura](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[precio] [float] NOT NULL,
	[tipo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Cobertura] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Conductor]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Conductor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[correo] [varchar](100) NOT NULL,
	[numLicencia] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Conductor] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dictamen]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dictamen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[descripcion] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Dictamen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cargo] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EntidadFederativa]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntidadFederativa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_EntidadFederativa] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagen]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagen](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[idReporteSiniestro] [int] NOT NULL,
	[urlImagen] [varchar](max) NOT NULL,
 CONSTRAINT [PK_imagen] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Involucrado]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Involucrado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idReporteSiniestro] [int] NOT NULL,
	[idVehiculo] [int] NULL,
 CONSTRAINT [PK_involucrado] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Marca]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Municipio]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipio](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[clave] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[idEntidadFederativa] [int] NOT NULL,
 CONSTRAINT [PK_Municipio] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plazo]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plazo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[duracion] [int] NULL,
	[nombre] [varchar](50) NULL,
	[precio] [float] NULL,
 CONSTRAINT [PK_Plazo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 14/12/2022 11:12:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vehiculo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[año] [int] NOT NULL,
	[color] [varchar](50) NOT NULL,
	[idMarca] [int] NOT NULL,
	[modelo] [varchar](50) NOT NULL,
	[numPlacas] [varchar](10) NOT NULL,
	[numSerie] [varchar](20) NOT NULL,
	[idPoliza] [int] NULL,
 CONSTRAINT [PK_Vehiculo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Cobertura] ON 

INSERT [dbo].[Cobertura] ([id], [nombre], [precio], [tipo]) VALUES (1, N'Basica', 10000, N'Cobertura limitada')
INSERT [dbo].[Cobertura] ([id], [nombre], [precio], [tipo]) VALUES (2, N'Estándar', 12000, N'Cobertura a riesgos nombrados')
INSERT [dbo].[Cobertura] ([id], [nombre], [precio], [tipo]) VALUES (5, N'Premium', 15000, N'Cobertura todo riesgo')
SET IDENTITY_INSERT [dbo].[Cobertura] OFF
GO
SET IDENTITY_INSERT [dbo].[Conductor] ON 

INSERT [dbo].[Conductor] ([id], [correo], [numLicencia]) VALUES (1, N'zS19014029@estudiantes.uv.mx', N'C123456789')
INSERT [dbo].[Conductor] ([id], [correo], [numLicencia]) VALUES (2, N'zS19014030@estudiantes.uv.mx', N'C234567890')
INSERT [dbo].[Conductor] ([id], [correo], [numLicencia]) VALUES (3, N'zS19014031@estudiantes.uv.mx', N'C345678901')
INSERT [dbo].[Conductor] ([id], [correo], [numLicencia]) VALUES (4, N'zS19014032@estudiantes.uv.mx', N'C456789012')
INSERT [dbo].[Conductor] ([id], [correo], [numLicencia]) VALUES (5, N'zS19014033@estudiantes.uv.mx', N'C567890123')
SET IDENTITY_INSERT [dbo].[Conductor] OFF
GO
SET IDENTITY_INSERT [dbo].[Dictamen] ON 

INSERT [dbo].[Dictamen] ([id], [fecha], [descripcion]) VALUES (15, CAST(N'2022-12-14T00:00:00.000' AS DateTime), N'Se valido el reporte siniestro')
SET IDENTITY_INSERT [dbo].[Dictamen] OFF
GO
SET IDENTITY_INSERT [dbo].[Empleado] ON 

INSERT [dbo].[Empleado] ([id], [cargo]) VALUES (1, N'Ajustador')
INSERT [dbo].[Empleado] ([id], [cargo]) VALUES (2, N'EjecutivoAsistencia')
INSERT [dbo].[Empleado] ([id], [cargo]) VALUES (3, N'Administrador')
INSERT [dbo].[Empleado] ([id], [cargo]) VALUES (4, N'Ajustador')
SET IDENTITY_INSERT [dbo].[Empleado] OFF
GO
SET IDENTITY_INSERT [dbo].[EntidadFederativa] ON 

INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (1, 1, N'Aguascalientes')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (2, 2, N'Baja California')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (3, 3, N'Baja California Sur')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (4, 4, N'Campeche')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (5, 5, N'Coahuila de Zaragoza')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (6, 6, N'Colima')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (7, 7, N'Chiapas')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (8, 8, N'Chihuahua')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (9, 9, N'Distrito Federal')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (10, 10, N'Durango')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (11, 11, N'Guanajuato')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (12, 12, N'Guerrero')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (13, 13, N'Hidalgo')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (14, 14, N'Jalisco')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (15, 15, N'México')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (16, 16, N'Michoacán de Ocampo')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (17, 17, N'Morelos')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (18, 18, N'Nayarit')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (19, 19, N'Nuevo León')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (20, 20, N'Oaxaca de Juárez')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (21, 21, N'Puebla')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (22, 22, N'Querétaro')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (23, 23, N'Quintana Roo')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (24, 24, N'San Luis Potosí')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (25, 25, N'Sinaloa')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (26, 26, N'Sonora')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (27, 27, N'Tabasco')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (28, 28, N'Tamaulipas')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (29, 29, N'Tlaxcala')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (30, 30, N'Veracruz de Ignacio de la Llave')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (31, 31, N'Yucatán')
INSERT [dbo].[EntidadFederativa] ([id], [clave], [nombre]) VALUES (32, 32, N'Zacatecas')
SET IDENTITY_INSERT [dbo].[EntidadFederativa] OFF
GO
SET IDENTITY_INSERT [dbo].[Imagen] ON 

INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (1, 2, N'2-1.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (2, 2, N'2-2.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (3, 2, N'2-3.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (4, 2, N'2-4.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (5, 7, N'7-1.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (6, 7, N'7-2.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (7, 7, N'7-3.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (8, 7, N'7-4.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (9, 8, N'8-1.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (10, 8, N'8-2.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (11, 8, N'8-3.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (12, 8, N'8-4.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (13, 8, N'8-5.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (14, 9, N'9-1.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (15, 9, N'9-2.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (16, 9, N'9-3.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (17, 9, N'9-4.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (18, 10, N'10-1.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (19, 10, N'10-2.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (20, 10, N'10-3.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (21, 10, N'10-4.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (22, 11, N'11-1.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (23, 11, N'11-2.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (24, 11, N'11-3.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (25, 11, N'11-4.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (26, 12, N'12-1.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (27, 12, N'12-2.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (28, 12, N'12-3.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (29, 12, N'12-4.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (30, 12, N'12-5.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (31, 13, N'13-1.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (32, 13, N'13-2.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (33, 13, N'13-3.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (34, 13, N'13-4.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (35, 13, N'13-5.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (36, 14, N'14-1.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (37, 14, N'14-2.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (38, 14, N'14-3.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (39, 14, N'14-4.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (40, 14, N'14-5.jpg')
INSERT [dbo].[Imagen] ([id], [idReporteSiniestro], [urlImagen]) VALUES (41, 14, N'14-6.jpg')
SET IDENTITY_INSERT [dbo].[Imagen] OFF
GO
SET IDENTITY_INSERT [dbo].[Involucrado] ON 

INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (3, N'Anonimo', 2, NULL)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (4, N'Juan Perez Sanchez', 2, 12)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (6, N'Raul Arturo Peredo', 2, NULL)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (7, N'Anonimo', 7, NULL)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (8, N'Anonimo', 7, NULL)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (9, N'Eder Ivan Negrete Garcia', 8, 13)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (10, N'Javier Alberto Calderon Blas', 9, 14)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (11, N'Anonimo', 9, NULL)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (12, N'Angel Eduardo Martinez Leo Lim', 10, NULL)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (13, N'Victor Torres', 10, 15)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (14, N'Anonimo', 11, NULL)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (15, N'Marco Fabri Alcantar', 11, 18)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (16, N'Anonimo', 12, NULL)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (17, N'Anonimo', 12, NULL)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (18, N'Aldo Rico Canseco', 13, NULL)
INSERT [dbo].[Involucrado] ([id], [nombre], [idReporteSiniestro], [idVehiculo]) VALUES (19, N'Alfonso Rodriguez', 14, 19)
SET IDENTITY_INSERT [dbo].[Involucrado] OFF
GO
SET IDENTITY_INSERT [dbo].[Marca] ON 

INSERT [dbo].[Marca] ([id], [nombre]) VALUES (1, N'Ferrari')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (2, N'BMW')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (3, N'Honda')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (4, N'Ford')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (5, N'Jeep')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (6, N'Holden')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (7, N'Chevrolet')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (8, N'Suzuki')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (9, N'Subaru')
INSERT [dbo].[Marca] ([id], [nombre]) VALUES (10, N'Toyota')
SET IDENTITY_INSERT [dbo].[Marca] OFF
GO
SET IDENTITY_INSERT [dbo].[Municipio] ON 

INSERT [dbo].[Municipio] ([id], [clave], [nombre], [idEntidadFederativa]) VALUES (1, 1, N'Acajete', 30)
INSERT [dbo].[Municipio] ([id], [clave], [nombre], [idEntidadFederativa]) VALUES (2, 87, N'Xalapa', 30)
INSERT [dbo].[Municipio] ([id], [clave], [nombre], [idEntidadFederativa]) VALUES (3, 2, N'Acatlan', 30)
INSERT [dbo].[Municipio] ([id], [clave], [nombre], [idEntidadFederativa]) VALUES (4, 4, N'Actopan', 30)
INSERT [dbo].[Municipio] ([id], [clave], [nombre], [idEntidadFederativa]) VALUES (5, 10, N'Altotonga', 30)
INSERT [dbo].[Municipio] ([id], [clave], [nombre], [idEntidadFederativa]) VALUES (7, 11, N'Alvarado', 30)
INSERT [dbo].[Municipio] ([id], [clave], [nombre], [idEntidadFederativa]) VALUES (8, 16, N'La Antigua', 30)
INSERT [dbo].[Municipio] ([id], [clave], [nombre], [idEntidadFederativa]) VALUES (9, 17, N'Apazapan', 30)
INSERT [dbo].[Municipio] ([id], [clave], [nombre], [idEntidadFederativa]) VALUES (10, 18, N'Aquila', 30)
SET IDENTITY_INSERT [dbo].[Municipio] OFF
GO
SET IDENTITY_INSERT [dbo].[Plazo] ON 

INSERT [dbo].[Plazo] ([id], [duracion], [nombre], [precio]) VALUES (1, 1, N'Un año', 3000)
INSERT [dbo].[Plazo] ([id], [duracion], [nombre], [precio]) VALUES (2, 2, N'Dos años', 5800)
INSERT [dbo].[Plazo] ([id], [duracion], [nombre], [precio]) VALUES (3, 3, N'Tres años', 8500)
SET IDENTITY_INSERT [dbo].[Plazo] OFF
GO
SET IDENTITY_INSERT [dbo].[Poliza] ON 

INSERT [dbo].[Poliza] ([id], [nombre], [precioFinal], [idConductor], [idPlazo], [idCobertura]) VALUES (1, N'Seguro limitado', 30000, 2, 1, 1)
INSERT [dbo].[Poliza] ([id], [nombre], [precioFinal], [idConductor], [idPlazo], [idCobertura]) VALUES (2, N'Seguro para riesgos nombrados', 35600, 2, 2, 2)
INSERT [dbo].[Poliza] ([id], [nombre], [precioFinal], [idConductor], [idPlazo], [idCobertura]) VALUES (4, N'Seguro para TODO', 70500, 2, 3, 5)
INSERT [dbo].[Poliza] ([id], [nombre], [precioFinal], [idConductor], [idPlazo], [idCobertura]) VALUES (5, N'Seguro premium', 15000, 1, 1, 5)
INSERT [dbo].[Poliza] ([id], [nombre], [precioFinal], [idConductor], [idPlazo], [idCobertura]) VALUES (6, N'Seguro chafa', 31600, 1, 2, 1)
INSERT [dbo].[Poliza] ([id], [nombre], [precioFinal], [idConductor], [idPlazo], [idCobertura]) VALUES (7, N'Seguro barato', 55500, 3, 3, 1)
INSERT [dbo].[Poliza] ([id], [nombre], [precioFinal], [idConductor], [idPlazo], [idCobertura]) VALUES (8, N'Seguro normal', 15000, 4, 1, 2)
INSERT [dbo].[Poliza] ([id], [nombre], [precioFinal], [idConductor], [idPlazo], [idCobertura]) VALUES (9, N'Seguro ferrari', 41600, 4, 2, 5)
INSERT [dbo].[Poliza] ([id], [nombre], [precioFinal], [idConductor], [idPlazo], [idCobertura]) VALUES (10, N'Seguro camioneta', 15000, 5, 1, 2)
SET IDENTITY_INSERT [dbo].[Poliza] OFF
GO
SET IDENTITY_INSERT [dbo].[ReporteSiniestro] ON 

INSERT [dbo].[ReporteSiniestro] ([id], [nombre], [estatus], [fechaRegistro], [idMunicipio], [latitud], [longitud], [idPoliza], [idEmpleado], [idDictamen], [horaAccidente]) VALUES (2, N'Faros rotos', N'Dictaminado', CAST(N'2022-12-10' AS Date), 2, 19.5437863, 96.910191, 1, 1, 15, CAST(N'2022-12-09T12:47:15.000' AS DateTime))
INSERT [dbo].[ReporteSiniestro] ([id], [nombre], [estatus], [fechaRegistro], [idMunicipio], [latitud], [longitud], [idPoliza], [idEmpleado], [idDictamen], [horaAccidente]) VALUES (7, N'Choque frontal', N'Pendiente', CAST(N'2020-10-12' AS Date), 2, 19.5349188, -96.9147849, 2, 1, NULL, CAST(N'2020-10-13T13:56:15.000' AS DateTime))
INSERT [dbo].[ReporteSiniestro] ([id], [nombre], [estatus], [fechaRegistro], [idMunicipio], [latitud], [longitud], [idPoliza], [idEmpleado], [idDictamen], [horaAccidente]) VALUES (8, N'Choque lateral semaforo', N'Pendiente', CAST(N'2021-11-11' AS Date), 1, 19.5349188, -96.9147849, 4, 1, NULL, CAST(N'2021-12-01T10:00:00.000' AS DateTime))
INSERT [dbo].[ReporteSiniestro] ([id], [nombre], [estatus], [fechaRegistro], [idMunicipio], [latitud], [longitud], [idPoliza], [idEmpleado], [idDictamen], [horaAccidente]) VALUES (9, N'Choque poliza premium', N'Pendiente', CAST(N'2021-09-14' AS Date), 2, 19.5349188, -96.9147849, 5, 4, NULL, CAST(N'2021-09-20T12:00:00.000' AS DateTime))
INSERT [dbo].[ReporteSiniestro] ([id], [nombre], [estatus], [fechaRegistro], [idMunicipio], [latitud], [longitud], [idPoliza], [idEmpleado], [idDictamen], [horaAccidente]) VALUES (10, N'Luces traseras', N'Pendiente', CAST(N'2022-12-14' AS Date), 1, 19.5339829, -96.9164646, 6, 4, NULL, CAST(N'2022-12-14T18:00:00.000' AS DateTime))
INSERT [dbo].[ReporteSiniestro] ([id], [nombre], [estatus], [fechaRegistro], [idMunicipio], [latitud], [longitud], [idPoliza], [idEmpleado], [idDictamen], [horaAccidente]) VALUES (11, N'Volante y asiento copiloto', N'Pendiente', CAST(N'2022-01-08' AS Date), 2, 19.5322355, -96.9160433, 7, 1, NULL, CAST(N'2022-02-01T09:00:00.000' AS DateTime))
INSERT [dbo].[ReporteSiniestro] ([id], [nombre], [estatus], [fechaRegistro], [idMunicipio], [latitud], [longitud], [idPoliza], [idEmpleado], [idDictamen], [horaAccidente]) VALUES (12, N'Choque asiento conductor', N'Pendiente', CAST(N'2020-11-15' AS Date), 2, 19.5317835, -96.9157612, 8, 4, NULL, CAST(N'2020-12-10T20:00:00.000' AS DateTime))
INSERT [dbo].[ReporteSiniestro] ([id], [nombre], [estatus], [fechaRegistro], [idMunicipio], [latitud], [longitud], [idPoliza], [idEmpleado], [idDictamen], [horaAccidente]) VALUES (13, N'Luces delanteras', N'Pendiente', CAST(N'2021-07-20' AS Date), 1, 19.5298561, -96.925201, 9, 1, NULL, CAST(N'2021-07-20T11:00:00.000' AS DateTime))
INSERT [dbo].[ReporteSiniestro] ([id], [nombre], [estatus], [fechaRegistro], [idMunicipio], [latitud], [longitud], [idPoliza], [idEmpleado], [idDictamen], [horaAccidente]) VALUES (14, N'Perdida total', N'Pendiente', CAST(N'2022-08-08' AS Date), 2, 19.537054, -96.9471384, 10, 4, NULL, CAST(N'2022-12-20T19:30:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ReporteSiniestro] OFF
GO
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([id], [nombre], [apellidoPaterno], [apellidoMaterno], [nombreUsuario], [claveAcceso], [estado], [idConductor], [idEmpleado], [role]) VALUES (1, N'Raul Arturo', N'Peredo', N'Estudillo', N'2282519509', N'1234', 0, 1, NULL, 1)
INSERT [dbo].[Usuario] ([id], [nombre], [apellidoPaterno], [apellidoMaterno], [nombreUsuario], [claveAcceso], [estado], [idConductor], [idEmpleado], [role]) VALUES (2, N'Eder Ivan', N'Negrete', N'Garcia', N'2282144903', N'123', 0, 2, NULL, 1)
INSERT [dbo].[Usuario] ([id], [nombre], [apellidoPaterno], [apellidoMaterno], [nombreUsuario], [claveAcceso], [estado], [idConductor], [idEmpleado], [role]) VALUES (3, N'Raul Arturo', N'Peredo', N'Estudillo', N'2282519509', N'1234', 0, 3, NULL, 1)
INSERT [dbo].[Usuario] ([id], [nombre], [apellidoPaterno], [apellidoMaterno], [nombreUsuario], [claveAcceso], [estado], [idConductor], [idEmpleado], [role]) VALUES (4, N'Angel Eduardo', N'Martinez', N'Leo Lim', N'2283466880', N'123456', 0, 4, NULL, 1)
INSERT [dbo].[Usuario] ([id], [nombre], [apellidoPaterno], [apellidoMaterno], [nombreUsuario], [claveAcceso], [estado], [idConductor], [idEmpleado], [role]) VALUES (5, N'David Alexander', N'Mijangos', N'Paredes', N'9721106501', N'1234567', 0, 5, NULL, 1)
INSERT [dbo].[Usuario] ([id], [nombre], [apellidoPaterno], [apellidoMaterno], [nombreUsuario], [claveAcceso], [estado], [idConductor], [idEmpleado], [role]) VALUES (6, N'Victor Manuel', N'Arredondo', N'Reyes', N'2282393962', N'12345678', 0, NULL, 1, 2)
INSERT [dbo].[Usuario] ([id], [nombre], [apellidoPaterno], [apellidoMaterno], [nombreUsuario], [claveAcceso], [estado], [idConductor], [idEmpleado], [role]) VALUES (7, N'Daniel Abraham', N'Cervantes', N'Bueno', N'5561151502', N'123456789', 0, NULL, 4, 2)
INSERT [dbo].[Usuario] ([id], [nombre], [apellidoPaterno], [apellidoMaterno], [nombreUsuario], [claveAcceso], [estado], [idConductor], [idEmpleado], [role]) VALUES (8, N'Estefania Berenice', N'Martinez', N'Ramirez', N'2283341976', N'1234567890', 0, NULL, 2, 4)
INSERT [dbo].[Usuario] ([id], [nombre], [apellidoPaterno], [apellidoMaterno], [nombreUsuario], [claveAcceso], [estado], [idConductor], [idEmpleado], [role]) VALUES (9, N'Mario Alberto', N'Hernandez', N'Perez', N'2288476038', N'0123', 0, NULL, 3, 3)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
GO
SET IDENTITY_INSERT [dbo].[Vehiculo] ON 

INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (1, 2018, N'azul', 3, N'CR-V', N'WLU-94-69', N'3G1SF2424WS188918', 1)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (2, 2005, N'negro', 3, N'Pilot', N'WLZ-07-20', N'4G2HG5346WG123467', 2)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (4, 2012, N'plateado', 5, N'Jeep Compass', N'KSL-32-32', N'32JSU3NFKCN', 4)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (6, 2015, N'rojo', 2, N'BMW Z4', N'KLD-34-52', N'83DHJG932KFLD', 5)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (7, 2008, N'azul', 8, N'CELERIO', N'NCL-59-78', N'89FKS83NV8SL', 6)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (8, 2007, N'negro', 9, N'Legacy ', N'VNL-89-00', N'89DKCI4NFIO9', 7)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (9, 2016, N'azul', 6, N'Holden Calibra', N'JHX-93-18', N'98CHE7X84MI8', 8)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (10, 2020, N'rojo', 1, N'Ferrari Purosangue', N'MNL-95-81', N'85XCGD6WHC7', 9)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (11, 2017, N'blanco', 10, N'Etios Aibo', N'NCJ-81-23', N'85JNV94NX93M', 10)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (12, 2013, N'negro', 3, N'Passport', N'NXK-91-57', N'84NV63BD93NXC', NULL)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (13, 2018, N'rosa', 6, N'Plus', N'NBJ-67-45', N'84NMV93NS03R', NULL)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (14, 2015, N'azul', 7, N'Chevrolet Captiva', N'GVG-35-26', N'656FNCU45N8', NULL)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (15, 2010, N'verde', 10, N'Lexus', N'KLH-86-85', N'967HGH38NSK', NULL)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (18, 2014, N'amarillo', 8, N'ERTIGA', N'OPI-57-75', N'94JC843NSO39', NULL)
INSERT [dbo].[Vehiculo] ([id], [año], [color], [idMarca], [modelo], [numPlacas], [numSerie], [idPoliza]) VALUES (19, 2019, N'azul', 7, N'Chevrolet Orlando', N'VJH-85-21', N'96MF94HD934D', NULL)
SET IDENTITY_INSERT [dbo].[Vehiculo] OFF
GO
/****** Object:  Index [clave_unq]    Script Date: 14/12/2022 11:12:17 p. m. ******/
ALTER TABLE [dbo].[EntidadFederativa] ADD  CONSTRAINT [clave_unq] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Municipio_EntidadFederativa]    Script Date: 14/12/2022 11:12:17 p. m. ******/
ALTER TABLE [dbo].[Municipio] ADD  CONSTRAINT [Municipio_EntidadFederativa] UNIQUE NONCLUSTERED 
(
	[clave] ASC,
	[idEntidadFederativa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [Usuario_pk]    Script Date: 14/12/2022 11:12:17 p. m. ******/
ALTER TABLE [dbo].[Usuario] ADD  CONSTRAINT [Usuario_pk] UNIQUE NONCLUSTERED 
(
	[idConductor] ASC,
	[idEmpleado] ASC,
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Usuario] ADD  DEFAULT ((1)) FOR [estado]
GO
ALTER TABLE [dbo].[Imagen]  WITH CHECK ADD  CONSTRAINT [FK_imagen_ReporteSiniestro] FOREIGN KEY([idReporteSiniestro])
REFERENCES [dbo].[ReporteSiniestro] ([id])
GO
ALTER TABLE [dbo].[Imagen] CHECK CONSTRAINT [FK_imagen_ReporteSiniestro]
GO
ALTER TABLE [dbo].[Involucrado]  WITH CHECK ADD  CONSTRAINT [FK_involucrado_ReporteSiniestro] FOREIGN KEY([idReporteSiniestro])
REFERENCES [dbo].[ReporteSiniestro] ([id])
GO
ALTER TABLE [dbo].[Involucrado] CHECK CONSTRAINT [FK_involucrado_ReporteSiniestro]
GO
ALTER TABLE [dbo].[Involucrado]  WITH CHECK ADD  CONSTRAINT [FK_Involucrado_Vehiculo] FOREIGN KEY([idVehiculo])
REFERENCES [dbo].[Vehiculo] ([id])
GO
ALTER TABLE [dbo].[Involucrado] CHECK CONSTRAINT [FK_Involucrado_Vehiculo]
GO
ALTER TABLE [dbo].[Municipio]  WITH CHECK ADD  CONSTRAINT [FK_Municipio_Municipio] FOREIGN KEY([idEntidadFederativa])
REFERENCES [dbo].[EntidadFederativa] ([id])
GO
ALTER TABLE [dbo].[Municipio] CHECK CONSTRAINT [FK_Municipio_Municipio]
GO
ALTER TABLE [dbo].[Poliza]  WITH CHECK ADD  CONSTRAINT [FK_Poliza_Cobertura] FOREIGN KEY([idCobertura])
REFERENCES [dbo].[Cobertura] ([id])
GO
ALTER TABLE [dbo].[Poliza] CHECK CONSTRAINT [FK_Poliza_Cobertura]
GO
ALTER TABLE [dbo].[Poliza]  WITH CHECK ADD  CONSTRAINT [FK_Poliza_Conductor] FOREIGN KEY([idConductor])
REFERENCES [dbo].[Conductor] ([id])
GO
ALTER TABLE [dbo].[Poliza] CHECK CONSTRAINT [FK_Poliza_Conductor]
GO
ALTER TABLE [dbo].[Poliza]  WITH CHECK ADD  CONSTRAINT [FK_Poliza_Plazo] FOREIGN KEY([idPlazo])
REFERENCES [dbo].[Plazo] ([id])
GO
ALTER TABLE [dbo].[Poliza] CHECK CONSTRAINT [FK_Poliza_Plazo]
GO
ALTER TABLE [dbo].[ReporteSiniestro]  WITH CHECK ADD  CONSTRAINT [FK_ReporteSiniestro_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([id])
GO
ALTER TABLE [dbo].[ReporteSiniestro] CHECK CONSTRAINT [FK_ReporteSiniestro_Empleado]
GO
ALTER TABLE [dbo].[ReporteSiniestro]  WITH CHECK ADD  CONSTRAINT [FK_ReporteSiniestro_Municipio] FOREIGN KEY([idMunicipio])
REFERENCES [dbo].[Municipio] ([id])
GO
ALTER TABLE [dbo].[ReporteSiniestro] CHECK CONSTRAINT [FK_ReporteSiniestro_Municipio]
GO
ALTER TABLE [dbo].[ReporteSiniestro]  WITH CHECK ADD  CONSTRAINT [FK_ReporteSiniestro_Poliza] FOREIGN KEY([idPoliza])
REFERENCES [dbo].[Poliza] ([id])
GO
ALTER TABLE [dbo].[ReporteSiniestro] CHECK CONSTRAINT [FK_ReporteSiniestro_Poliza]
GO
ALTER TABLE [dbo].[ReporteSiniestro]  WITH CHECK ADD  CONSTRAINT [ReporteSiniestro_Dictamen_null_fk] FOREIGN KEY([idDictamen])
REFERENCES [dbo].[Dictamen] ([id])
GO
ALTER TABLE [dbo].[ReporteSiniestro] CHECK CONSTRAINT [ReporteSiniestro_Dictamen_null_fk]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [Usuario_Conductor_null_fk] FOREIGN KEY([idConductor])
REFERENCES [dbo].[Conductor] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [Usuario_Conductor_null_fk]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [Usuario_Empleado_null_fk] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [Usuario_Empleado_null_fk]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Marca] FOREIGN KEY([idMarca])
REFERENCES [dbo].[Marca] ([id])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Marca]
GO
ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD  CONSTRAINT [FK_Vehiculo_Poliza] FOREIGN KEY([idPoliza])
REFERENCES [dbo].[Poliza] ([id])
GO
ALTER TABLE [dbo].[Vehiculo] CHECK CONSTRAINT [FK_Vehiculo_Poliza]
GO
