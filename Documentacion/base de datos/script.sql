USE [master]
GO
/****** Object:  Database [iCrash]    Script Date: 03/12/2022 12:39:34 p. m. ******/
CREATE DATABASE [iCrash]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'iCrash', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\iCrash.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'iCrash_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\iCrash_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [iCrash] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [iCrash].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [iCrash] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [iCrash] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [iCrash] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [iCrash] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [iCrash] SET ARITHABORT OFF 
GO
ALTER DATABASE [iCrash] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [iCrash] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [iCrash] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [iCrash] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [iCrash] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [iCrash] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [iCrash] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [iCrash] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [iCrash] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [iCrash] SET  DISABLE_BROKER 
GO
ALTER DATABASE [iCrash] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [iCrash] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [iCrash] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [iCrash] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [iCrash] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [iCrash] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [iCrash] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [iCrash] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [iCrash] SET  MULTI_USER 
GO
ALTER DATABASE [iCrash] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [iCrash] SET DB_CHAINING OFF 
GO
ALTER DATABASE [iCrash] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [iCrash] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [iCrash] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [iCrash] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [iCrash] SET QUERY_STORE = OFF
GO
USE [iCrash]
GO
/****** Object:  User [iCrashUser]    Script Date: 03/12/2022 12:39:35 p. m. ******/
CREATE USER [iCrashUser] FOR LOGIN [iCrashUser] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [icrash]    Script Date: 03/12/2022 12:39:35 p. m. ******/
CREATE USER [icrash] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [iCrashUser]
GO
ALTER ROLE [db_owner] ADD MEMBER [icrash]
GO
/****** Object:  Table [dbo].[Cobertura]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
/****** Object:  Table [dbo].[Conductor]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
/****** Object:  Table [dbo].[Dictamen]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
/****** Object:  Table [dbo].[Empleado]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
/****** Object:  Table [dbo].[EntidadFederativa]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [clave_unq] UNIQUE NONCLUSTERED 
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Imagen]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
/****** Object:  Table [dbo].[Involucrado]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
/****** Object:  Table [dbo].[Marca]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
/****** Object:  Table [dbo].[Municipio]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Municipio_EntidadFederativa] UNIQUE NONCLUSTERED 
(
	[clave] ASC,
	[idEntidadFederativa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plazo]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
/****** Object:  Table [dbo].[Poliza]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
/****** Object:  Table [dbo].[ReporteSiniestro]    Script Date: 03/12/2022 12:39:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReporteSiniestro](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[estatus] [varchar](50) NOT NULL,
	[fecha] [date] NOT NULL,
	[idMunicipio] [int] NOT NULL,
	[latitud] [float] NOT NULL,
	[longitud] [float] NOT NULL,
	[idPoliza] [int] NOT NULL,
	[idEmpleado] [int] NULL,
	[idDictamen] [int] NULL,
 CONSTRAINT [PK_ReporteSiniestro] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [Usuario_pk] UNIQUE NONCLUSTERED 
(
	[idConductor] ASC,
	[idEmpleado] ASC,
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vehiculo]    Script Date: 03/12/2022 12:39:35 p. m. ******/
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
USE [master]
GO
ALTER DATABASE [iCrash] SET  READ_WRITE 
GO
