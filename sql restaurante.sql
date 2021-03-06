USE [master]
GO
/****** Object:  Database [Restorant BD]    Script Date: 30/11/2017 8:57:17 a. m. ******/
CREATE DATABASE [Restorant BD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Restorant BD', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Restorant BD.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Restorant BD_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\Restorant BD_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Restorant BD] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Restorant BD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Restorant BD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Restorant BD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Restorant BD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Restorant BD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Restorant BD] SET ARITHABORT OFF 
GO
ALTER DATABASE [Restorant BD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Restorant BD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Restorant BD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Restorant BD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Restorant BD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Restorant BD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Restorant BD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Restorant BD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Restorant BD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Restorant BD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Restorant BD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Restorant BD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Restorant BD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Restorant BD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Restorant BD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Restorant BD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Restorant BD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Restorant BD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Restorant BD] SET  MULTI_USER 
GO
ALTER DATABASE [Restorant BD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Restorant BD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Restorant BD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Restorant BD] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Restorant BD]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comentarios](
	[IdComentario] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[IdSucursal] [numeric](18, 0) NOT NULL,
	[NombreComenta] [varchar](50) NOT NULL,
	[Calificacion] [int] NOT NULL,
	[TextoComentario] [varchar](500) NOT NULL,
	[Aprobado] [bit] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Menu]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[IdMenu] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Imagen] [varchar](50) NOT NULL,
	[IdTipoComida] [numeric](18, 0) NOT NULL,
	[Precio] [numeric](18, 0) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provincas]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Provincas](
	[IdProvincia] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Pais] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursales]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sucursales](
	[IdSucursal] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL CONSTRAINT [DF_Sucursales_Nombre]  DEFAULT ('La Birra Bar'),
	[Mapa] [varchar](500) NOT NULL,
	[Imagen] [varchar](50) NOT NULL,
	[IdProvincia] [numeric](18, 0) NOT NULL,
	[Domicilio] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposComida]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposComida](
	[IdTipoComida] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[UltimoLogin] [date] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Comentarios] ON 

INSERT [dbo].[Comentarios] ([IdComentario], [IdSucursal], [NombreComenta], [Calificacion], [TextoComentario], [Aprobado]) VALUES (CAST(1 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'Jorge', 5, N'Buenisimo', 1)
INSERT [dbo].[Comentarios] ([IdComentario], [IdSucursal], [NombreComenta], [Calificacion], [TextoComentario], [Aprobado]) VALUES (CAST(2 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'Marcos', 5, N'muy recomendable', 1)
INSERT [dbo].[Comentarios] ([IdComentario], [IdSucursal], [NombreComenta], [Calificacion], [TextoComentario], [Aprobado]) VALUES (CAST(4 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'Prueba 2', 3, N'funciona?', 1)
INSERT [dbo].[Comentarios] ([IdComentario], [IdSucursal], [NombreComenta], [Calificacion], [TextoComentario], [Aprobado]) VALUES (CAST(5 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'prueba 3', 1, N'funciona?', 1)
INSERT [dbo].[Comentarios] ([IdComentario], [IdSucursal], [NombreComenta], [Calificacion], [TextoComentario], [Aprobado]) VALUES (CAST(6 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'brian', 5, N'hola', 1)
INSERT [dbo].[Comentarios] ([IdComentario], [IdSucursal], [NombreComenta], [Calificacion], [TextoComentario], [Aprobado]) VALUES (CAST(7 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'ian', 5, N'muy buena hamburguesa', 1)
INSERT [dbo].[Comentarios] ([IdComentario], [IdSucursal], [NombreComenta], [Calificacion], [TextoComentario], [Aprobado]) VALUES (CAST(8 AS Numeric(18, 0)), CAST(4 AS Numeric(18, 0)), N'guido chaica', 5, N'asdasdasd', 1)
INSERT [dbo].[Comentarios] ([IdComentario], [IdSucursal], [NombreComenta], [Calificacion], [TextoComentario], [Aprobado]) VALUES (CAST(9 AS Numeric(18, 0)), CAST(5 AS Numeric(18, 0)), N'ian', 1, N'asdasdad', 1)
SET IDENTITY_INSERT [dbo].[Comentarios] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Imagen], [IdTipoComida], [Precio]) VALUES (CAST(2 AS Numeric(18, 0)), N'Americana', N'Americana.jpg', CAST(1 AS Numeric(18, 0)), CAST(200 AS Numeric(18, 0)))
INSERT [dbo].[Menu] ([IdMenu], [Nombre], [Imagen], [IdTipoComida], [Precio]) VALUES (CAST(10002 AS Numeric(18, 0)), N'Extreme X', N'extreme_x.jpg', CAST(1 AS Numeric(18, 0)), CAST(210 AS Numeric(18, 0)))
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Provincas] ON 

INSERT [dbo].[Provincas] ([IdProvincia], [Nombre], [Pais]) VALUES (CAST(1 AS Numeric(18, 0)), N'Buenos Aires', N'Argentina')
INSERT [dbo].[Provincas] ([IdProvincia], [Nombre], [Pais]) VALUES (CAST(2 AS Numeric(18, 0)), N'Lima', N'Peru')
SET IDENTITY_INSERT [dbo].[Provincas] OFF
SET IDENTITY_INSERT [dbo].[Sucursales] ON 

INSERT [dbo].[Sucursales] ([IdSucursal], [Nombre], [Mapa], [Imagen], [IdProvincia], [Domicilio], [Telefono]) VALUES (CAST(4 AS Numeric(18, 0)), N'La Birra Bar', N'<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3283.106784412764!2d-58.42826088514696!3d-34.62674168045358!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x95bcca524bf715bb%3A0xea507af8f8ca2a7c!2sLa+Birra!5e0!3m2!1ses!2sar!4v1511435262492" width="600" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>', N'img2.jpg', CAST(1 AS Numeric(18, 0)), N'
Av. San Juan 4359, C1233ACA Buenos Aires', N'4123-5678')
SET IDENTITY_INSERT [dbo].[Sucursales] OFF
SET IDENTITY_INSERT [dbo].[TiposComida] ON 

INSERT [dbo].[TiposComida] ([IdTipoComida], [Nombre]) VALUES (CAST(1 AS Numeric(18, 0)), N'Hamburguesa')
SET IDENTITY_INSERT [dbo].[TiposComida] OFF
SET IDENTITY_INSERT [dbo].[Usuarios] ON 

INSERT [dbo].[Usuarios] ([IdUsuario], [Nombre], [Email], [Contraseña], [UltimoLogin]) VALUES (CAST(1 AS Numeric(18, 0)), N'Jorge', N'Admin', N'admin', CAST(N'2017-11-30' AS Date))
SET IDENTITY_INSERT [dbo].[Usuarios] OFF
/****** Object:  StoredProcedure [dbo].[AgregarComentario]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarComentario]
@pIdSucursal varchar(50),
@pNombreComenta varchar(50),
@pCalificacion Numeric(18,2),
@pTextoComentario varchar(500)
AS
BEGIN
	INSERT INTO Comentarios(IdSucursal, NombreComenta, Calificacion, TextoComentario, Aprobado) VALUES (@pIdSucursal, @pNombreComenta, @pCalificacion, @pTextoComentario, 0);
END



GO
/****** Object:  StoredProcedure [dbo].[AgregarProducto]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AgregarProducto]
@pNombre varchar(50),
@pImagen varchar(50),
@pIdTipoComida Numeric(18,0),
@pPrecio Numeric(18,0)
AS
BEGIN
	INSERT INTO Menu(Nombre, Imagen, IdTipoComida, Precio) VALUES (@pNombre, @pImagen, @pIdTipoComida, @pPrecio);
END







GO
/****** Object:  StoredProcedure [dbo].[AprobarComentario]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AprobarComentario]
@pIdComentario varchar(50),
@pAprobado bit
AS
BEGIN
	UPDATE Comentarios set Aprobado=@pAprobado Where IdComentario LIKE @pIdComentario
END



GO
/****** Object:  StoredProcedure [dbo].[ComentariosNoAprobados]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ComentariosNoAprobados]

AS
BEGIN
	SELECT * FROM Comentarios WHERE Aprobado = 0;
END

GO
/****** Object:  StoredProcedure [dbo].[CrearUsuario]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CrearUsuario]
@pNombre varchar(50),
@pEmail varchar(50),
@pContraseña varchar(100)
AS
BEGIN
	INSERT INTO Usuarios(Nombre, Email, Contraseña) VALUES (@pNombre, @pEmail, @pContraseña);
END







GO
/****** Object:  StoredProcedure [dbo].[EliminarComentario]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarComentario]
@pId varchar(50)
AS
BEGIN
	DELETE FROM Comentarios WHERE IdComentario = @pId
END

GO
/****** Object:  StoredProcedure [dbo].[EliminarSucursal]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EliminarSucursal]
@pId varchar(50)
AS
BEGIN
DELETE FROM Sucursales WHERE IdSucursal = @pId ;
END

GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Login]  
@pUsuario varchar(50),
@pContraseña varchar(50)
AS
BEGIN
	select * from Usuarios WHERE Email = @pUsuario AND Contraseña = @pContraseña
END


GO
/****** Object:  StoredProcedure [dbo].[NuevoLogin]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[NuevoLogin]
@pUsuario varchar(50)
AS
BEGIN
	UPDATE Usuarios set UltimoLogin=@pUsuario Where Nombre LIKE @pUsuario
END



GO
/****** Object:  StoredProcedure [dbo].[SucursalCompleta]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SucursalCompleta]
@pIdSucursal numeric(18,0)
AS
BEGIN
	select IdSucursal,Mapa,Domicilio,Imagen,Telefono,Provincas.Nombre from Sucursales
	INNER JOIN Provincas ON Sucursales.IdProvincia = Provincas.IdProvincia
	WHERE IdSucursal = @pIdSucursal
END


GO
/****** Object:  StoredProcedure [dbo].[TraerComentarios]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TraerComentarios]
@pId numeric(18,0)
AS
BEGIN
	select * from Comentarios WHERE IdSucursal = @pId AND Aprobado = 1 ORDER BY IdComentario DESC
END


GO
/****** Object:  StoredProcedure [dbo].[TraerMenu]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[TraerMenu] 
AS
BEGIN
	select IdMenu,Menu.Nombre,TiposComida.Nombre As TipoComida,Imagen,Precio from Menu 
	INNER JOIN TiposComida ON Menu.IdTipoComida = TiposComida.IdTipoComida;
END


GO
/****** Object:  StoredProcedure [dbo].[TraerSucursales]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TraerSucursales]
AS
BEGIN
	select * from Sucursales;
END



GO
/****** Object:  StoredProcedure [dbo].[UltimaConexion]    Script Date: 30/11/2017 8:57:17 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UltimaConexion]
@pID varchar(500)
AS
BEGIN
	UPDATE Usuarios SET UltimoLogin = GETDATE() WHERE IdUsuario = @pID;
END

GO
USE [master]
GO
ALTER DATABASE [Restorant BD] SET  READ_WRITE 
GO
